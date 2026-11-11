"""Bake the unit library into the web page.

Reads the master mission, packages.json, the loadouts and the compositions built by
build_compositions.py, and writes:
  build/site/index.html      full page for GitHub Pages
  build/site/artifact.html   the same page without the document wrapper (for a claude.ai artifact)

usage: python tools/build_site.py
"""
import datetime
import json
import os
import re
import subprocess
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import sqm  # noqa: E402

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
MASTER = os.path.join(ROOT, "master", "UnitLibrary.VR")
COMPS = os.path.join(ROOT, "build", "compositions")
OUT = os.path.join(ROOT, "build", "site")
CONFIG = json.load(open(os.path.join(ROOT, "packages.json")))


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


def read(path):
    return open(path, newline="", encoding="latin-1").read()


def comp(folder):
    d = os.path.join(COMPS, folder)
    header = read(os.path.join(d, "header.sqe"))
    return {
        "folder": folder,
        "name": re.search(r'name="(.*?)";', header).group(1),
        "header": header,
        "composition": read(os.path.join(d, "composition.sqe")),
    }


def build_label():
    ref = os.environ.get("GITHUB_REF_NAME", "")
    sha = os.environ.get("GITHUB_SHA", "")[:7]
    if not sha:
        try:
            sha = subprocess.check_output(["git", "-C", ROOT, "rev-parse", "--short", "HEAD"],
                                          stderr=subprocess.DEVNULL).decode().strip()
        except Exception:
            sha = "local"
    date = datetime.date.today().isoformat()
    return f"build {ref + ' ' if ref.startswith('v') else ''}{sha} · {date}"


def main():
    root = sqm.parse(read(os.path.join(MASTER, "mission.sqm")))
    layers = classes(sqm.get(sqm.get(root, "Mission")["body"], "Entities")["body"])
    packages = {}
    for layer in layers:
        lname = val(layer["body"], "name")
        if lname == CONFIG["infrastructure"]["layer"]:
            continue
        prefix = lname.split("|")[0].strip()
        cfg = CONFIG["packages"][prefix]
        groups = []
        for g in classes(sub(layer, "Entities")):
            units, squad = [], None
            for u in classes(sub(g, "Entities")):
                a = sub(u, "Attributes")
                desc, init = val(a, "description") or "", val(a, "init") or ""
                m = re.search(r"@1'(\d+)", desc)
                if m:
                    squad = int(m.group(1))
                role = re.search(r'"' + re.escape(prefix) + r'(\w+)"\] call FNC_GearScript', init).group(1)
                color = re.search(r'"(RED|BLUE|GREEN)"\] call FNC_Autocolor', init)
                units.append({"desc": desc.split("@")[0], "role": role, "color": color.group(1) if color else "",
                              "type": val(u["body"], "type"), "rank": val(a, "rank") or ""})
            groups.append({"squad": squad, "units": units})
        groups.sort(key=lambda g: g["squad"])
        side = val(classes(sub(layer, "Entities"))[0]["body"], "side") or "West"
        max_sq = max(g["squad"] for g in groups)
        tag = prefix.rstrip("_")
        packages[prefix] = {
            "name": cfg["name"],
            "by": cfg.get("by", ""),
            "description": cfg.get("description", ""),
            "side": side,
            "loadout": cfg["loadout"],
            "requiredAddons": cfg["requiredAddons"],
            "loadoutText": read(os.path.join(MASTER, "customization", "loadouts", cfg["loadout"])),
            "maxSquads": max_sq,
            "groups": groups,
            "compositions": {str(n): comp(f"JANTAC {tag} HQ+{n}") for n in range(1, max_sq + 1)},
        }
    lib = {
        "build": build_label(),
        "author": CONFIG["author"],
        "category": CONFIG["category"],
        "packages": packages,
        "system": comp(CONFIG["infrastructure"]["folder"]),
        "gearTemplate": read(os.path.join(MASTER, "customization", "gear.sqf")),
        "maps": json.load(open(os.path.join(ROOT, "maps.json"))),
    }
    data = json.dumps(lib, separators=(",", ":")).replace("</", "<\\/")
    tpl = open(os.path.join(ROOT, "site", "template.html"), encoding="utf-8").read()
    import base64
    logo = "data:image/png;base64," + base64.b64encode(open(os.path.join(ROOT, "site", "logo.png"), "rb").read()).decode()
    page = tpl.replace("__LOGO_DATA_URI__", logo).replace("__LIBRARY_JSON__", data)
    os.makedirs(OUT, exist_ok=True)
    open(os.path.join(OUT, "artifact.html"), "w", encoding="utf-8").write(page)
    full = ('<!doctype html>\n<html lang="en">\n<head>\n<meta charset="utf-8">\n'
            '<meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">\n'
            '<link rel="icon" type="image/png" href="' + logo + '">\n'
            '<style>:root{color-scheme:light;padding-top:env(safe-area-inset-top,0px);'
            'padding-bottom:env(safe-area-inset-bottom,0px)}body{margin:0}img{max-width:100%}'
            '[hidden]{display:none!important}</style>\n</head>\n<body>\n' + page + "\n</body>\n</html>\n")
    open(os.path.join(OUT, "index.html"), "w", encoding="utf-8").write(full)
    print(f"site: {len(packages)} packages, {os.path.getsize(os.path.join(OUT, 'index.html')) // 1024} KB")


if __name__ == "__main__":
    main()
