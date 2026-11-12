//For TVT it is recommended to use this module together with the radio scrambler module.
//This was done via script in the old framework but this port worked and didn't need to be touched up in any way

switch (_side) do { //Checks what team the player is on

	case west: { //If the player is on side west, he receives these radio channel names

		[1, "PLTNET 1"] call FNC_SetChannelName;
		[2, "CAS 2"] call FNC_SetChannelName;
		[3, "FIRES 3"] call FNC_SetChannelName;
	}; //End of west case
}; //End of switch