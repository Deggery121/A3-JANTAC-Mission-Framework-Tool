#include "core\gearCore.sqf" //DO NOT REMOVE

// Call this with [this, "LOADOUT", (optional) "GROUPNAME"] call FNC_GearScript; in the Init field of the unit
// Example:
// [this, "SL", "1'1"] call FNC_GearScript;\
//
//when set to false, facewear types that are whitelisted will not be removed
FW_force_remove_facewear = false;

//forces adding an item to inventory. Works only if container is specified!
FW_enableOverfill = true;

_unit call FNC_RemoveAllGear;

//uncomment whichever loadout the mission is using

switch (_type) do {
	
	#include "loadouts\TCRMC.sqf"
	#include "loadouts\USARMYEAR.sqf"
	#include "loadouts\USMIL.sqf"
	#include "loadouts\USMCEAR.sqf"
	#include "loadouts\BRITWINTER.sqf"
	#include "loadouts\SOAR.sqf"
	#include "loadouts\IDF.sqf"
	#include "loadouts\USRNG.sqf"
	#include "loadouts\RUSD.sqf"
};