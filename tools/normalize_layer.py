"""Bring one Eden layer of the master mission up to the JANTAC standard, in place.

Use it after pasting a platoon saved in an older style (FNC_SetRadio, Teams.sqf,
setGroupId, YELLOW/GREEN teams, "1'1 - " descriptions, editor-mod attributes)
into the master mission.

  python tools/normalize_layer.py "Layer 16" USMCEAR_ USMCEAR.sqf

What it does to the layer:
  * renames it "PREFIX_ | LOADOUT | HQ + N squads"
  * init  = [this, "PREFIX_ROLE"] call FNC_GearScript; (+ [this, "COLOR"] call FNC_Autocolor;)
  * colors: medics GREEN; SL/PL roles and group leaders none; YELLOW->RED, GREEN->BLUE
  * descriptions: "1'1 - " prefixes removed, leader tagged "Role@1'N"
  * unit attributes kept: rank, init, description, isPlayer, isPlayable, empty Inventory
  * custom attributes kept: ACRE radio setup (PRC-343 channel: squad N -> N, 1'0 -> squads + 1)
    and ace_isEngineer; everything else (3den Enhanced, fox, voice) is dropped
  * group-level custom attributes dropped
Run tools/check_master.py afterwards.
"""
import copy
import os
import re
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import sqm  # noqa: E402

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
MASTER = os.path.join(ROOT, "master", "UnitLibrary.VR", "mission.sqm")
COLOR_MAP = {"RED": "RED", "BLUE": "BLUE", "YELLOW": "RED", "GREEN": "BLUE"}
KEEP_ATTRS = ["rank", "init", "description", "isPlayer", "isPlayable"]
KEEP_CUSTOM = ["ace_isEngineer"]
ACRE_PROP = "acre_sys_radio_edenSetup"


def classes(nodes):
    return [n for n in (nodes or []) if n["k"] == "class"]


def sub(node, name):
    c = sqm.get(node["body"], name)
    return c["body"] if c else None


def sval(nodes, name):
    n = sqm.get(nodes, name)
    return sqm.decode_str(n["raw"]) if n and n["raw"].strip().startswith('"') else None


def acre_attr(channel):
    val = '[["ACRE_PRC343",[1,%d]],["ACRE_PRC152",1],["ACRE_PRC117F",1]]' % channel
    return {"k": "class", "name": "Attribute0", "body": [
        {"k": "val", "name": "property", "raw": '"' + ACRE_PROP + '"'},
        {"k": "val", "name": "expression", "raw": sqm.encode_str('_this setVariable ["acre_sys_radio_setup", _value, true]')},
        {"k": "class", "name": "Value", "body": [{"k": "class", "name": "data", "body": [
            {"k": "val", "name": "singleType", "raw": '"STRING"'},
            {"k": "val", "name": "value", "raw": sqm.encode_str(val)},
        ]}]},
    ]}


def clean_desc(desc):
    d = re.sub(r"^\s*1'\d+\s*-\s*", "", desc)
    d = re.sub(r"\s*@\s*", "@", d)
    d = re.sub(r"@1-(\d+)", r"@1'\1", d)
    return d.strip()


def main():
    if len(sys.argv) != 4:
        sys.exit(__doc__)
    layer_name, prefix, loadout = sys.argv[1], sys.argv[2], sys.argv[3]
    text = open(MASTER, newline="").read()
    root = sqm.parse(text)
    layers = classes(sqm.get(sqm.get(root, "Mission")["body"], "Entities")["body"])
    layer = next((l for l in layers if sval(l["body"], "name") == layer_name), None)
    if not layer:
        sys.exit(f"No layer named {layer_name!r}. Layers: {[sval(l['body'], 'name') for l in layers]}")

    groups = classes(sub(layer, "Entities"))
    squad_of = {}
    for g in groups:
        for u in classes(sub(g, "Entities")):
            m = re.search(r"@\s*1['\-](\d+)", sval(sub(u, "Attributes"), "description") or "")
            if m:
                squad_of[id(g)] = int(m.group(1))
    if len(squad_of) != len(groups):
        sys.exit("Every group needs a leader whose description ends in @1'N.")
    nsq = max(squad_of.values())
    report = []

    for g in sorted(groups, key=lambda g: squad_of[id(g)]):
        sq = squad_of[id(g)]
        ch = nsq + 1 if sq == 0 else sq
        sqm.remove(g["body"], "CustomAttributes")
        report.append(f"1'{sq}  (PRC-343 ch {ch})")
        for u in classes(sub(g, "Entities")):
            a = sub(u, "Attributes")
            init, desc = sval(a, "init") or "", sval(a, "description") or ""
            m = re.search(r'\[this,\s*"(\w+?_)(\w+)"', init)
            if not m:
                sys.exit(f"Unit {desc!r} has no FNC_GearScript call: {init}")
            role = m.group(2)
            c = re.search(r'\[this,\s*"(RED|BLUE|GREEN|YELLOW)"\]\s*call FNC_Autocolor', init) or \
                re.search(r'\["(RED|BLUE|GREEN|YELLOW)",\s*this\]\s*execVM', init)
            leader = "@" in desc
            if role == "MD":
                color = "GREEN"
            elif role in ("SL", "PL") or leader:
                color = None
            else:
                color = COLOR_MAP.get(c.group(1)) if c else None
            new_init = f'[this, "{prefix}{role}"] call FNC_GearScript;' + (f' [this, "{color}"] call FNC_Autocolor;' if color else "")
            nd = clean_desc(desc)
            if leader:
                nd = re.sub(r"@.*$", f"@1'{sq}", nd)
            kept = []
            for k in KEEP_ATTRS:
                if k == "init":
                    kept.append({"k": "val", "name": "init", "raw": sqm.encode_str(new_init)})
                elif k == "description":
                    kept.append({"k": "val", "name": "description", "raw": sqm.encode_str(nd)})
                elif sqm.get(a, k):
                    kept.append(sqm.get(a, k))
            kept.append({"k": "class", "name": "Inventory", "body": []})
            a[:] = kept
            old_ca = classes(sub(u, "CustomAttributes"))
            extra = [copy.deepcopy(x) for x in old_ca if (sval(x["body"], "property") or "").strip() in KEEP_CUSTOM]
            attrs = [acre_attr(ch)] + extra
            for i, x in enumerate(attrs):
                x["name"] = f"Attribute{i}"
            new_ca = {"k": "class", "name": "CustomAttributes",
                      "body": attrs + [{"k": "val", "name": "nAttributes", "raw": str(len(attrs))}]}
            ca = sqm.get(u["body"], "CustomAttributes")
            if ca:
                u["body"][u["body"].index(ca)] = new_ca
            else:
                u["body"].append(new_ca)
            report.append(f"   {nd:28} {prefix + role:18} {color or '':6}" + (" +ace_isEngineer" if extra else ""))

    sqm.set_val(layer["body"], "name", sqm.encode_str(f"{prefix} | {loadout[:-4]} | HQ + {nsq} squad{'s' if nsq != 1 else ''}"))
    open(MASTER, "w", newline="").write(sqm.dumps(root))
    print("\n".join(report))


if __name__ == "__main__":
    main()
