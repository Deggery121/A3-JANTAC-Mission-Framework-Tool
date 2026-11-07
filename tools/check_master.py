"""Validate the JANTAC master mission before compositions are built.

Exits non-zero (blocking the GitHub build) if any rule is broken.

usage: python tools/check_master.py [master_dir]
"""
import json
import os
import re
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import sqm  # noqa: E402

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
MASTER = sys.argv[1] if len(sys.argv) > 1 else os.path.join(ROOT, "master", "UnitLibrary.VR")
CONFIG = json.load(open(os.path.join(ROOT, "packages.json")))

INIT_RE = re.compile(r'^\[this, "([A-Za-z0-9]+_)([A-Za-z0-9]+)"\] call FNC_GearScript;'
                     r'(?: \[this, "(RED|BLUE|GREEN)"\] call FNC_Autocolor;)?$')
ACRE_PROP = '"acre_sys_radio_edenSetup"'
ALLOWED_UNIT_ATTRS = {"rank", "init", "description", "isPlayer", "isPlayable", "Inventory"}
LAYER_RE = re.compile(r"^([A-Za-z0-9]+_) \| ([A-Za-z0-9]+) \| HQ \+ (\d+) squads?$")

errors, warnings = [], []


def err(msg):
    errors.append(msg)


def classes(nodes):
    return [n for n in (nodes or []) if n["k"] == "class"]


def sub(node, name):
    c = sqm.get(node["body"], name)
    return c["body"] if c else None


def val(nodes, name):
    n = sqm.get(nodes, name)
    if not n:
        return None
    raw = n["raw"].strip()
    return sqm.decode_str(raw) if raw.startswith('"') else raw


# ---- loadouts ------------------------------------------------------------------
cust = os.path.join(MASTER, "customization")
gear = open(os.path.join(cust, "gear.sqf"), encoding="latin-1").read()
includes = re.findall(r'^\s*#include\s+"loadouts\\([^"]+)"', gear, re.M)
roles, prefix_file = {}, {}
for inc in includes:
    path = os.path.join(cust, "loadouts", inc)
    if not os.path.exists(path):
        err(f"gear.sqf includes loadouts\\{inc} but the file is missing")
        continue
    src = open(path, encoding="latin-1").read()
    pk = re.findall(r'#define\s+package\s+"(\w+)"', src)
    if len(pk) != 1:
        err(f"{inc}: expected exactly one '#define package', found {len(pk)}")
        continue
    pk = pk[0]
    if pk in prefix_file:
        err(f"prefix {pk} defined by both {prefix_file[pk]} and {inc}")
        continue
    prefix_file[pk] = inc
    roles[pk] = set(re.findall(r'case\s*\(\s*package\s*\+\s*"(\w+)"\s*\)', src))
for f in os.listdir(os.path.join(cust, "loadouts")):
    if f not in includes:
        warnings.append(f"loadouts\\{f} exists but is not included in gear.sqf")

# ---- mission -----------------------------------------------------------------
text = open(os.path.join(MASTER, "mission.sqm"), newline="").read()
root = sqm.parse(text)
if sqm.dumps(root) != text:
    warnings.append("mission.sqm formatting is non-standard (parsed fine)")
layers = classes(sqm.get(sqm.get(root, "Mission")["body"], "Entities")["body"])

ids = re.findall(r"^\t*id=(\d+);", text, re.M)
if len(ids) != len(set(ids)):
    err("duplicate entity ids in mission.sqm")

seen_prefix = set()
for layer in layers:
    if val(layer["body"], "dataType") != "Layer":
        err("every top-level entity must be inside a layer")
        continue
    lname = val(layer["body"], "name")
    if lname == CONFIG["infrastructure"]["layer"]:
        continue
    m = LAYER_RE.match(lname)
    if not m:
        err(f"layer '{lname}': name must be 'PREFIX_ | LOADOUT | HQ + N squads'")
        continue
    prefix, loadout, nsq = m.group(1), m.group(2), int(m.group(3))
    where = f"[{prefix}]"
    if prefix in seen_prefix:
        err(f"{where} more than one layer uses this prefix")
    seen_prefix.add(prefix)
    if prefix not in CONFIG["packages"]:
        err(f"{where} missing from packages.json")
    elif CONFIG["packages"][prefix]["loadout"] != loadout + ".sqf":
        err(f"{where} layer names {loadout}.sqf but packages.json says {CONFIG['packages'][prefix]['loadout']}")
    if prefix_file.get(prefix) != loadout + ".sqf":
        err(f"{where} prefix is defined by {prefix_file.get(prefix)}, layer names {loadout}.sqf")

    squads = {}
    sides = {val(g["body"], "side") for g in classes(sub(layer, "Entities"))}
    if len(sides) > 1:
        err(f"{where} groups are on different sides {sorted(sides)}; one package is one side")
    if sides - {"West", "East", "Independent"}:
        err(f"{where} side must be West, East or Independent, found {sorted(sides)}")
    for g in classes(sub(layer, "Entities")):
        if val(g["body"], "dataType") != "Group":
            err(f"{where} layer contains a non-group entity")
            continue
        units = classes(sub(g, "Entities"))
        sq, channels = None, set()
        for u in units:
            a = sub(u, "Attributes")
            desc, init = val(a, "description") or "", val(a, "init") or ""
            who = f"{where} '{desc}'"
            extra = {n["name"] for n in a} - ALLOWED_UNIT_ATTRS
            if extra:
                err(f"{who}: unexpected attributes {sorted(extra)}")
            if val(a, "isPlayable") != "1":
                err(f"{who}: not playable")
            inv = sqm.get(a, "Inventory")
            if not inv or inv["body"]:
                err(f"{who}: must have an empty Inventory (no equipment)")
            mi = INIT_RE.match(init)
            if not mi:
                err(f"{who}: init does not follow the standard: {init}")
                continue
            p, role, color = mi.groups()
            if p != prefix:
                err(f"{who}: uses prefix {p} inside the {prefix} layer")
            elif p in roles and role not in roles[p]:
                err(f"{who}: role {p}{role} does not exist in {prefix_file.get(p)}")
            if role == "MD" and color != "GREEN":
                err(f"{who}: medics must be GREEN")
            if role in ("SL", "PL") and color:
                err(f"{who}: SL/PL roles must have no team color")
            if role not in ("MD", "SL", "PL") and color == "GREEN":
                err(f"{who}: GREEN is reserved for medics")
            lm = re.search(r"@(.*)$", desc)
            if lm:
                if not re.fullmatch(r"1'\d+", lm.group(1)):
                    err(f"{who}: group tag must be @1'N")
                elif sq is not None:
                    err(f"{who}: two group tags in one group")
                else:
                    sq = int(lm.group(1)[2:])
            ca = classes(sub(u, "CustomAttributes"))
            props = [val(c["body"], "property") for c in ca]
            if props != ["acre_sys_radio_edenSetup"]:
                err(f"{who}: custom attributes must be exactly the ACRE radio setup, found {props}")
                continue
            data = sqm.get(sqm.get(ca[0]["body"], "Value")["body"], "data")["body"]
            cm = re.search(r'"ACRE_PRC343",\[1,(\d+)\]', val(data, "value"))
            if not cm:
                err(f"{who}: ACRE setup has no PRC-343 [1,channel] entry")
            else:
                channels.add(int(cm.group(1)))
        if sq is None:
            err(f"{where} a group has no leader tagged @1'N")
            continue
        if sq in squads:
            err(f"{where} two groups tagged 1'{sq}")
        squads[sq] = channels
    if 0 not in squads:
        err(f"{where} no HQ group (1'0)")
    numbered = sorted(k for k in squads if k)
    if numbered != list(range(1, len(numbered) + 1)):
        err(f"{where} squads must be numbered 1'1..1'N without gaps, found {numbered}")
    if len(numbered) != nsq:
        err(f"{where} layer says {nsq} squads, found {len(numbered)}")
    for k, ch in squads.items():
        want = len(numbered) + 1 if k == 0 else k
        if ch != {want}:
            err(f"{where} 1'{k}: PRC-343 channel should be {want}, found {sorted(ch)}")

for p in CONFIG["packages"]:
    if p not in seen_prefix:
        err(f"packages.json lists {p} but no layer uses it")

for w in warnings:
    print("WARNING:", w)
for e in errors:
    print("ERROR:", e)
print(f"\n{len(errors)} error(s), {len(warnings)} warning(s)")
sys.exit(1 if errors else 0)
