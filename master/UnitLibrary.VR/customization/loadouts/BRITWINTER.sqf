//AUTHOR: Richard
//
//[this, "BRW_PL"] call FNC_GearScript; OFFICER
//[this, "BRW_SL"] call FNC_GearScript; SQUAD LEADER
//[this, "BRW_MD"] call FNC_GearScript; MEDIC
//[this, "BRW_TL"] call FNC_GearScript; TEAM LEADER
//[this, "BRW_MG"] call FNC_GearScript; MACHINEGUNNER
//[this, "BRW_MGA"] call FNC_GearScript; MG ASSISTANT
//[this, "BRW_LAT"] call FNC_GearScript; LIGHT ANTI-TANK
//[this, "BRW_RIF"] call FNC_GearScript; RIFLEMAN
//[this, "BRW_SLMAT"] call FNC_GearScript; SQUAD LEADER MAT TEAM
//[this, "BRW_MAT"] call FNC_GearScript; MAT OPERATOR
//[this, "BRW_MATA"] call FNC_GearScript; MAT ASST/AMMOBEARER

#define package "BRW_"

SET_GROUP(uniform)
	["cwr3_b_uk_uniform_dpm_weathered_gloves", "cwr3_b_uk_uniform_dpm_gloves"] call FNC_AddItemRandom;
	["cwr3_b_uk_headgear_m76_olive_net"] call FNC_AddItemRandom;
	//["CUP_V_JPC_Fastbelt_rngr"] call FNC_AddItemRandom;
	//["Dust_Scrim_EMRW", "CUP_G_RUS_Ratnik_Balaclava_Desert_4"] call FNC_AddItemRandom;
END_GROUP;
	
SET_GROUP(goggles) //foliage on helmet
	["Dust_Scrim_EMRW", "Dust_Scrim_EMRW", "Dust_Scrim_EMRD"] call FNC_AddItemRandom;
END_GROUP;	
	
SET_GROUP(IFAK)
	["ACE_fieldDressing", 6, "uniform"] call FNC_AddItem;
	["ACE_elasticBandage", 6, "uniform"] call FNC_AddItem;
	["ACE_packingBandage", 6, "uniform"] call FNC_AddItem;
	["ACE_morphine", 1, "uniform"] call FNC_AddItem;
	["ACE_epinephrine", 1, "uniform"] call FNC_AddItem;
	["ACE_tourniquet", 1, "uniform"] call FNC_AddItem;
END_GROUP;
	
SET_GROUP(items)
	["ACRE_PRC343", 1] call FNC_AddItem;
	["ItemMap"] call FNC_AddItem;
	["ItemCompass"] call FNC_AddItem;
	["ItemWatch"] call FNC_AddItem;
	//["ACE_MapTools"] call FNC_AddItem;
	["cigs_eckstein_cigpack"] call FNC_AddItem;
	["cigs_lighter"] call FNC_AddItem;
END_GROUP;
	
	
case (package + "PL"): {
	
	["CUP_V_B_PASGT_winter"] call FNC_AddItemRandom;
	["cwr3_b_uk_backpack"] call FNC_AddItemRandom;
	
	ADD_GROUP(uniform);	
	ADD_GROUP(IFAK);
	ADD_GROUP(items);
	ADD_GROUP(goggles);
	
	["Binocular"] call FNC_AddItem;
	
	["ACRE_PRC148", 1] call FNC_AddItem; //Long range radio
	
	["CUP_20Rnd_762x51_FNFAL_M", 11,"vest"] call FNC_AddItem; //Magazines
	["CUP_20Rnd_TE1_Red_Tracer_762x51_FNFAL_M", 3,"vest"] call FNC_AddItem;
	
	["SmokeShell", 2] call FNC_AddItem; //White smoke
	["SmokeShellGreen", 1] call FNC_AddItem; //Green smoke
	["CUP_HandGrenade_M67", 2] call FNC_AddItem; //Frag grenade
	["ACE_EntrenchingTool", 1] call FNC_AddItem; //Entrenching tool
	
	["CUP_arifle_FNFAL5061_wooden"] call FNC_AddItem; //Primary rifle
	["CUP_20Rnd_762x51_FNFAL_M"] call FNC_AddItem; // starting magazine


};

case (package + "SL"): {
	
	["CUP_V_B_PASGT_winter"] call FNC_AddItemRandom;
	["cwr3_b_uk_backpack"] call FNC_AddItemRandom;
	
	ADD_GROUP(uniform);	
	ADD_GROUP(IFAK);
	ADD_GROUP(items);
	ADD_GROUP(goggles);
	
	["Binocular"] call FNC_AddItem;
	
	["ACRE_PRC148", 1] call FNC_AddItem; //Long range radio
	
	["CUP_20Rnd_762x51_FNFAL_M", 11,"vest"] call FNC_AddItem; //Magazines
	["CUP_20Rnd_TE1_Red_Tracer_762x51_FNFAL_M", 3,"vest"] call FNC_AddItem;
	
	["SmokeShell", 2] call FNC_AddItem; //White smoke
	["SmokeShellGreen", 1] call FNC_AddItem; //Green smoke
	["CUP_HandGrenade_M67", 2] call FNC_AddItem; //Frag grenade
	["ACE_EntrenchingTool", 1] call FNC_AddItem; //Entrenching tool

	["CUP_arifle_FNFAL5061_wooden"] call FNC_AddItem; //Primary rifle
	["CUP_20Rnd_762x51_FNFAL_M"] call FNC_AddItem; // starting magazine
	
};

case (package + "MD"): {
	
	_unit call FNC_defineMedic;
	["CUP_V_B_PASGT_winter"] call FNC_AddItemRandom;
	["cwr3_b_backpack_alice_medic_empty"] call FNC_AddItem;
	
	ADD_GROUP(uniform);	
	ADD_GROUP(IFAK);
	ADD_GROUP(items);
	ADD_GROUP(goggles);
	
	["cwr3_30rnd_sterling_m", 11,"vest"] call FNC_AddItem; //Magazines
	
	["SmokeShell", 2] call FNC_AddItem; //White smoke
	["SmokeShellGreen", 2] call FNC_AddItem; //Green smoke
	["CUP_HandGrenade_M67", 1] call FNC_AddItem; //Frag grenade
	["ACE_EntrenchingTool", 1] call FNC_AddItem; //Entrenching tool

	["cwr3_smg_sterling"] call FNC_AddItem; //Primary rifle
	["cwr3_30rnd_sterling_m"] call FNC_AddItem; // starting magazine
	
	//Medical Supplies
	["ACE_fieldDressing", 15, "backpack"] call FNC_AddItem;
	["ACE_elasticBandage", 35, "backpack"] call FNC_AddItem;
	["ACE_packingBandage", 25, "backpack"] call FNC_AddItem;
	["ACE_morphine", 12, "backpack"] call FNC_AddItem;
	["ACE_adenosine", 5, "backpack"] call FNC_AddItem;
	["ACE_epinephrine", 12, "backpack"] call FNC_AddItem;
	["ACE_tourniquet", 8, "backpack"] call FNC_AddItem;
	["ACE_splint", 12, "backpack"] call FNC_AddItem;
	["ACE_salineIV_500", 2, "backpack"] call FNC_AddItem;
	["ACE_bloodIV", 6, "backpack"] call FNC_AddItem;
	
	
};

case (package + "TL"): {
	
	["CUP_V_B_PASGT_winter"] call FNC_AddItemRandom;
	["cwr3_b_uk_backpack"] call FNC_AddItemRandom;
	
	ADD_GROUP(uniform);	
	ADD_GROUP(IFAK);
	ADD_GROUP(items);
	ADD_GROUP(goggles);
	
	["Binocular"] call FNC_AddItem;
	
	["CUP_20Rnd_762x51_FNFAL_M", 11,"vest"] call FNC_AddItem; //Magazines
	["CUP_20Rnd_TE1_Red_Tracer_762x51_FNFAL_M", 3,"vest"] call FNC_AddItem;
	
	["SmokeShell", 2] call FNC_AddItem; //White smoke
	["SmokeShellGreen", 1] call FNC_AddItem; //Green smoke
	["CUP_HandGrenade_M67", 2] call FNC_AddItem; //Frag grenade
	["DemoCharge_Remote_Mag", 1] call FNC_AddItem; //Demo charged
	["ACE_Clacker", 1] call FNC_AddItem; //Clacker
	["ACE_EntrenchingTool", 1] call FNC_AddItem; //Entrenching tool

	["CUP_arifle_FNFAL5061_wooden"] call FNC_AddItem; //Primary rifle
	["CUP_20Rnd_762x51_FNFAL_M"] call FNC_AddItem; // starting magazine

};

case (package + "MG"): {
	
	["CUP_V_B_PASGT_winter"] call FNC_AddItemRandom;
	["cwr3_b_backpack_alice"] call FNC_AddItemRandom;
	
	ADD_GROUP(uniform);	
	ADD_GROUP(IFAK);
	ADD_GROUP(items);
	ADD_GROUP(goggles);
	
	["CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M", 3,"vest"] call FNC_AddItem; //Magazines
	
	["SmokeShell", 2] call FNC_AddItem; //White smoke
	["CUP_HandGrenade_M67", 1] call FNC_AddItem; //Frag grenade
	["ACE_EntrenchingTool", 1] call FNC_AddItem; //Entrenching tool

	["CUP_lmg_FNMAG"] call FNC_AddItem; //Primary rifle
	["CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M"] call FNC_AddItem; // starting magazine
	
};

case (package + "MGA"): {
	
	["CUP_V_B_PASGT_winter"] call FNC_AddItemRandom;
	["cwr3_b_backpack_alice"] call FNC_AddItemRandom;
	
	ADD_GROUP(uniform);	
	ADD_GROUP(IFAK);
	ADD_GROUP(items);
	ADD_GROUP(goggles);
	
	["CUP_20Rnd_762x51_FNFAL_M", 12,"vest"] call FNC_AddItem; //Magazines
	["CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M", 3,"backpack"] call FNC_AddItem; 
	
	["SmokeShell", 2] call FNC_AddItem; //White smoke
	["CUP_HandGrenade_M67", 1] call FNC_AddItem; //Frag grenade
	["ACE_EntrenchingTool", 1] call FNC_AddItem; //Entrenching tool

	["CUP_arifle_FNFAL5061_wooden"] call FNC_AddItem; //Primary rifle
	["CUP_20Rnd_762x51_FNFAL_M"] call FNC_AddItem; // starting magazine
	
};

case (package + "LAT"): {
	

	["CUP_V_B_PASGT_winter"] call FNC_AddItemRandom;
	["cwr3_b_uk_backpack"] call FNC_AddItemRandom;
	
	ADD_GROUP(uniform);	
	ADD_GROUP(IFAK);
	ADD_GROUP(items);
	ADD_GROUP(goggles);
	
	["CUP_20Rnd_762x51_FNFAL_M", 15,"vest"] call FNC_AddItem; //Magazines
	
	["SmokeShell", 2] call FNC_AddItem; //White smoke
	["SmokeShellGreen", 1] call FNC_AddItem; //Green smoke
	["CUP_HandGrenade_M67", 2] call FNC_AddItem; //Frag grenade
	["ACE_EntrenchingTool", 1] call FNC_AddItem; //Entrenching tool

	["CUP_arifle_FNFAL5061_wooden"] call FNC_AddItem; //Primary rifle
	["CUP_20Rnd_762x51_FNFAL_M"] call FNC_AddItem; // starting magazine

	["CUP_launch_M72A6"] call FNC_AddItem; //Launcher	
	
};

case (package + "RIF"): {
	

	["CUP_V_B_PASGT_winter"] call FNC_AddItemRandom;
	["cwr3_b_uk_backpack"] call FNC_AddItemRandom;
	
	ADD_GROUP(uniform);	
	ADD_GROUP(IFAK);
	ADD_GROUP(items);
	ADD_GROUP(goggles);
	
	["CUP_20Rnd_762x51_FNFAL_M", 16,"vest"] call FNC_AddItem; //Magazines
	
	["SmokeShell", 2] call FNC_AddItem; //White smoke
	["SmokeShellGreen", 1] call FNC_AddItem; //Green smoke
	["CUP_HandGrenade_M67", 2] call FNC_AddItem; //Frag grenade
	["ACE_EntrenchingTool", 1] call FNC_AddItem; //Entrenching tool

	["CUP_arifle_FNFAL5061_wooden"] call FNC_AddItem; //Primary rifle
	["CUP_20Rnd_762x51_FNFAL_M"] call FNC_AddItem; // starting magazine

	
};

case (package + "SLAT"): {
	
	["CUP_V_B_PASGT_winter"] call FNC_AddItemRandom;
	["cwr3_b_backpack_alice"] call FNC_AddItemRandom;
	
	ADD_GROUP(uniform);	
	ADD_GROUP(IFAK);
	ADD_GROUP(items);
	ADD_GROUP(goggles);
	
	["Binocular"] call FNC_AddItem;
	
	["ACRE_PRC148", 1] call FNC_AddItem; //Long range radio
	
	["CUP_20Rnd_762x51_FNFAL_M", 11,"vest"] call FNC_AddItem; //Magazines
	["CUP_20Rnd_TE1_Red_Tracer_762x51_FNFAL_M", 2,"vest"] call FNC_AddItem;
	
	["SmokeShell", 2] call FNC_AddItem; //White smoke
	["SmokeShellGreen", 1] call FNC_AddItem; //Green smoke
	["CUP_HandGrenade_M67", 1] call FNC_AddItem; //Frag grenade
	["ACE_EntrenchingTool", 1] call FNC_AddItem; //Entrenching tool

	["CUP_arifle_FNFAL5061_wooden"] call FNC_AddItem; //Primary rifle
	["CUP_20Rnd_762x51_FNFAL_M"] call FNC_AddItem; // starting magazine
	
	["CUP_MAAWS_HEAT_M", 1,"backpack"] call FNC_AddItem; //MAT Ammo
	
};

case (package + "MAT"): {
	

	["CUP_V_B_PASGT_winter"] call FNC_AddItemRandom;
	["cwr3_b_backpack_alice"] call FNC_AddItemRandom;
	
	ADD_GROUP(uniform);	
	ADD_GROUP(IFAK);
	ADD_GROUP(items);
	ADD_GROUP(goggles);
	
	["CUP_20Rnd_762x51_FNFAL_M", 8,"vest"] call FNC_AddItem; //Magazines
	
	["SmokeShell", 1] call FNC_AddItem; //White smoke
	["SmokeShellGreen", 1] call FNC_AddItem; //Green smoke
	["CUP_HandGrenade_M67", 1] call FNC_AddItem; //Frag grenade
	["ACE_EntrenchingTool", 1] call FNC_AddItem; //Entrenching tool

	["CUP_arifle_FNFAL5061_wooden"] call FNC_AddItem; //Primary rifle
	["CUP_20Rnd_762x51_FNFAL_M"] call FNC_AddItem; // starting magazine

	["CUP_launch_MAAWS"] call FNC_AddItem; //Launcher	
	["CUP_optic_MAAWS_Scope"] call FNC_AddItem; //Launcher optic
	["CUP_MAAWS_HEAT_M", 1,"backpack"] call FNC_AddItem; //MAT Ammo
	
};

case (package + "MATA"): {
	
	["CUP_V_B_PASGT_winter"] call FNC_AddItemRandom;
	["cwr3_b_backpack_alice"] call FNC_AddItemRandom;
	
	ADD_GROUP(uniform);	
	ADD_GROUP(IFAK);
	ADD_GROUP(items);
	ADD_GROUP(goggles);
	
	["CUP_20Rnd_762x51_FNFAL_M", 11,"vest"] call FNC_AddItem; //Magazines
	
	["SmokeShell", 1] call FNC_AddItem; //White smoke
	["CUP_HandGrenade_M67", 1] call FNC_AddItem; //Frag grenade
	["ACE_EntrenchingTool", 1] call FNC_AddItem; //Entrenching tool

	["CUP_arifle_FNFAL5061_wooden"] call FNC_AddItem; //Primary rifle
	["CUP_20Rnd_762x51_FNFAL_M"] call FNC_AddItem; // starting magazine
	
	["CUP_MAAWS_HEAT_M", 2,"backpack"] call FNC_AddItem; //MAT Ammo
	
};

case (package + "CREW"): {
	

	["CUP_V_B_PASGT_no_bags_winter"] call FNC_AddItemRandom;
	["cwr3_b_uk_backpack"] call FNC_AddItemRandom;
	
	ADD_GROUP(uniform);	
	ADD_GROUP(IFAK);
	ADD_GROUP(items);
	
	["cwr3_30rnd_sterling_m", 4,"vest"] call FNC_AddItem; //Magazines
	
	["SmokeShell", 2] call FNC_AddItem; //White smoke
	["SmokeShellGreen", 2] call FNC_AddItem; //Green smoke

	["cwr3_smg_sterling"] call FNC_AddItem; //Primary rifle
	["cwr3_30rnd_sterling_m"] call FNC_AddItem; // starting magazine

	
};