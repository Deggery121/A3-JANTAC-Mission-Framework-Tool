/*
 * Author: Olsen
 *
 * Starts tracking all units, except ones with FW_DontTrack set to true.
 *
 * Arguments:
 * none
 *
 * Return Value:
 * nothing
 *
 * Public: No
 */

	
	{	
		
		_team = (_x select 0);
		
		_count = _team call FNC_CountTeam;
		
		[_team, 4, _count] call FNC_SetTeamVariable;
		
	} forEach FW_Teams;
