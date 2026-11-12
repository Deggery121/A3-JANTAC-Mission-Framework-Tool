I made this using a TVT mission as the base so there are briefing tabs in briefing.sqf, respawn configurations in settings.sqf and start text in the start text modules for 3 teams. If you use this for a COOP having those extras won't cause issues just change the factions to match the new player/ai layout and maybe comment out the respawns for unused sides.
If you use this to make a TVT you should change the gameType in missionsettings.hpp to be TDM instead of Coop


Gearscript how to:
Each playable unit must call the gearscript via the unit init. It looks like this:
[this, "FLJWD_PL", "Police Leader"] call FNC_GearScript;
The FLJWD_PL part is the actual role you are calling from the loadout, the Police Leader part is the group name of the unit and should match what you set the group name to in group leader's role description. 

The loadout that you want to call roles from needs to be activated for the mission. To do that open /customization/gear.sqf and uncomment the name of the loadout you want to use from the list at the bottom.
If you are making a new loadout for a mission, go to \customization\loadouts and copy an existing loadout, rename the copy to something understandable like WW2GermanAfrica or 2020USMC
Add a line to gear.sqf to the end of the existing list to include this new loadout, it should look like this:
	//#include "loadouts\2000MSV.sqf"
	//#include "loadouts\WW2BritishAfrica.sqf"
	//#include "loadouts\VampHunters.sqf"
	//#include "loadouts\WW2AustraliaAfrica.sqf"
	//#include "loadouts\MTF.sqf"
	#include "loadouts\**NameOfYourNewLoadoutHere**.sqf"
};

Open the new loadout file in notepad++
You will need to change the package prefix for your new loadout, anywhere the old loadout name is referenced replace with a new acronym, for example if you copied MTF.sqf replace MTF in all instances in the new version with USMC if you're making a US marine loadout.
First thing in the gearscript is examples of how to call it in player unit inits, I would recommend altering this to reflect EVERY ROLE POSSIBLE in your loadout, this makes it easy to double check at the end if you've actually made a gear entry for each role.
Second part of loadout is groups, these allow you to create arrays so you can easily give every player basic gear they will all have.
In the uniform group of MTF I have included a commented out example of how to give players a random uniform out of a selection.
The loadout titled BAF is very detailed and shows how to create several uniform groups so that a single loadout can be used with minimal editing for different missions in different weather/biomes. Note we don't have a lot of the gear from BAF.sqf in the modpack so the loadout isn't usable as is.
Through extensive use and testing I've learned the only way to ensure that a unit gets all of the gear is to add the third argument noting exactly which part of the player's gear that item goes in so I recommend doing this for everything, example below:
	["ACE_elasticBandage", 6, "uniform"] call FNC_AddItem;
will make sure the player gets those bandages regardless of if their uniform is actually full rather than this:
	["ACE_elasticBandage", 6] call FNC_AddItem;

Other notes:
\customization\missionSettings.hpp still needs to be set up with mission title, custom load screen and player count
\customization\settings.sqf needs to be updated with team names in the lines that call FNC_addTeam
you can also change AI's default view distance, player default view distance and turn on or off FNC_forceTerrainGrid which stops the Arma shit where you see players on the other side of a hill at long range.
Some new modules in the /modules/ folder, make sure to update /modules/modules.sqf if you change anything.