# A3 JANTAC Mission Framework Tool

Ready-made playable units for the JANTAC (Olsen-based) mission framework, with each unit
locked to its gear script. Mission makers drop a composition into Eden and every slot already
has the right init, team color, lobby name and ACRE radio channel.

## For mission makers

1. Download the latest release: `JANTAC-compositions.zip` and `JANTAC-customization.zip`.
2. Unzip the compositions into your Arma profile's `compositions` folder, e.g.
   `Documents\Arma 3 - Other Profiles\<profile>\compositions\`.
3. Copy the `customization` folder into your mission (it adds `gear.sqf` and
   `customization\loadouts\`). If your mission already has custom lines in `gear.sqf`,
   copy just the loadout file and add its `#include` line instead.
4. In Eden open **Compositions → JANTAC Mission Framework** and place the package you want,
   e.g. *TCR units - HQ + 2 squads*.

Radio channels follow the squad count: squad 1'N is on PRC-343 channel N and the HQ (1'0) is
always on the channel after the last squad.

## For maintainers

Everything is built from one Eden mission: `master/UnitLibrary.VR`.

```
master/UnitLibrary.VR/
  mission.sqm                      one Eden layer per package
  customization/gear.sqf           includes every loadout
  customization/loadouts/*.sqf     gear scripts, role names as written by their authors
packages.json                      display name, loadout file and required addons per prefix
tools/check_master.py              rules every push must pass
tools/build_compositions.py        builds HQ + 1..N squad compositions per package
```

Edit the master in Eden (save **unbinarized**), then push. GitHub runs the checker and,
if it passes, builds the compositions. Tag a commit `v1.0`, `v1.1`, ... to publish a release.

Run locally:

```
python tools/check_master.py
python tools/build_compositions.py      # output in build/compositions
```

### Rules the checker enforces

- Layer name `PREFIX_ | LOADOUT | HQ + N squads`; one layer per prefix; plus the
  `Headless client + respawn` layer.
- Every loadout file has exactly one, unique `#define package` and is included in `gear.sqf`.
- Unit init is exactly `[this, "PREFIX_ROLE"] call FNC_GearScript;` optionally followed by
  `[this, "RED"|"BLUE"|"GREEN"] call FNC_Autocolor;`, and the role exists in the loadout.
- Medics (`MD`) are GREEN; `SL`/`PL` roles have no color; GREEN is only for medics.
- Each group has one leader tagged `@1'N`; HQ is 1'0; squads are 1'1..1'N with no gaps.
- Every unit is playable, has an empty inventory, and carries only the ACRE radio
  setup attribute with PRC-343 on the right channel (squad N → N, HQ → squads + 1).

### Adding a package

1. Add the loadout file to `customization/loadouts/` and its `#include` to `gear.sqf`.
2. Build the platoon in the master mission on its own layer, following the rules above.
3. Add the prefix to `packages.json`.
4. Push and check the build.
