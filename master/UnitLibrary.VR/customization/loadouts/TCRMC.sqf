//AUTHOR: Kelly
//
//[this, "TCR_PL"] call FNC_GearScript; OFFICER
//[this, "TCR_SL"] call FNC_GearScript; SQUAD LEADER
//[this, "TCR_RTO"] call FNC_GearScript; SQUAD LEADER/RTO
//[this, "TCR_MD"] call FNC_GearScript; MEDIC
//[this, "TCR_TL"] call FNC_GearScript; TEAM LEADER GRENADIER
//[this, "TCR_TLB"] call FNC_GearScript; TEAM LEADER DEMO
//[this, "TCR_AR"] call FNC_GearScript; AUTO RIFLEMAN
//[this, "TCR_ARA"] call FNC_GearScript; ASST AUTO RIFLEMAN
//[this, "TCR_LAT"] call FNC_GearScript; LIGHT AT
//[this, "TCR_RIF"] call FNC_GearScript; RIFLEMAN
//[this, "TCR_CREW"] call FNC_GearScript; CREW COMMANDER
//[this, "TCR_CREW2"] call FNC_GearScript; CREW
//[this, "TCR_HAT"] call FNC_GearScript; HAT
//[this, "TCR_HATA"] call FNC_GearScript; HAT ASST
//[this, "TCR_CONR"] call FNC_GearScript; CONSCRIPT RIFLEMAN
//[this, "TCR_CONA"] call FNC_GearScript; CONSCRIPT AUTORIFLEMAN
//[this, "TCR_CONASS"] call FNC_GearScript; CONSCRIPT AUTORIFLEMAN ASST
//[this, "TCR_CONAT"] call FNC_GearScript; CONSCRIPT AT



#define package "TCR_"

SET_GROUP(uniform)
	["cwr3_b_uk_uniform_dpm"] call FNC_AddItemRandom;
	["cwr3_b_uk_headgear_mk5_helmet_dpm_net"] call FNC_AddItemRandom;
END_GROUP;
	
SET_GROUP(vest)
	["CUP_V_B_BAF_DPM_Osprey_Mk3_AutomaticRifleman"] call FNC_AddItemRandom;
END_GROUP;
	
SET_GROUP(IFAK)
	["ACE_elasticBandage", 10, "uniform"] call FNC_AddItem;
	["ACE_packingBandage", 10, "uniform"] call FNC_AddItem;
	["ACE_morphine", 1, "uniform"] call FNC_AddItem;
	["ACE_epinephrine", 1, "uniform"] call FNC_AddItem;
	["ACE_tourniquet", 4, "uniform"] call FNC_AddItem;
	["ACE_splint", 2, "backpack"] call FNC_AddItem;
END_GROUP;
	
SET_GROUP(items)
	["ACRE_PRC343", 1] call FNC_AddItem;
	["ItemMap"] call FNC_AddItem;
	["ItemCompass"] call FNC_AddItem;
	["ItemWatch"] call FNC_AddItem;
	["cigs_morley_cigpack"] call FNC_AddItem;
	["cigs_lighter"] call FNC_AddItem;
END_GROUP;
	
	
case (package + "PL"): {

	["cwr3_b_uk_backpack"] call FNC_AddItem;
	
	ADD_GROUP(uniform);
	ADD_GROUP(vest);
	ADD_GROUP(IFAK);
	ADD_GROUP(items);	
	
	["Binocular"] call FNC_AddItem;
	
	["ACRE_PRC148", 1] call FNC_AddItem; //Long range radio
	
	["CUP_20Rnd_762x51_FNFAL_M", 18,"vest"] call FNC_AddItem; //Magazines
	["CUP_13Rnd_9x19_Browning_HP", 2,"vest"] call FNC_AddItem; //Magazines
	["CUP_20Rnd_TE1_Red_Tracer_762x51_FNFAL_M", 4,"vest"] call FNC_AddItem; //Magazines
	
	["SmokeShell", 2] call FNC_AddItem; //White smoke
	["SmokeShellGreen", 1] call FNC_AddItem; //Green smoke
	["CUP_HandGrenade_M67", 1] call FNC_AddItem; //Frag grenade
	
	["cwr3_arifle_fnfal_hlag"] call FNC_AddItem; //Primary rifle
	["CUP_20Rnd_762x51_FNFAL_M"] call FNC_AddItem; // rifle mag
	["CUP_13Rnd_9x19_Browning_HP"] call FNC_AddItem; // pistol mag
	["CUP_hgun_Browning_HP"] call FNC_AddItem; // pistol
	

};



case (package + "MD"): {
	
	_unit call FNC_defineMedic;
	["cwr3_b_uk_backpack"] call FNC_AddItem;
	
	ADD_GROUP(uniform);	
	ADD_GROUP(vest);
	ADD_GROUP(IFAK);
	ADD_GROUP(items);	
	
	["CUP_20Rnd_762x51_FNFAL_M", 18,"vest"] call FNC_AddItem; //Magazines
	["CUP_20Rnd_TE1_Red_Tracer_762x51_FNFAL_M", 4,"vest"] call FNC_AddItem; //Magazines
	
	["SmokeShell", 2] call FNC_AddItem; //White smoke
	["SmokeShellGreen", 2] call FNC_AddItem; //Green smoke
	["CUP_HandGrenade_M67", 1] call FNC_AddItem; //Frag grenade

	["cwr3_arifle_fnfal_hlag"] call FNC_AddItem; //Primary rifle
	["CUP_20Rnd_762x51_FNFAL_M"] call FNC_AddItem; // rifle mag
	
	 
	
	//Medical Supplies
	["ACE_fieldDressing", 15, "backpack"] call FNC_AddItem;
	["ACE_elasticBandage", 40, "backpack"] call FNC_AddItem;
	["ACE_packingBandage", 40, "backpack"] call FNC_AddItem;
	["ACE_morphine", 12, "backpack"] call FNC_AddItem;
	["ACE_adenosine", 5, "backpack"] call FNC_AddItem;
	["ACE_epinephrine", 12, "backpack"] call FNC_AddItem;
	["ACE_tourniquet", 12, "backpack"] call FNC_AddItem;
	["ACE_splint", 12, "backpack"] call FNC_AddItem;
	["ACE_salineIV_500", 4, "backpack"] call FNC_AddItem;
	["ACE_bloodIV", 10, "backpack"] call FNC_AddItem;
	
	
};

case (package + "TL"): {

	["cwr3_b_uk_backpack"] call FNC_AddItem;
	
	["Binocular"] call FNC_AddItem;

	ADD_GROUP(uniform);
	ADD_GROUP(vest);
	ADD_GROUP(IFAK);
	ADD_GROUP(items);	
	
	["CUP_20Rnd_762x51_FNFAL_M", 18,"vest"] call FNC_AddItem; //Magazines
	["CUP_20Rnd_TE1_Red_Tracer_762x51_FNFAL_M", 4,"vest"] call FNC_AddItem; //Magazines
	
	["SmokeShell", 2] call FNC_AddItem; //White smoke
	["SmokeShellGreen", 1] call FNC_AddItem; //Green smoke
	["CUP_HandGrenade_M67", 2] call FNC_AddItem; //Frag grenade
	
	
	["cwr3_arifle_fnfal_hlag"] call FNC_AddItem; //Primary rifle
	["CUP_20Rnd_762x51_FNFAL_M"] call FNC_AddItem; // rifle mag
	
};


	

case (package + "AR"): {
	
	["cwr3_b_uk_backpack"] call FNC_AddItem;
	
	ADD_GROUP(uniform);
	ADD_GROUP(vest);
	ADD_GROUP(IFAK);
	ADD_GROUP(items);
	
	["CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M", 4,"vest"] call FNC_AddItem; //Magazines
	
	["SmokeShell", 2] call FNC_AddItem; //White smoke
	["CUP_HandGrenade_M67", 2] call FNC_AddItem; //Frag grenade

	["CUP_lmg_L7A2_Flat"] call FNC_AddItem; //Primary rifle
	
	["CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M"] call FNC_AddItem; // starting magazine
	
	 
	
};

case (package + "ARA"): {
	
	["cwr3_b_uk_backpack"] call FNC_AddItem;
	
	ADD_GROUP(uniform);	
	ADD_GROUP(vest);
	ADD_GROUP(IFAK);
	ADD_GROUP(items);
	
	["CUP_20Rnd_762x51_FNFAL_M", 14,"vest"] call FNC_AddItem; //Magazines
	["CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M", 4,"backpack"] call FNC_AddItem; 
	["CUP_20Rnd_TE1_Red_Tracer_762x51_FNFAL_M", 4,"vest"] call FNC_AddItem; //Magazines
	
	["SmokeShell", 2] call FNC_AddItem; //White smoke
	["CUP_HandGrenade_M67", 2] call FNC_AddItem; //Frag grenade

	["cwr3_arifle_fnfal_hlag"] call FNC_AddItem; //Primary rifle
	["CUP_20Rnd_762x51_FNFAL_M"] call FNC_AddItem; //rifle mag
	
	 
	
};



case (package + "LAT"): {

	["cwr3_b_uk_backpack"] call FNC_AddItem;

		
	ADD_GROUP(uniform);	
	ADD_GROUP(vest);
	ADD_GROUP(IFAK);
	ADD_GROUP(items);	
	
	["CUP_20Rnd_762x51_FNFAL_M", 18,"vest"] call FNC_AddItem; //Magazines
	["CUP_20Rnd_TE1_Red_Tracer_762x51_FNFAL_M", 4,"vest"] call FNC_AddItem; //Magazines
	
	["SmokeShell", 2] call FNC_AddItem; //White smoke
	["SmokeShellGreen", 1] call FNC_AddItem; //Green smoke
	["CUP_HandGrenade_M67", 2] call FNC_AddItem; //Frag grenade
	
	["cwr3_arifle_fnfal_hlag"] call FNC_AddItem; //Primary rifle
	["CUP_20Rnd_762x51_FNFAL_M"] call FNC_AddItem; //rifle mag
	["CUP_launch_M72A6"] call FNC_AddItem;
	
};


case (package + "CREW"): {

	
	
	["cwr3_b_uk_uniform_dpm"] call FNC_AddItemRandom;	
	["cwr3_b_headgear_cvc_goggles"] call FNC_AddItemRandom;
	["CUP_V_B_BAF_DPM_Osprey_Mk3_AutomaticRifleman"] call FNC_AddItemRandom;

	
	ADD_GROUP(IFAK);
	ADD_GROUP(items);	
	
	["ACRE_PRC148", 1] call FNC_AddItem; //Long range radio
		
	["cwr3_30rnd_sterling_m", 9,"vest"] call FNC_AddItem; //Magazines
	["CUP_13Rnd_9x19_Browning_HP", 3,"vest"] call FNC_AddItem; //Magazines

	["cwr3_smg_sterling"] call FNC_AddItem; //Primary rifle
	["cwr3_30rnd_sterling_m"] call FNC_AddItem; // rifle mag
	["CUP_13Rnd_9x19_Browning_HP"] call FNC_AddItem; // pistol mag
	["CUP_hgun_Browning_HP"] call FNC_AddItem; // pistol
	
	 
};

case (package + "CREW2"): {

	
	
	["cwr3_b_uk_uniform_dpm"] call FNC_AddItemRandom;	
	["cwr3_b_headgear_cvc_goggles"] call FNC_AddItemRandom;
	["CUP_V_B_BAF_DPM_Osprey_Mk3_AutomaticRifleman"] call FNC_AddItemRandom;
	
	ADD_GROUP(IFAK);
	ADD_GROUP(items);
		
	["cwr3_30rnd_sterling_m", 9,"vest"] call FNC_AddItem; //Magazines

	["cwr3_smg_sterling"] call FNC_AddItem; //Primary rifle
	["cwr3_30rnd_sterling_m"] call FNC_AddItem; // starting magazine
	
	 
};

case (package + "RIF"): {

	["cwr3_b_uk_backpack"] call FNC_AddItem;

		
	ADD_GROUP(uniform);	
	ADD_GROUP(vest);
	ADD_GROUP(IFAK);
	ADD_GROUP(items);	
	
	["CUP_20Rnd_762x51_FNFAL_M", 18,"vest"] call FNC_AddItem; //Magazines
	["CUP_20Rnd_TE1_Red_Tracer_762x51_FNFAL_M", 4,"vest"] call FNC_AddItem; //Magazines
	
	["SmokeShell", 2] call FNC_AddItem; //White smoke
	["SmokeShellGreen", 1] call FNC_AddItem; //Green smoke
	["CUP_HandGrenade_M67", 2] call FNC_AddItem; //Frag grenade
	
	["cwr3_arifle_fnfal_hlag"] call FNC_AddItem; //Primary rifle
	["CUP_20Rnd_762x51_FNFAL_M"] call FNC_AddItem; //rifle mag

};

case (package + "RTO"): {

	["cwr3_b_backpack_radio"] call FNC_AddItem;
		
	ADD_GROUP(uniform);	
	ADD_GROUP(vest);
	ADD_GROUP(IFAK);
	ADD_GROUP(items);	
	
	["CUP_20Rnd_762x51_FNFAL_M", 18,"vest"] call FNC_AddItem; //Magazines
	["CUP_20Rnd_TE1_Red_Tracer_762x51_FNFAL_M", 4,"vest"] call FNC_AddItem; //Magazines
	
	["SmokeShell", 2] call FNC_AddItem; //White smoke
	["SmokeShellGreen", 1] call FNC_AddItem; //Green smoke
	["CUP_HandGrenade_M67", 2] call FNC_AddItem; //Frag grenade
	
	["cwr3_arifle_fnfal_hlag"] call FNC_AddItem; //Primary rifle
	["CUP_20Rnd_762x51_FNFAL_M"] call FNC_AddItem; //rifle mag

};

case (package + "HAT"): {

	["cwr3_b_uk_backpack"] call FNC_AddItem;
		
	ADD_GROUP(uniform);	
	ADD_GROUP(vest);
	ADD_GROUP(IFAK);
	ADD_GROUP(items);	
	
	["CUP_20Rnd_762x51_FNFAL_M", 14,"vest"] call FNC_AddItem; //Magazines
	["CUP_20Rnd_TE1_Red_Tracer_762x51_FNFAL_M", 1,"vest"] call FNC_AddItem; //Magazines
	["cwr3_carlgustaf_heat_m", 3,"backpack"] call FNC_AddItem; 
	
	["SmokeShell", 2] call FNC_AddItem; //White smoke
	["SmokeShellGreen", 1] call FNC_AddItem; //Green smoke
	["CUP_HandGrenade_M67", 2] call FNC_AddItem; //Frag grenade
	
	["cwr3_arifle_fnfal_hlag"] call FNC_AddItem; //Primary rifle
	["CUP_20Rnd_762x51_FNFAL_M"] call FNC_AddItem; //rifle mag
	["cwr3_launch_carlgustaf"] call FNC_AddItem;

};

case (package + "HATA"): {

	["cwr3_b_uk_backpack"] call FNC_AddItem;
		
	ADD_GROUP(uniform);	
	ADD_GROUP(vest);
	ADD_GROUP(IFAK);
	ADD_GROUP(items);	
	
	["CUP_20Rnd_762x51_FNFAL_M", 14,"vest"] call FNC_AddItem; //Magazines
	["CUP_20Rnd_TE1_Red_Tracer_762x51_FNFAL_M", 1,"vest"] call FNC_AddItem; //Magazines
	["cwr3_carlgustaf_heat_m", 3,"backpack"] call FNC_AddItem; 
	
	["SmokeShell", 2] call FNC_AddItem; //White smoke
	["SmokeShellGreen", 1] call FNC_AddItem; //Green smoke
	["CUP_HandGrenade_M67", 2] call FNC_AddItem; //Frag grenade
	
	["cwr3_arifle_fnfal_hlag"] call FNC_AddItem; //Primary rifle
	["CUP_20Rnd_762x51_FNFAL_M"] call FNC_AddItem; //rifle mag

};

case (package + "CONR"): {

	["cwr3_b_uk_backpack"] call FNC_AddItem;

		
	ADD_GROUP(uniform);	
	ADD_GROUP(vest);
	ADD_GROUP(IFAK);
	ADD_GROUP(items);	
	
	["CUP_10x_303_M", 40,"vest"] call FNC_AddItem; //Magazines
	
	["SmokeShell", 2] call FNC_AddItem; //White smoke
	["SmokeShellGreen", 1] call FNC_AddItem; //Green smoke
	["CUP_HandGrenade_M67", 2] call FNC_AddItem; //Frag grenade
	
	["CUP_srifle_LeeEnfield"] call FNC_AddItem; //Primary rifle
	["CUP_10x_303_M"] call FNC_AddItem; //rifle mag

};

case (package + "CONA"): {

	["cwr3_b_uk_backpack"] call FNC_AddItem;

		
	ADD_GROUP(uniform);	
	ADD_GROUP(vest);
	ADD_GROUP(IFAK);
	ADD_GROUP(items);	
	
	["CUP_20Rnd_762x51_FNFAL_M", 9,"vest"] call FNC_AddItem; //Magazines
	
	["SmokeShell", 2] call FNC_AddItem; //White smoke
	["SmokeShellGreen", 1] call FNC_AddItem; //Green smoke
	["CUP_HandGrenade_M67", 2] call FNC_AddItem; //Frag grenade
	
	["CUP_arifle_FNFAL5060"] call FNC_AddItem; //Primary rifle
	["CUP_20Rnd_762x51_FNFAL_M"] call FNC_AddItem; //rifle mag
	
};

case (package + "CONASS"): {

	["cwr3_b_uk_backpack"] call FNC_AddItem;

		
	ADD_GROUP(uniform);	
	ADD_GROUP(vest);
	ADD_GROUP(IFAK);
	ADD_GROUP(items);	
	
	["CUP_20Rnd_762x51_FNFAL_M", 9,"vest"] call FNC_AddItem; //Magazines
	
	["SmokeShell", 2] call FNC_AddItem; //White smoke
	["SmokeShellGreen", 1] call FNC_AddItem; //Green smoke
	["CUP_HandGrenade_M67", 2] call FNC_AddItem; //Frag grenade
	
	["CUP_arifle_FNFAL5060"] call FNC_AddItem; //Primary rifle
	["CUP_20Rnd_762x51_FNFAL_M"] call FNC_AddItem; //rifle mag
	
};

case (package + "CONAT"): {

	["cwr3_b_uk_backpack"] call FNC_AddItem;

		
	ADD_GROUP(uniform);	
	ADD_GROUP(vest);
	ADD_GROUP(IFAK);
	ADD_GROUP(items);	
	
	["CUP_20Rnd_762x51_FNFAL_M", 9,"vest"] call FNC_AddItem; //Magazines
	
	["SmokeShell", 2] call FNC_AddItem; //White smoke
	["SmokeShellGreen", 1] call FNC_AddItem; //Green smoke
	["CUP_HandGrenade_M67", 2] call FNC_AddItem; //Frag grenade
	
	["CUP_arifle_FNFAL5060"] call FNC_AddItem; //Primary rifle
	["CUP_20Rnd_762x51_FNFAL_M"] call FNC_AddItem; //rifle mag
	
};




