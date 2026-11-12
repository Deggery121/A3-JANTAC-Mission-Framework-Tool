// by ALIAS
// 	nul = [_obj_center,_radius,_flares_rounds,_flares_freq] execVM "ALartillery\alias_flares.sqf";

// TO DO flares with less particles and brighter

	private ["_rel_Pos","_poz","_xx ","_yy","_dire","_color","_poz_x_ini","_poz_y_ini","_radius_art_p","_obj_art"];
	_obj_art		=_this select 0;
	_radius_art		=_this select 1;
	_no_flares		=_this select 2;
	_freq_flares	=_this select 3;

	_radius_art_p	=3; // edit this value if you want to change the distance between chosen player and flares		

switch (_obj_art) do {
    case "mp_alias": {
		if (isNil "hunt_alias") then {execVM "ALartillery\alias_hunt.sqf"};
		waitUntil {!isNil "hunt_alias"};
		sleep 1;
		while {_no_flares>0} do {
		_color = ["F_20mm_white", "F_20mm_Red", "F_20mm_yellow", "F_20mm_green"] call BIS_fnc_selectRandom;		
		_rel_Pos= [[getPos hunt_alias select 0,getPos hunt_alias select 1,150+(random 100)],random _radius_art_p, random 360] call BIS_fnc_relPos;
		_flob 	= _color createvehicle _rel_Pos;
		_flob setVelocity [+0.5,+1,+1];
		_no_flares=_no_flares-1;
		sleep _freq_flares;
		};	
	};
	case "area_alias": { 
		while {_no_flares>0} do {
		_color = ["F_20mm_white", "F_20mm_Red", "F_20mm_yellow", "F_20mm_green"] call BIS_fnc_selectRandom;				
		_rel_Pos= [[getMarkerPos _obj_art select 0,getMarkerPos _obj_art select 1,150+(random 100)],random _radius_art, random 360] call BIS_fnc_relPos;		
		_flob 	= _color createvehicle _rel_Pos;
		_flob setVelocity [+0.5,+1,+1];
		_no_flares=_no_flares-1;
		sleep _freq_flares;	
		};
	
	};
	default { 
		while {_no_flares>0} do {
		_color = ["F_20mm_white", "F_20mm_Red", "F_20mm_yellow", "F_20mm_green"] call BIS_fnc_selectRandom;			
		_marker_exp=_obj_art call BIS_fnc_selectRandom;
		if (_marker_exp in allMapMarkers) then {_rel_Pos= [getMarkerPos _marker_exp select 0,getMarkerPos _marker_exp select 1, 150+random 100];}
			else {_rel_Pos= [getPos _marker_exp select 0,getPos _marker_exp select 1, 150+random 100];};
		_flob 	= _color createvehicle _rel_Pos;
		_flob setVelocity [+0.5,+1,+1];
		_no_flares=_no_flares-1;
		sleep _freq_flares;	
		};
	};
};