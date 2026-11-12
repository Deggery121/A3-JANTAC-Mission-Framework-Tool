//array containing vehicles that will have option to spawn AI driver in them
#define VEHS ['LIB_UK_LCI','sab_nl_dido','sab_nl_liberty','sab_nl_ptboat']

//use line below to enable the module for all tracked vehicles in the mission
//#define VEHS call {_vehs = []; {if (typeOf _x isKindOf 'Tank') then {_vehs pushBack _x};} foreach vehicles; _vehs;}
