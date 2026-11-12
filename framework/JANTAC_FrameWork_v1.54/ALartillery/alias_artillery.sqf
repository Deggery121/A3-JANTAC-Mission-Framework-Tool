// by ALIAS
// nul = [alias_target,smokes_rounds,flares_rounds,expl_rounds,smoke_radius,flares_radius,expl_radius,smokes_freq,flares_freq,expl_freq] execvm "ALartillery\alias_artillery.sqf";

// TO DO error management

if (!isserver) exitWith {};

private ["_smokes","_flares","_expl_shell","_radius"];

_obj_center     =_this select 0;
_smokes_rounds	=_this select 1;
_flares_rounds	=_this select 2;
_expl_rounds	=_this select 3;

_smoke_radius	=_this select 4;
_flares_radius	=_this select 5;
_expl_radius	=_this select 6;

_smokes_freq	=_this select 7;
_flares_freq	=_this select 8;
_expl_freq		=_this select 9;

if (_smokes_rounds>0) then {
	nul = [_obj_center,_smoke_radius,_smokes_rounds,_smokes_freq] execVM "ALartillery\alias_smokes.sqf";
};

if (_flares_rounds>0) then {
	nul = [_obj_center,_flares_radius,_flares_rounds,_flares_freq] execVM "ALartillery\alias_flares.sqf";
};

if (_expl_rounds>0) then {
	nul = [_obj_center,_expl_radius,_expl_rounds,_expl_freq] execVM "ALartillery\alias_expl.sqf";
};