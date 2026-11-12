// by ALIAS
// Tutorial: https://www.youtube.com/user/aliascartoons

============================================= =============================================
============== Spawned NAPALM bomber ==============
============================================= =============================================

null = [start_marker, waypoint_marker, number_of_bombs, bomb_drop_interval,plane_type] execVM "AL_napalm\bomber_nap.sqf";
/*
start_marker		- marker name from where the bombs will start to drop
waypoint_marker		- the plane (bomber) will fly in the direction detemined by this marker and continue flying for 3000 meters where it will be deleted
number_of_bombs		- integer, number of napalm bombs you want to drop, test to see the amount your computer can handle, mind the frames
bomb_drop_interval	- seconds, the interval between bomb drops, can be an integer or a random number, test and see what works best for you
plane_type			- string, class name of the plane you wanna use as bomber

The script can be run via debug console, script, action menu, radio menu trigger(but with care and only if you have a good understanding of locality).
As it is the script should be run in global space.
*/

======== EXAMPLE of using a bomber to_drop napalm bombs
// for MP the safest way to run this script is in global space
null = ["nap_1","nap_2", 4, 1+ random 1,"B_Plane_CAS_01_F"] execVM "AL_napalm\bomber_nap.sqf";



============================================= =============================================
=========== Spawning napalm explosion =============================================
============================================= =============================================

null = [object_name] execVM "AL_napalm\alias_obj_sing.sqf";

/*
object_name - string, name of the object you want to use as source for napalm explosion, 
			the object can be pre-place in editor or dynamically created
*/

======== EXAMPLE - using pre-placed/spawned object to_spawn the napalm explosion
// for MP the safest way to run this script is in global space

null = [blowup] execVM "AL_napalm\alias_obj_sing.sqf";


============================================= =============================================
============= Enableing players to drop napalm bombs  =============================================
============================================= =============================================

======== EXAMPLE for player droped napalm designate the type_of bomb by giving the className below
in this example i used "Bomb_04_F" found on vanilla Wipeout plane

// you can define whatever bomb you want to work as napalm, edit value of _custom_napalm_bomb variable
// place the line below inside the plane' init field
this addEventHandler ["Fired",{private ["_bomb_type","_plane_player","_custom_napalm_bomb"]; _plane_player = _this select 0; _bomb_type = _this select 6; _custom_napalm_bomb = "rhs_ammo_mk82"; [[_bomb_type,_plane_player,_custom_napalm_bomb],"AL_napalm\al_napalm_player.sqf"] remoteExec ["execVM"]}];