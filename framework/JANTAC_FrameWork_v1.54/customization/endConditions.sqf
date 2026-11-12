//private _westCasualty = "VHTF" call FNC_CasualtyPercentage; //Gets the casualty percentage of team "USMC"
//private _eastCasualty = "Vampires" call FNC_CasualtyPercentage; //Gets the casualty percentage of team "VDV"

//if (_westCasualty >= 99) exitWith {
	
	//"Your team has been devoured." call FNC_EndMission;
	
//};

//if ((!alive sarcophagus1)&&(!alive sarcophagus2)&&(!alive sarcophagus3))

//exitWith {
	
	//"Vampire master sarcophagi have been destroyed. The village is cleansed." call FNC_EndMission;
	
//};
/*
Alternative methods of counting casualties

	"USMC" call FNC_casualtyCount;
		this will count how many members of a team died in the mission

	"USMC" call FNC_countTeam;
		this will check how many players are remaining in a team
		be careful as using this method will end the mission instantly if
		not enough players are present in the team


Adding extraction

	["USMC", "ExtractionAreaMarker", 0.8] call FNC_hasExtracted;
		this will check if at least 80% of remaining forces are present in extraction area
*/

//sleep (10); //This determines how frequently the end conditions should be checked in seconds


// ["BLUFOREliminated", false] call FNC_EndMission;
// ["OPFOREliminated", true] call FNC_EndMission;