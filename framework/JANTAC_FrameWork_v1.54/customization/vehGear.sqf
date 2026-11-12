#include "core\vehGearCore.sqf" //DO NOT REMOVE
//This is a port from Olsen Framework v5, mission makers should carry all of their vehicle gear an a vehGear.sqf file they carry over to create a large pool of templates for other mission makers.

// Call this with [this, "LOADOUT"] call FNC_VehicleGearScript; in the Init field of the vehicle
// Example:
// [this, "HUMMVEE"] call FNC_VehicleGearScript;

switch (_type) do {

	case "HUMMVEE": {

		_vehicle call FNC_RemoveAllVehicleGear;

		["30Rnd_556x45_Stanag", 8] call FNC_AddItemVehicle;

	};
};