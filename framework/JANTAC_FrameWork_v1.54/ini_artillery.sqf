// by ALIAS
// nul = [alias_target,smokes_rounds,flares_rounds,expl_rounds,smoke_radius,flares_radius,expl_radius,smokes_freq,flares_freq,expl_freq] execvm "ALartillery\alias_artillery.sqf";
// Tutorial: https://www.youtube.com/user/aliascartoons

/*
* Script MP and SP compatible
alias_target	- object name, array of markers and/or objects, or player in SP or MP
smokes_rounds	- integer
flares_rounds	- integer
expl_rounds		- integer

smoke_radius	- number/meters, area where smokes will be spawned when applicable
flares_radius	- number/meters
expl_radius		- number/meters

smokes_freq		- number/seconds between shots/spawn
flares_freq		- number/seconds between shots/spawn
expl_freq		- number/seconds between shots/spawn

=============== alias_target VALUES can be on of the following
"mp_alias" 			- if is a scenario where you want explosions to follow one of the alive players
"area_alias" 		- area defined by a marker called area_alias with radius of 200m where smokes and/or flares and/or explosions will be spawned
["marke_1",obj_1]	- array of markers or objects where you want to spawn explosions, insert as many as you want but make sure markers and objects exists on map

======= Example Usage ====================
> Smokes only
	- 20 rounds, in area with center in a marker called area_alias at an interval of 0.1 seconds
		nul = ["area_alias",20,0,0,300,0,0,0.1,0,0] execvm "ALartillery\alias_artillery.sqf";
	- 20 rounds around a random player at an interval of 5 seconds
		nul = ["mp_alias",20,0,0,0,0,0,5,0,0] execvm "ALartillery\alias_artillery.sqf";
	- 20 rounds in a random location from array at an interval of 1 seconds
		nul = [["t1","t2","t3",v1,v2],20,0,0,0,0,0,1,0,0] execvm "ALartillery\alias_artillery.sqf";

> Flares only
	- 30 rounds, in area with center in a marker called area_alias at an interval of 1 seconds
		nul = ["area_alias",0,30,0,0,300,0,0,1,0] execvm "ALartillery\alias_artillery.sqf";
	- 10 rounds around a random player at an interval of 1 seconds
		nul = ["mp_alias",0,10,0,0,0,0,0,1,0] execvm "ALartillery\alias_artillery.sqf";
	- 30 rounds in a random location from array at an interval of 1 seconds
		nul = [["t1","t2","t3",v1,v2],0,30,0,0,0,0,0,1,0] execvm "ALartillery\alias_artillery.sqf";

> Explosive shells only 
	- 10 rounds, in area with center in a marker called area_alias at an interval of 2 seconds
		nul = ["area_alias",0,0,10,0,0,300,0,0,2] execvm "ALartillery\alias_artillery.sqf";
	- 10 rounds around a random player at an interval of 2 seconds
		nul = ["mp_alias",0,0,10,0,0,0,0,0,2] execvm "ALartillery\alias_artillery.sqf";
	- 30 rounds in a random location from array at an interval of 2 seconds
		nul = [["t1","t2","t3",v1,v2],0,0,30,0,0,0,0,0,2] execvm "ALartillery\alias_artillery.sqf";

> All (smokes, flares and explosions)
	- in area defined by marker called area_alias will be spawned 30 smokes, 20 flares, 50 explosions in a radius of 300, 250 and 200, and different intervals between rounds
		nul = ["area_alias",30,25,50,300,250,200,2,10,1] execvm "ALartillery\alias_artillery.sqf";
*/

// TO DO AAA artillery