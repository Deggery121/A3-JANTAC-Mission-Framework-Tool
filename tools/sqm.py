"""Minimal parser/serializer for text (unbinarized) Arma 3 config / mission.sqm files.

Node model:
  Class:  {"k": "class", "name": str, "body": [nodes]}   (body None => forward decl `class X;`)
  Value:  {"k": "val",   "name": str, "raw": str}        raw text after '=' (without ';')
  Array:  {"k": "arr",   "name": str, "raw": str, "op": "=" or "+="}
"""
import re


def _skip_ws(s, i):
    while i < len(s):
        if s[i] in " \t\r\n":
            i += 1
        elif s.startswith("//", i):
            i = s.index("\n", i) if "\n" in s[i:] else len(s)
        else:
            break
    return i


def _read_value(s, i):
    """Read a scalar value up to the terminating ';' (strings may contain ';')."""
    start = i
    while i < len(s):
        c = s[i]
        if c == '"':
            i += 1
            while True:
                j = s.index('"', i)
                if j + 1 < len(s) and s[j + 1] == '"':
                    i = j + 2
                    continue
                i = j + 1
                break
        elif c == ";":
            return s[start:i].rstrip(), i + 1
        else:
            i += 1
    raise ValueError("unterminated value")


def _read_array(s, i):
    assert s[i] == "{"
    depth = 0
    start = i
    while i < len(s):
        c = s[i]
        if c == '"':
            i += 1
            while True:
                j = s.index('"', i)
                if j + 1 < len(s) and s[j + 1] == '"':
                    i = j + 2
                    continue
                i = j + 1
                break
            continue
        if c == "{":
            depth += 1
        elif c == "}":
            depth -= 1
            if depth == 0:
                i += 1
                break
        i += 1
    raw = s[start:i]
    i = _skip_ws(s, i)
    assert s[i] == ";", s[i:i + 40]
    return raw, i + 1


IDENT = re.compile(r"[A-Za-z0-9_ ]*[A-Za-z0-9_]")


def _parse_body(s, i, top=False):
    nodes = []
    while True:
        i = _skip_ws(s, i)
        if i >= len(s):
            if top:
                return nodes, i
            raise ValueError("unexpected EOF")
        if s[i] == "}":
            i = _skip_ws(s, i + 1)
            assert s[i] == ";"
            return nodes, i + 1
        if s.startswith("class ", i):
            i += 6
            m = re.compile(r"\s*([A-Za-z0-9_]+)\s*").match(s, i)
            name = m.group(1)
            i = m.end()
            if s[i] == ";":
                nodes.append({"k": "class", "name": name, "body": None})
                i += 1
                continue
            if s[i] == ":":  # inheritance not used in sqm, keep simple
                raise ValueError("inheritance unsupported")
            i = _skip_ws(s, i)
            assert s[i] == "{", s[i:i + 40]
            body, i = _parse_body(s, i + 1)
            nodes.append({"k": "class", "name": name, "body": body})
            continue
        m = re.compile(r"([A-Za-z0-9_]+)(\[\])?\s*(\+=|=)\s*").match(s, i)
        if not m:
            raise ValueError("cannot parse at: %r" % s[i:i + 60])
        name, isarr, op = m.group(1), m.group(2), m.group(3)
        i = m.end()
        if isarr:
            i = _skip_ws(s, i)
            raw, i = _read_array(s, i)
            nodes.append({"k": "arr", "name": name, "raw": raw, "op": op})
        else:
            raw, i = _read_value(s, i)
            nodes.append({"k": "val", "name": name, "raw": raw})


def parse(text):
    nodes, _ = _parse_body(text, 0, top=True)
    return nodes


def dump(nodes, ind=0):
    out = []
    t = "\t" * ind
    for n in nodes:
        if n["k"] == "class":
            if n["body"] is None:
                out.append(f"{t}class {n['name']};")
            else:
                out.append(f"{t}class {n['name']}")
                out.append(t + "{")
                out.extend(dump(n["body"], ind + 1))
                out.append(t + "};")
        elif n["k"] == "val":
            out.append(f"{t}{n['name']}={n['raw']};")
        else:
            raw = n["raw"]
            # re-indent multi-line arrays
            if "\n" in raw:
                lines = [l.strip() for l in raw.replace("\r", "").split("\n")]
                body = []
                d = ind
                for l in lines:
                    if not l:
                        continue
                    if l.startswith("}"):
                        d -= 1
                    body.append("\t" * d + l)
                    if l.endswith("{"):
                        d += 1
                out.append(f"{t}{n['name']}[]{n['op']}")
                out.extend(body)
                out[-1] = out[-1] + ";"
            else:
                out.append(f"{t}{n['name']}[]{n['op']}{raw};")
    return out


def dumps(nodes):
    return "\r\n".join(dump(nodes)) + "\r\n"


# ---- helpers -------------------------------------------------------------

def get(nodes, name):
    for n in nodes:
        if n["name"] == name:
            return n
    return None


def remove(nodes, name):
    nodes[:] = [n for n in nodes if n["name"] != name]


def set_val(nodes, name, raw, after=None):
    n = get(nodes, name)
    if n:
        n["raw"] = raw
        return
    new = {"k": "val", "name": name, "raw": raw}
    if after and get(nodes, after):
        idx = nodes.index(get(nodes, after)) + 1
        nodes.insert(idx, new)
    else:
        nodes.append(new)


def decode_str(raw):
    """Decode an sqm string value, including `"a" \\n "b"` concatenations."""
    parts = re.findall(r'"((?:[^"]|"")*)"', raw)
    joined = []
    toks = re.split(r'("(?:[^"]|"")*")', raw)
    for tk in toks:
        tk2 = tk.strip()
        if not tk2:
            continue
        if tk2.startswith('"'):
            joined.append(tk2[1:-1].replace('""', '"'))
        elif tk2 == "\\n":
            joined.append("\n")
    return "".join(joined)


def encode_str(s):
    return '"' + s.replace('"', '""') + '"'
