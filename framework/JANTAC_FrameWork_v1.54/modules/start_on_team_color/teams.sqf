//preset fireteam group colours
//id = ["RED", this] execVM "modules\start_on_team_color\teams.sqf";
sleep 5;
private ["_type", "_unit"];

_type = _this select 0;
_unit = _this select 1;
	
Sleep 5;
		
switch (_type) do
{

	case "RED":
	{
	_unit assignTeam "RED";
	};

	case "GREEN":
	{
	_unit assignTeam "GREEN";
	};
	
	case "BLUE":
	{
	_unit assignTeam "BLUE";

	};

	case "YELLOW":
	{
	_unit assignTeam "YELLOW";
	};

};

//THIS IS IN HERE BECAUSE THE FNC AUTO COLOR DOES NOT SEEM TO WORK WITH GROUP LEADERS