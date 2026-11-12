//ace_cookoff_enable = false; //uncommenting this disables cookoff fire effect
//ace_cookoff_enableAmmoCookoff = false; //uncommenting this disables secondary explosions

if (isServer) then {

	setViewDistance 2000; //View distance for the server (the ai's)

	FW_TimeLimit = 0; //Time limit in minutes, to disable the time limit set it to 0
	FW_TimeLimitMessage = "TIME LIMIT REACHED!"; //The message displayed when the time runs out

	[west, "Bluguys", "player"] call FNC_AddTeam; //Adds a player team called Blugyswood Police Department on side west
	[east, "Redguys", "player"] call FNC_AddTeam; //Adds a player team called Redguys on side east
	[civilian, "Civguys", "player"] call FNC_AddTeam; //Adds a player team called Civguys on side civilian
	//[resistance, "green goblin mask", "ai"] call FNC_AddTeam; //Adds an ai team called Local Militia on side resistance (aka independent aka greenfor)

};

if (!isDedicated) then {

	FW_DebugMessagesEnabled = true; //Only disable debug messages when the mission is released

	setViewDistance 1200; //View distance for the player, they can override this with MCC but it's useful to set a base

	call FNC_forceTerrainGrid; //uncomment this to force high terrain setting. This will prevent faraway objects from appearing as floating. Useful for missions with long sightlines. Should always be used in TvTs.
	
	switch (side player) do { //Checks what team the player is on
		case east: {
			FW_RespawnTickets = 0; //If respawn is enabled you must create empty game logics, for respawn points, following the name format fw_side_respawn. Example: fw_east_respawn
		};
		//add more cases for other factions here
		case west: {
			FW_RespawnTickets = 0; //If respawn is enabled you must create empty game logics, for respawn points, following the name format fw_side_respawn. Example: fw_west_respawn
		};
		case civilian: {
			FW_RespawnTickets = 0; //If respawn is enabled you must create empty game logics, for respawn points, following the name format fw_side_respawn. Example: fw_civ_respawn
		};
	};
};