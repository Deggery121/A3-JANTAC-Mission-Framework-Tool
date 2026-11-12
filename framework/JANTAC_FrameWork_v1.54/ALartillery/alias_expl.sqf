// by ALIAS
// nul = [_obj_center,_radius,_expl_rounds,_expl_freq] execVM "ALartillery\alias_expl.sqf";

	private ["_rel_Pos","_xx ","_yy","_art_voice","_dire","_target_art","_marker_exp","_poz_x_ini","_poz_y_ini","_radius_art_p"];
	_target_art		=_this select 0;
	_radius_art		=_this select 1;
	_nr_art			=_this select 2;
	_freq_art		=_this select 3;

	_radius_art_p	=100; // edit this value if you want to change the distance between chosen player and explosions
	
switch (_target_art) do {
    case "mp_alias": {
		if (isNil "hunt_alias") then {execVM "ALartillery\alias_hunt.sqf"};
		waitUntil {!isNil "hunt_alias"};
		sleep 1;
		while {_nr_art>0} do {
			_art_voice = "land_helipadempty_f" createVehicle [0,0,0];
			_rel_Pos= [getPos hunt_alias,50+(random _radius_art_p), random 360] call BIS_fnc_relPos;
			_art_voice setPos [_rel_Pos select 0,_rel_Pos select 1,20];
			_fluier = ["fluier_1", "fluier_2", "fluier_3", "fluier_4", "fluier_5", "fluier_6", "fluier_7", "fluier_8", "fluier_9", "fluier_91", "fluier_92", "fluier_93"] call BIS_fnc_selectRandom;	
			[_art_voice,[_fluier,1000]] remoteExec ["say3d"];
			sleep 0.5 + random 1;		
			_bombi= "Rocket_03_HE_F" createVehicle _rel_Pos; waituntil {!isnull _bombi};
			deleteVehicle _art_voice;
			_nr_art=_nr_art-1;
			sleep _freq_art;
		};
	};
	case "area_alias": { 
		while {_nr_art>0} do {
			_art_voice = "land_helipadempty_f" createVehicle [0,0,0];
			_rel_Pos= [[getMarkerPos _target_art select 0,getMarkerPos _target_art select 1,50],random _radius_art, random 360] call BIS_fnc_relPos;
			_art_voice setPos [_rel_Pos select 0,_rel_Pos select 1,20];
			_fluier = ["fluier_1", "fluier_2", "fluier_3", "fluier_4", "fluier_5", "fluier_6", "fluier_7", "fluier_8", "fluier_9", "fluier_91", "fluier_92", "fluier_93"] call BIS_fnc_selectRandom;	
			[_art_voice,[_fluier,1000]] remoteExec ["say3d"];
			sleep 0.5 + random 1;		
			_bombi= "Rocket_03_HE_F" createVehicle [_rel_Pos select 0, _rel_Pos select 1,0];waituntil {!isnull _bombi};
			deleteVehicle _art_voice;
			_nr_art=_nr_art-1;
			sleep _freq_art;		
		};
	};
	case "area_alias1": { 
		while {_nr_art>0} do {
			_art_voice = "land_helipadempty_f" createVehicle [0,0,0];
			_rel_Pos= [[getMarkerPos _target_art select 0,getMarkerPos _target_art select 1,50],random _radius_art, random 360] call BIS_fnc_relPos;
			_art_voice setPos [_rel_Pos select 0,_rel_Pos select 1,20];
			_fluier = ["fluier_1", "fluier_2", "fluier_3", "fluier_4", "fluier_5", "fluier_6", "fluier_7", "fluier_8", "fluier_9", "fluier_91", "fluier_92", "fluier_93"] call BIS_fnc_selectRandom;	
			[_art_voice,[_fluier,1000]] remoteExec ["say3d"];
			sleep 0.5 + random 1;		
			_bombi= "Rocket_03_HE_F" createVehicle [_rel_Pos select 0, _rel_Pos select 1,0];waituntil {!isnull _bombi};
			deleteVehicle _art_voice;
			_nr_art=_nr_art-1;
			sleep _freq_art;		
		};
	};
	case "area_alias2": { 
		while {_nr_art>0} do {
			_art_voice = "land_helipadempty_f" createVehicle [0,0,0];
			_rel_Pos= [[getMarkerPos _target_art select 0,getMarkerPos _target_art select 1,50],random _radius_art, random 360] call BIS_fnc_relPos;
			_art_voice setPos [_rel_Pos select 0,_rel_Pos select 1,20];
			_fluier = ["fluier_1", "fluier_2", "fluier_3", "fluier_4", "fluier_5", "fluier_6", "fluier_7", "fluier_8", "fluier_9", "fluier_91", "fluier_92", "fluier_93"] call BIS_fnc_selectRandom;	
			[_art_voice,[_fluier,1000]] remoteExec ["say3d"];
			sleep 0.5 + random 1;		
			_bombi= "Rocket_03_HE_F" createVehicle [_rel_Pos select 0, _rel_Pos select 1,0];waituntil {!isnull _bombi};
			deleteVehicle _art_voice;
			_nr_art=_nr_art-1;
			sleep _freq_art;		
		};
	};
	case "area_alias3": { 
		while {_nr_art>0} do {
			_art_voice = "land_helipadempty_f" createVehicle [0,0,0];
			_rel_Pos= [[getMarkerPos _target_art select 0,getMarkerPos _target_art select 1,50],random _radius_art, random 360] call BIS_fnc_relPos;
			_art_voice setPos [_rel_Pos select 0,_rel_Pos select 1,20];
			_fluier = ["fluier_1", "fluier_2", "fluier_3", "fluier_4", "fluier_5", "fluier_6", "fluier_7", "fluier_8", "fluier_9", "fluier_91", "fluier_92", "fluier_93"] call BIS_fnc_selectRandom;	
			[_art_voice,[_fluier,1000]] remoteExec ["say3d"];
			sleep 0.5 + random 1;		
			_bombi= "Rocket_03_HE_F" createVehicle [_rel_Pos select 0, _rel_Pos select 1,0];waituntil {!isnull _bombi};
			deleteVehicle _art_voice;
			_nr_art=_nr_art-1;
			sleep _freq_art;		
		};
	};
	case "area_alias4": { 
		while {_nr_art>0} do {
			_art_voice = "land_helipadempty_f" createVehicle [0,0,0];
			_rel_Pos= [[getMarkerPos _target_art select 0,getMarkerPos _target_art select 1,50],random _radius_art, random 360] call BIS_fnc_relPos;
			_art_voice setPos [_rel_Pos select 0,_rel_Pos select 1,20];
			_fluier = ["fluier_1", "fluier_2", "fluier_3", "fluier_4", "fluier_5", "fluier_6", "fluier_7", "fluier_8", "fluier_9", "fluier_91", "fluier_92", "fluier_93"] call BIS_fnc_selectRandom;	
			[_art_voice,[_fluier,1000]] remoteExec ["say3d"];
			sleep 0.5 + random 1;		
			_bombi= "Rocket_03_HE_F" createVehicle [_rel_Pos select 0, _rel_Pos select 1,0];waituntil {!isnull _bombi};
			deleteVehicle _art_voice;
			_nr_art=_nr_art-1;
			sleep _freq_art;		
		};
	};
	default { 
		while {_nr_art>0} do {
			_art_voice = "land_helipadempty_f" createVehicle [0,0,0];
			_marker_exp=_target_art call BIS_fnc_selectRandom;
			if (_marker_exp in allMapMarkers) then {_rel_Pos= [getMarkerPos _marker_exp select 0,getMarkerPos _marker_exp select 1, 50];_art_voice setPos _rel_Pos;}
				else {_rel_Pos= [getPos _marker_exp select 0,getPos _marker_exp select 1, 50];_art_voice setPos [_rel_Pos select 0,_rel_Pos select 1,20];};
			_art_voice setPos [_rel_Pos select 0,_rel_Pos select 1,20];
			_fluier = ["fluier_1", "fluier_2", "fluier_3", "fluier_4", "fluier_5", "fluier_6", "fluier_7", "fluier_8", "fluier_9", "fluier_91", "fluier_92", "fluier_93"] call BIS_fnc_selectRandom;	
			[_art_voice,[_fluier,1000]] remoteExec ["say3d"];
			sleep 0.5 + random 1;		
			_bombi= "Rocket_03_HE_F" createVehicle [_rel_Pos select 0, _rel_Pos select 1,0];waituntil {!isnull _bombi};
			deleteVehicle _art_voice;
			_nr_art=_nr_art-1;
			sleep _freq_art;		
		};
	};
};