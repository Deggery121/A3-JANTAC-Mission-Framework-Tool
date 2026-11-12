#ifdef description
	
	#include "dia\rscdefinitions.hpp" //Must have for the end screen to work, if removed Arma 3 will crash on mission load
	#include "dia\endscreen\dia_endscreen.hpp" //Must have for the end screen to work, if removed Arma 3 will crash on mission load

	respawn = 3; //Do not change, spectator script needs people to respawn, to be declared as dead and put into spectator mode
	respawndelay = 5; //5 seconds are needed to make sure people properly die and go into spectator
	disabledAI = 1; //disabledAI does so not slotted units do not spawn as ai
	respawnButton = 1; //Enables the respawn button
	respawnDialog = 0; //Disables the score screen while respawning

	class Extended_PreInit_EventHandlers {
		
		class Mission {
		
			init = "'' call compile preprocessFileLineNumbers 'preinit.sqf'; FNC_Autocolor = compile preprocessFileLineNumbers 'customization\autocolor.sqf'; FNC_GearScript = compile preprocessFileLineNumbers 'customization\gear.sqf'; FNC_VehicleGearScript = compile preprocessFileLineNumbers 'customization\vehGear.sqf';"; //Made gear script function in case we ever decide to switch to the old Arma 2 way of how we did it.
		
		};
	};
	
	class CfgDebriefingSections {
		class acex_killTracker {
			title = "Acex Killed Events";
			variable = "acex_killTracker_outputText";
		};
	};

#endif
	
#ifdef description_titles
	
	#include "dia\debug\dia_debug.hpp" //Must have for the end screen to work, if removed Arma 3 will crash on mission load

#endif