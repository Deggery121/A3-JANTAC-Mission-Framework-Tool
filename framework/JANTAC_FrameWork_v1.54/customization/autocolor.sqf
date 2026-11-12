//Automatically colors player's team color within group based on unit init parameters.
//Example: "[this, "RED"] call FNC_Autocolor;" makes unit team color red.
private ["_unit", "_type"];

_unit = _this select 0;
_type = _this select 1;

switch (_type) do {

	case "RED": {
	
		[[_unit, "RED"], "assignTeam", true, false, true] call BIS_fnc_MP;

	};

	case "BLUE": {
	
		[[_unit, "BLUE"], "assignTeam", true, false, true] call BIS_fnc_MP;

	};	
	
	case "GREEN": {
	
		[[_unit, "GREEN"], "assignTeam", true, true, true] call BIS_fnc_MP;

	};	
	
	case "YELLOW": {
	
		[[_unit, "YELLOW"], "assignTeam", true, true, true] call BIS_fnc_MP;

	};	
	
};