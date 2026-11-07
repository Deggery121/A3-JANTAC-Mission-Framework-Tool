"""Build Eden compositions from the JANTAC master mission.

For every package layer in master/UnitLibrary.VR/mission.sqm this writes one composition per
squad count (HQ + 1 squad ... HQ + N squads), plus one for the infrastructure layer.

Radio rule: squad 1'N -> PRC-343 channel N; HQ (1'0) -> channel (number of squads + 1).
isPlayer is removed so placing a composition never takes over the mission maker's player unit.

usage: python tools/build_compositions.py [master_dir] [out_dir]
"""
import copy
import json
import os
import re
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import sqm  # noqa: E402

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
MASTER = sys.argv[1] if len(sys.argv) > 1 else os.path.join(ROOT, "master", "UnitLibrary.VR")
OUT = sys.argv[2] if len(sys.argv) > 2 else os.path.join(ROOT, "build", "compositions")
CONFIG = json.load(open(os.path.join(ROOT, "packages.json")))

ACRE_PROP = '"acre_sys_radio_edenSetup"'
ACRE_RE = re.compile(r'(""ACRE_PRC343"",\[1,)(\d+)(\])')


def classes(nodes):
    return [n for n in nodes if n["k"] == "class"]


def sub(node, name):
    c = sqm.get(node["body"], name)
    return c["body"] if c else None


def layer_name(layer):
    return sqm.decode_str(sqm.get(layer["body"], "name")["raw"])


def walk(nodes, fn):
    for n in nodes:
        if n["k"] == "class" and n["body"]:
            fn(n)
            walk(n["body"], fn)


def squad_of(group):
    for u in classes(sub(group, "Entities")):
        d = sqm.get(sub(u, "Attributes"), "description")
        m = re.search(r"@1'(\d+)", sqm.decode_str(d["raw"])) if d else None
        if m:
            return int(m.group(1))
    return None


def set_channel(group, channel):
    def fix(n):
        if n["name"].startswith("Attribute") and sqm.get(n["body"], "property") and \
                sqm.get(n["body"], "property")["raw"] == ACRE_PROP:
            data = sqm.get(sqm.get(n["body"], "Value")["body"], "data")["body"]
            v = sqm.get(data, "value")
            v["raw"], k = ACRE_RE.subn(lambda m: f"{m.group(1)}{channel}{m.group(3)}", v["raw"])
            assert k == 1, v["raw"]
    walk([group], fix)


def strip_player(nodes):
    def fix(n):
        if n["name"] == "Attributes":
            sqm.remove(n["body"], "isPlayer")
    walk(nodes, fix)


def positions(nodes):
    acc = []

    def grab(n):
        if n["name"] == "PositionInfo":
            acc.append(sqm.get(n["body"], "position"))
    walk(nodes, grab)
    return acc


def fmt(x):
    s = ("%.8g" % x)
    return s


def relativize(layer):
    pos = positions([layer])
    vals = [[float(v) for v in p["raw"].strip("{}").split(",")] for p in pos]
    cx = sum(v[0] for v in vals) / len(vals)
    cz = sum(v[2] for v in vals) / len(vals)
    cy = min(v[1] for v in vals)
    for p, v in zip(pos, vals):
        p["raw"] = "{%s,%s,%s}" % (fmt(v[0] - cx), fmt(v[1] - cy), fmt(v[2] - cz))
    return [cx, cy, cz]


def write_comp(folder, name, layer, required_addons, author, category):
    layer = copy.deepcopy(layer)
    center = relativize(layer)
    layer["name"] = "Item0"
    comp = [
        {"k": "val", "name": "version", "raw": "54"},
        {"k": "arr", "name": "center", "op": "=", "raw": "{%s,%s,%s}" % tuple(fmt(c) for c in center)},
        {"k": "class", "name": "items", "body": [{"k": "val", "name": "items", "raw": "1"}, layer]},
    ]
    addons = "{\n" + ",\n".join('"%s"' % a for a in required_addons) + "\n}"
    header = [
        {"k": "val", "name": "version", "raw": "54"},
        {"k": "val", "name": "name", "raw": sqm.encode_str(name)},
        {"k": "val", "name": "author", "raw": sqm.encode_str(author)},
        {"k": "val", "name": "category", "raw": sqm.encode_str(category)},
        {"k": "arr", "name": "requiredAddons", "op": "=", "raw": addons},
    ]
    d = os.path.join(OUT, folder)
    os.makedirs(d, exist_ok=True)
    open(os.path.join(d, "composition.sqe"), "w", newline="").write(sqm.dumps(comp))
    open(os.path.join(d, "header.sqe"), "w", newline="").write(sqm.dumps(header))


def main():
    root = sqm.parse(open(os.path.join(MASTER, "mission.sqm"), newline="").read())
    layers = classes(sqm.get(sqm.get(root, "Mission")["body"], "Entities")["body"])
    author, category = CONFIG["author"], CONFIG["category"]
    built = []
    for layer in layers:
        lname = layer_name(layer)
        if lname == CONFIG["infrastructure"]["layer"]:
            info = CONFIG["infrastructure"]
            l2 = copy.deepcopy(layer)
            strip_player([l2])
            write_comp(info["folder"], info["name"], l2, info["requiredAddons"], author, category)
            built.append(info["name"])
            continue
        prefix = lname.split("|")[0].strip()
        pkg = CONFIG["packages"][prefix]
        groups = classes(sub(layer, "Entities"))
        by_squad = {squad_of(g): g for g in groups}
        hq, squads = by_squad[0], sorted(k for k in by_squad if k)
        for n in range(1, len(squads) + 1):
            chosen = [copy.deepcopy(hq)] + [copy.deepcopy(by_squad[k]) for k in squads[:n]]
            set_channel(chosen[0], n + 1)
            for g in chosen[1:]:
                set_channel(g, squad_of(g))
            strip_player(chosen)
            for i, g in enumerate(chosen):
                g["name"] = f"Item{i}"
            l2 = copy.deepcopy(layer)
            ents = sqm.get(l2["body"], "Entities")
            ents["body"] = [{"k": "val", "name": "items", "raw": str(len(chosen))}] + chosen
            label = f"HQ + {n} squad" + ("s" if n > 1 else "")
            sqm.set_val(l2["body"], "name", sqm.encode_str(f"{prefix} | {pkg['loadout'][:-4]} | {label}"))
            name = f"{pkg['name']} - {label}"
            folder = f"JANTAC {prefix.rstrip('_')} HQ+{n}"
            write_comp(folder, name, l2, pkg["requiredAddons"], author, category)
            built.append(name)
    print("\n".join(built))


if __name__ == "__main__":
    main()
