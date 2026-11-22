"""The JANTAC standard slot order inside a group (the order the website lists them).

Eden's role selection screen lists a group's units in the order they appear in mission.sqm,
so every group in the master mission (and every composition) keeps this order:

  0  the group leader (description tagged @1'N)
  1  other command slots without a team color (platoon sergeant, RTO, ...)
  2  red team, team leader first
  3  blue team, team leader first
  4  medics (green)
  5  everything else (riflemen without a team, security, crew, drivers, gunners)

Inside each tier the existing order is kept. site/template.html has the same rule in JS
(slotTier) for the "Fix slot order" tool; keep the two in step.
"""
import re

LEADER_ROLES = {"PL", "SL", "CO", "XO", "PSG", "RTO", "RTO1", "RTO2", "FO", "JTAC", "FAC"}
LEADER_DESC = re.compile(r"leader|sergeant|commander|officer|\bRTO\b|radio", re.I)
TL_DESC = re.compile(r"team leader|\bTL\b", re.I)


def tier(desc, role, color):
    """(tier, sub) for one unit; sort a group's units by this, stably."""
    desc, role, color = desc or "", (role or "").upper(), (color or "").upper()
    if "@" in desc:
        return (0, 0)
    tl = 0 if (role == "TL" or TL_DESC.search(desc)) else 1
    if color == "RED":
        return (2, tl)
    if color == "BLUE":
        return (3, tl)
    if color == "GREEN":
        return (4, 0)
    if role in LEADER_ROLES or LEADER_DESC.search(desc):
        return (1, 0)
    return (5, 0)


def unit_info(init, desc):
    m = re.search(r'\[this,\s*"(\w+?_)(\w+)"\]\s*call FNC_GearScript', init or "")
    c = re.search(r'"(RED|BLUE|GREEN)"\]\s*call FNC_Autocolor', init or "")
    return desc or "", m.group(2) if m else "", c.group(1) if c else ""
