# A3 JANTAC Mission Framework Tool

Ready-made playable units for the JANTAC (Olsen-based) mission framework, with each unit
locked to its gear script. Mission makers drop a composition into Eden and every slot already
has the right init, team color, lobby name and ACRE radio channel.

## For mission makers

Open the **JANTAC Unit Library** page:
https://deggery121.github.io/A3-JANTAC-Mission-Framework-Tool/

1. Pick a platoon package and how many squads you want under 1'0.
2. In Chrome or Edge, press **Install compositions…** and pick your Arma profile's
   `compositions` folder, then **Add loadout to a mission…** and pick your mission folder.
   The page copies the loadout and adds its line to `gear.sqf` (your other lines are kept;
   a changed loadout file is backed up as `.bak` first).
3. In any other browser, press **Download zip** and follow `INSTALL.txt` inside it.
4. In Eden open **Compositions → JANTAC Mission Framework** and place the package.

The **Briefing** tab first asks whether the mission is **COOP** or **TVT**. COOP gives your side
one briefing; TVT gives each team its own (`case WEST/EAST/RESISTANCE` blocks, team 2's side is
picked on the tab), with the title, mission notes and CO tab shared. It builds `customization\briefing.sqf` from a form (situation, mission,
friendly and enemy forces, execution, support, command and signal, mission notes and an
optional CO-only tab). Friendly composition and radio channels fill in from the package you
picked. Tick **Include briefing.sqf** and it goes into the zip and into **Add to a mission…**,
replacing the mission's briefing (the old one is kept as `briefing.sqf.bak`).

The **Mission settings** tab builds `customization\missionSettings.hpp` the same way: loading
screen name and messages, an optional loading image (copied into the mission's `images`
folder), game type and player limits. `maxPlayers` fills in from the package: player slots
plus the headless client.

**Custom units** tab: build your own HQ and squads from every unit in the library, mixing
packages if you like. Start from a package or from empty, add slots from the list, reorder,
rename, set red/blue teams and duplicate squads. The page builds the Eden composition and adds
every loadout the design uses to `gear.sqf`.

**Get the framework**: tick it on the Units tab to get a complete mission, the stripped JANTAC
framework (`framework/`) plus the four files it needs from this page: `gear.sqf` and the loadout
(from your units), `briefing.sqf` (Briefing tab) and `missionSettings.hpp` (Mission settings tab).
While it's ticked the briefing and settings are always included, and the download stays off until
units are picked, the briefing has content and the mission has a name. **Create mission folder…**
writes the framework into the new folder; existing files are never overwritten.

**My mission already has units**: pick this on the Units tab to use only the briefing and
mission settings. Enter your squad count, playable slots and CO unit class so the radios,
`maxPlayers` and CO tab come out right.

**Play as / Team 2 (TVT)**: any package can be placed as BLUFOR, OPFOR or INDFOR (**Play as** on its
card). The page rewrites the composition's sides and swaps each unit class for the same role on the other
side (`B_Soldier_TL_F` → `O_Soldier_TL_F` / `I_Soldier_TL_F`, table `CLASS_ROWS` in `site/template.html`), so
faces and voices follow the side while the gear script stays the same. **Add a Team 2 (TVT)** adds a second
package on another side: both compositions and loadouts go into the mission and the briefing turns to TVT.

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
framework/JANTAC_FrameWork_vX/     stripped framework for "Get the framework" (no gear.sqf, loadouts,
                                   briefing.sqf or missionSettings.hpp; the page makes those)
maps.json                          maps offered in the Mission folder tab: world name + in-game name
tools/check_master.py              rules every push must pass
tools/build_compositions.py        builds HQ + 1..N squad compositions per package
tools/build_site.py                bakes the library into the web page (site/template.html)
```

Edit the master in Eden (save **unbinarized**), then push. GitHub runs the checker and,
if it passes, builds the compositions and redeploys the web page. Tag a commit `v1.0`,
`v1.1`, ... to also publish the zips as a release.

One-time setup: in the repo's **Settings → Pages**, set **Source** to **GitHub Actions**.

Run locally:

```
python tools/check_master.py
python tools/build_compositions.py      # output in build/compositions
python tools/build_site.py              # output in build/site/index.html
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

### Maps

The Mission folder tab names a mission `MissionName.WorldName`. Its map list is `maps.json`:
add `{"world": "VTF_Korsac", "name": "Korsac"}` entries for new maps. The world name is the part
after the dot in that map's mission folders. Maps not on the list can still be typed in.

### Sides

A package's side (BLUFOR, OPFOR or INDFOR) comes from its groups' side in the master mission
(`West`, `East` or `Independent`). The web page lists each package under its side, and the
briefing, custom designer and compositions follow it. Every group in a package must be on the
same side; the checker enforces this.

### Adding a package

1. Add the loadout file to `customization/loadouts/` and its `#include` to `gear.sqf`.
2. Build the platoon in the master mission on its own layer, following the rules above.
3. Add the prefix to `packages.json` with its `name`, `loadout`, `requiredAddons`, `by` (author)
   and a short `description` of the gear (shown under the package name on the page).
4. Push and check the build.

### Updating the framework

Replace the folder in `framework/` with the new version (named `JANTAC_FrameWork_v1.55` and so on;
the page uses the highest one). Leave out `customization\gear.sqf`, `customization\loadouts`,
`customization\briefing.sqf` and `customization\missionSettings.hpp`, and don't include a `mission.sqm`.

## Credits

- Built on the [Olsen Framework for Arma 3](https://github.com/dklollol/Olsen-Framework-Arma-3). Thanks to Olsen and its contributors.
- Loadouts: TCR units by Kelly; 1980s British (Winter) by Aiello; 1980s US Army, US Army Early 2000s and Early 2000s USMC (Des) by Deggery.
- JANFU: https://www.janfu.work/
