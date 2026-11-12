//AUTHOR: Deggery
//
//[this, "USRNG_PL"] call FNC_GearScript;
//[this, "USRNG_SL"] call FNC_GearScript;
//[this, "USRNG_TL"] call FNC_GearScript;
//[this, "USRNG_MD"] call FNC_GearScript;
//[this, "USRNG_RF"] call FNC_GearScript;
//[this, "USRNG_RFG"] call FNC_GearScript;
//[this, "USRNG_HEAVY"] call FNC_GearScript;
//[this, "USRNG_AHEAVY"] call FNC_GearScript;
//[this, "USRNG_AT"] call FNC_GearScript;

#define package "USRNG_"

SET_GROUP(uniform)
	//["CUP_I_B_PMC_Unit_38","CUP_I_B_PARA_Unit_2","CUP_I_B_PMC_Unit_41","CUP_I_B_PMC_Unit_42","CUP_I_B_PMC_Unit_37","CUP_I_B_PARA_Unit_1"] call FNC_AddItemRandom;
	["CUP_U_B_USArmy_ACU_Kneepad_Gloves_OCP"] call FNC_AddItem;
	["B_Kitbag_rgr"] call FNC_AddItem;
	["CUP_H_OpsCore_Covered_MCAM_US"] call FNC_AddItem;
	["CUP_V_JPC_communicationsbelt_mc"] call FNC_AddItem;
END_GROUP;

SET_GROUP(SLequip)
	["ItemGPS"] call FNC_AddItem;
	["Binocular"] call FNC_AddItem;
	["ACRE_PRC148", 1] call FNC_AddItem; //Long range radio
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
	["ACE_CableTie", 1] call FNC_AddItem;
	["ItemMap"] call FNC_AddItem;
	["ItemCompass"] call FNC_AddItem;
	["ItemWatch"] call FNC_AddItem;
	["CUP_NVG_PVS15_black_WP"] call FNC_AddItem;
	//["ACE_MapTools"] call FNC_AddItem;
	["murshun_cigs_cigpack", 1] call FNC_AddItem;
	["murshun_cigs_lighter", 1] call FNC_AddItem;
END_GROUP;

SET_GROUP(grenade)
	["CUP_HandGrenade_M67", 2] call FNC_AddItem;
	["SmokeShell", 1] call FNC_AddItem;
END_GROUP;
	
case (package + "PL"): {
	
	
	ADD_GROUP(uniform);
	ADD_GROUP(IFAK);
	ADD_GROUP(items);
	ADD_GROUP(grenade);
	ADD_GROUP(SLequip);
	
	
	["CUP_30Rnd_556x45_Stanag", 8] call FNC_AddItem; //Magazines
	["CUP_21Rnd_9x19_M17_Coyote", 2] call FNC_AddItem; //Magazines
	
	["CUP_arifle_M4A1_SOMMOD_black"] call FNC_AddItem; //Primary rifle
	["CUP_hgun_M17_Coyote"] call FNC_AddItem; //Primary rifle

	["CUP_optic_CompM4"] call FNC_AddItem; //Red dot sight
	["CUP_acc_ANPEQ_15_Black"] call FNC_AddItem; //Red dot sight
};	

case (package + "SL"): {
	
	
	ADD_GROUP(uniform);
	ADD_GROUP(IFAK);
	ADD_GROUP(items);
	ADD_GROUP(grenade);
	ADD_GROUP(SLequip);
	
	
	["CUP_30Rnd_556x45_Stanag", 8] call FNC_AddItem; //Magazines
	
	["CUP_arifle_M4A1_SOMMOD_black"] call FNC_AddItem; //Primary rifle
	["CUP_hgun_M17_Coyote"] call FNC_AddItem; //Primary rifle
	
	["CUP_optic_CompM4"] call FNC_AddItem; //Red dot sight
	["CUP_acc_ANPEQ_15_Black"] call FNC_AddItem; //Red dot sight
	
};

case (package + "TL"): {
	
	
	ADD_GROUP(uniform);
	ADD_GROUP(IFAK);
	ADD_GROUP(items);
	ADD_GROUP(grenade);
	
	["CUP_30Rnd_556x45_Stanag", 8] call FNC_AddItem; //Magazines
	["CUP_21Rnd_9x19_M17_Coyote", 2] call FNC_AddItem; //Magazines
	
	["CUP_arifle_M4A1_SOMMOD_black"] call FNC_AddItem; //Primary rifle
	["CUP_hgun_M17_Coyote"] call FNC_AddItem; //Primary rifle
	
	["CUP_optic_CompM4"] call FNC_AddItem; //Red dot sight
	["CUP_acc_ANPEQ_15_Black"] call FNC_AddItem; //Red dot sight

};


case (package + "RF"): {
	
	
	ADD_GROUP(uniform);
	ADD_GROUP(IFAK);
	ADD_GROUP(items);
	ADD_GROUP(grenade);
	
	["CUP_30Rnd_556x45_Stanag", 8] call FNC_AddItem; //Magazines
	["CUP_21Rnd_9x19_M17_Coyote", 2] call FNC_AddItem; //Magazines
	
	["CUP_arifle_M4A1_SOMMOD_black"] call FNC_AddItem; //Primary rifle
	["CUP_hgun_M17_Coyote"] call FNC_AddItem; //Primary rifle
	
	["CUP_optic_CompM4"] call FNC_AddItem; //Red dot sight
	["CUP_acc_ANPEQ_15_Black"] call FNC_AddItem; //Red dot sight
	
};

case (package + "RFG"): {
	
	
	ADD_GROUP(uniform);
	ADD_GROUP(IFAK);
	ADD_GROUP(items);
	ADD_GROUP(grenade);
	
	["CUP_30Rnd_556x45_Stanag", 8] call FNC_AddItem; //Magazines
	["CUP_21Rnd_9x19_M17_Coyote", 2] call FNC_AddItem; //Magazines
	["1Rnd_HE_Grenade_shell", 5] call FNC_AddItem; //Magazines
	["1Rnd_Smoke_Grenade_shell", 5] call FNC_AddItem; //Magazines
	
	["CUP_arifle_M4A1_BUIS_GL"] call FNC_AddItem; //Primary rifle
	["CUP_hgun_M17_Coyote"] call FNC_AddItem; //Primary rifle
	
	["CUP_optic_CompM4"] call FNC_AddItem; //Red dot sight
	["CUP_acc_ANPEQ_15_Black"] call FNC_AddItem; //Red dot sight
	
};


case (package + "MD"): {
	
	_unit call FNC_defineMedic;
	["CUP_U_B_USArmy_ACU_Kneepad_Gloves_OCP"] call FNC_AddItem;
	["B_Kitbag_rgr"] call FNC_AddItem;
	["CUP_H_OpsCore_Covered_MCAM_US"] call FNC_AddItem;
	["CUP_V_JPC_communicationsbelt_mc"] call FNC_AddItem;

	ADD_GROUP(IFAK);
	ADD_GROUP(items);
	ADD_GROUP(grenade);
	
	["CUP_30Rnd_556x45_Stanag", 8] call FNC_AddItem; //Magazines
	["CUP_21Rnd_9x19_M17_Coyote", 2] call FNC_AddItem; //Magazines
	
	["CUP_arifle_M4A1_SOMMOD_black"] call FNC_AddItem; //Primary rifle
	["CUP_hgun_M17_Coyote"] call FNC_AddItem; //Primary rifle
	
	
	["CUP_optic_CompM4"] call FNC_AddItem; //Red dot sight
	["CUP_acc_ANPEQ_15_Black"] call FNC_AddItem; //Red dot sight

	
	//Extra Medic Supplies
	["ACE_fieldDressing", 15, "backpack"] call FNC_AddItem;
	["ACE_elasticBandage", 20, "backpack"] call FNC_AddItem;
	["ACE_packingBandage", 20, "backpack"] call FNC_AddItem;
	["ACE_morphine", 8, "backpack"] call FNC_AddItem;
	["ACE_epinephrine", 8, "backpack"] call FNC_AddItem;
	["ACE_tourniquet", 5, "backpack"] call FNC_AddItem;
	["ACE_splint", 12, "backpack"] call FNC_AddItem;
	["ACE_salineIV_500", 2, "backpack"] call FNC_AddItem;
	["ACE_bloodIV_500", 2, "backpack"] call FNC_AddItem;
	["ACE_bloodIV", 1, "backpack"] call FNC_AddItem;
	["ACE_personalAidKit", 3, "backpack"] call FNC_AddItem;
	
	
};

case (package + "HEAVY"): {
	
	
	ADD_GROUP(uniform);
	ADD_GROUP(IFAK);
	ADD_GROUP(items);
	ADD_GROUP(grenade);

	["CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M", 4] call FNC_AddItem; //Magazines

	
	["CUP_lmg_Mk48_nohg_des"] call FNC_AddItem; //Primary rifle
	
	
	["CUP_optic_CompM4"] call FNC_AddItem; //Red dot sight
	["CUP_acc_ANPEQ_15_Black"] call FNC_AddItem; //Red dot sight
	
};

case (package + "AHEAVY"): {
	
	
	ADD_GROUP(uniform);
	ADD_GROUP(IFAK);
	ADD_GROUP(items);
	ADD_GROUP(grenade);

	["CUP_30Rnd_556x45_Stanag", 10] call FNC_AddItem; //Magazines
	["CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M", 2] call FNC_AddItem; //Magazines


	["CUP_arifle_M4A1_SOMMOD_black"] call FNC_AddItem; //Primary rifle
	
	
	["CUP_optic_CompM4"] call FNC_AddItem; //Red dot sight
	["CUP_acc_ANPEQ_15_Black"] call FNC_AddItem; //Red dot sight
};

case (package + "AT"): {
	
	
	ADD_GROUP(uniform);
	ADD_GROUP(IFAK);
	ADD_GROUP(items);
	ADD_GROUP(grenade);
	
	["CUP_30Rnd_556x45_Stanag", 8] call FNC_AddItem; //Magazines
	["CUP_21Rnd_9x19_M17_Coyote", 2] call FNC_AddItem; //Magazines
	
	["CUP_arifle_M4A1_SOMMOD_black"] call FNC_AddItem; //Primary rifle
	["CUP_hgun_M17_Coyote"] call FNC_AddItem; //Primary rifle
	
	["CUP_optic_CompM4"] call FNC_AddItem; //Red dot sight
	["CUP_acc_ANPEQ_15_Black"] call FNC_AddItem; //Red dot sight
	
	["CUP_launch_M72A6"] call FNC_AddItem; //Primary rifle
	
};