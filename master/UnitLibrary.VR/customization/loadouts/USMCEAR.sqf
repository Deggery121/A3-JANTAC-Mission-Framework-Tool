//AUTHOR: Deggery
//
//[this, "USMCEAR_PL"] call FNC_GearScript;
//[this, "USMCEAR_SL"] call FNC_GearScript;
//[this, "USMCEAR_TL"] call FNC_GearScript;
//[this, "USMCEAR_MD"] call FNC_GearScript;
//[this, "USMCEAR_RF"] call FNC_GearScript;
//[this, "USMCEAR_RFG"] call FNC_GearScript;
//[this, "USMCEAR_HEAVY"] call FNC_GearScript;
//[this, "USMCEAR_AHEAVY"] call FNC_GearScript;
//[this, "USMCEAR_AT"] call FNC_GearScript;

#define package "USMCEAR_"

SET_GROUP(uniform)
	//["CUP_I_B_PMC_Unit_38","CUP_I_B_PARA_Unit_2","CUP_I_B_PMC_Unit_41","CUP_I_B_PMC_Unit_42","CUP_I_B_PMC_Unit_37","CUP_I_B_PARA_Unit_1"] call FNC_AddItemRandom;
	["CUP_U_B_USMC_MCCUU_des"] call FNC_AddItem;
	["CUP_B_USMC_MOLLE_WDL"] call FNC_AddItem;
	["CUP_H_LWHv2_MARPAT_des","CUP_H_LWHv2_MARPAT_des_cov_fr"] call FNC_AddItemRandom;
	["CUP_V_B_Interceptor_Rifleman_M81"] call FNC_AddItem;
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
	["ACE_splint", 1, "backpack"] call FNC_AddItem;
	["ACE_morphine", 1, "uniform"] call FNC_AddItem;
	["ACE_epinephrine", 1, "uniform"] call FNC_AddItem;
	["ACE_tourniquet", 1, "uniform"] call FNC_AddItem;
END_GROUP;
	
SET_GROUP(items)
	["ACRE_PRC343", 1] call FNC_AddItem;
	["ItemMap"] call FNC_AddItem;
	["ItemCompass"] call FNC_AddItem;
	["ItemWatch"] call FNC_AddItem;
	["CUP_NVG_PVS14"] call FNC_AddItem;
	//["ACE_MapTools"] call FNC_AddItem;
	["murshun_cigs_cigpack", 1] call FNC_AddItem;
	["murshun_cigs_lighter", 1] call FNC_AddItem;
END_GROUP;

SET_GROUP(items2)
	["ItemMap"] call FNC_AddItem;
	["ItemCompass"] call FNC_AddItem;
	["ItemWatch"] call FNC_AddItem;
	["murshun_cigs_cigpack", 1] call FNC_AddItem;
	["murshun_cigs_lighter", 1] call FNC_AddItem;
END_GROUP;

SET_GROUP(grenade)
	["CUP_HandGrenade_M67", 2] call FNC_AddItem;
	["SmokeShell", 1] call FNC_AddItem;
END_GROUP;
	
case (package + "PL"): {
	
	["CUP_U_B_USMC_MCCUU_des"] call FNC_AddItem;
	["CUP_B_USMC_MOLLE_WDL"] call FNC_AddItem;
	["CUP_H_LWHv2_MARPAT_des","CUP_H_LWHv2_MARPAT_des_cov_fr"] call FNC_AddItemRandom;
	["CUP_V_B_Interceptor_Rifleman_M81"] call FNC_AddItem;
	
	ADD_GROUP(IFAK);
	ADD_GROUP(items);
	ADD_GROUP(grenade);
	ADD_GROUP(SLequip);
	
	
	["CUP_30Rnd_556x45_Stanag", 8] call FNC_AddItem; //Magazines

	
	["CUP_arifle_M16A4_Base"] call FNC_AddItem; //Primary rifle


	["CUP_optic_ACOG2"] call FNC_AddItem; //Red dot sight
};	

case (package + "SL"): {
	
	["CUP_U_B_USMC_MCCUU_des"] call FNC_AddItem;
	["CUP_B_USMC_MOLLE_WDL"] call FNC_AddItem;
	["CUP_H_LWHv2_MARPAT_des","CUP_H_LWHv2_MARPAT_des_cov_fr"] call FNC_AddItemRandom;
	["CUP_V_B_Interceptor_Rifleman_M81"] call FNC_AddItem;

	ADD_GROUP(IFAK);
	ADD_GROUP(items);
	ADD_GROUP(grenade);
	ADD_GROUP(SLequip);
	
	
	["CUP_30Rnd_556x45_Stanag", 8] call FNC_AddItem; //Magazines
	
	["CUP_arifle_M16A4_Base"] call FNC_AddItem; //Primary rifle

	
	["CUP_optic_ACOG2"] call FNC_AddItem; //Red dot sight
	
};

case (package + "TL"): {
	
	["CUP_U_B_USMC_MCCUU_des"] call FNC_AddItem;
	["CUP_B_USMC_MOLLE_WDL"] call FNC_AddItem;
	["CUP_H_LWHv2_MARPAT_des","CUP_H_LWHv2_MARPAT_des_cov_fr"] call FNC_AddItemRandom;
	["CUP_V_B_Interceptor_Rifleman_M81"] call FNC_AddItem;
	
	ADD_GROUP(IFAK);
	ADD_GROUP(items);
	ADD_GROUP(grenade);
	
	["CUP_30Rnd_556x45_Stanag", 8] call FNC_AddItem; //Magazines

	
	["CUP_arifle_M16A4_Base"] call FNC_AddItem; //Primary rifle

	
	["CUP_optic_ACOG2"] call FNC_AddItem; //Red dot sight

};


case (package + "RF"): {
	
	
	ADD_GROUP(uniform);
	ADD_GROUP(IFAK);
	ADD_GROUP(items);
	ADD_GROUP(grenade);
	
	["CUP_30Rnd_556x45_Stanag", 8] call FNC_AddItem; //Magazines

	
	["CUP_arifle_M16A4_Base"] call FNC_AddItem; //Primary rifle

	
	["CUP_optic_ACOG2"] call FNC_AddItem; //Red dot sight
	
};

case (package + "RFG"): {
	
	
	["CUP_U_B_USMC_MCCUU_des"] call FNC_AddItem;
	["CUP_B_USMC_MOLLE_WDL"] call FNC_AddItem;
	["CUP_H_LWHv2_MARPAT_des","CUP_H_LWHv2_MARPAT_des_cov_fr"] call FNC_AddItemRandom;
	["CUP_V_B_Interceptor_Rifleman_M81"] call FNC_AddItem;
	
	ADD_GROUP(IFAK);
	ADD_GROUP(items);
	ADD_GROUP(grenade);
	
	["CUP_30Rnd_556x45_Stanag", 8] call FNC_AddItem; //Magazines

	["1Rnd_HE_Grenade_shell", 5] call FNC_AddItem; //Magazines
	["1Rnd_Smoke_Grenade_shell", 5] call FNC_AddItem; //Magazines
	
	["CUP_arifle_M16A4_GL"] call FNC_AddItem; //Primary rifle

	
	["CUP_optic_ACOG2"] call FNC_AddItem; //Red dot sight
	
};


case (package + "MD"): {
	
	_unit call FNC_defineMedic;
	["CUP_U_B_USMC_MCCUU_des"] call FNC_AddItem;
	["CUP_B_USMC_MOLLE_WDL"] call FNC_AddItem;
	["CUP_H_LWHv2_MARPAT_des","CUP_H_LWHv2_MARPAT_des_cov_fr"] call FNC_AddItemRandom;
	["CUP_V_B_Interceptor_Rifleman_M81"] call FNC_AddItem;

	ADD_GROUP(IFAK);
	ADD_GROUP(items);
	ADD_GROUP(grenade);
	
	["CUP_30Rnd_556x45_Stanag", 8] call FNC_AddItem; //Magazines

	
	["CUP_arifle_M16A4_Base"] call FNC_AddItem; //Primary rifle

	
	
	["CUP_optic_ACOG2"] call FNC_AddItem; //Red dot sight

	
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
	
	["CUP_U_B_USMC_MCCUU_des"] call FNC_AddItem;
	["CUP_B_USMC_MOLLE_WDL"] call FNC_AddItem;
	["CUP_H_LWHv2_MARPAT_des","CUP_H_LWHv2_MARPAT_des_cov_fr"] call FNC_AddItemRandom;
	["CUP_V_B_Interceptor_Rifleman_M81"] call FNC_AddItem;
	
	ADD_GROUP(IFAK);
	ADD_GROUP(items);
	ADD_GROUP(grenade);

	["CUP_200Rnd_TE1_Red_Tracer_556x45_M249", 4] call FNC_AddItem; //Magazines

	
	["CUP_lmg_m249_pip1"] call FNC_AddItem; //Primary rifle
	
	

	
};

case (package + "AHEAVY"): {
	
	
	ADD_GROUP(uniform);
	ADD_GROUP(IFAK);
	ADD_GROUP(items);
	ADD_GROUP(grenade);

	["CUP_30Rnd_556x45_Stanag", 10] call FNC_AddItem; //Magazines
	["CUP_200Rnd_TE1_Red_Tracer_556x45_M249", 2] call FNC_AddItem; //Magazines


	["CUP_arifle_M16A4_Base"] call FNC_AddItem; //Primary rifle
	
	
	["CUP_optic_ACOG2"] call FNC_AddItem; //Red dot sight
	
};

case (package + "AT"): {
	
	
	ADD_GROUP(uniform);
	ADD_GROUP(IFAK);
	ADD_GROUP(items);
	ADD_GROUP(grenade);
	
	["CUP_30Rnd_556x45_Stanag", 8] call FNC_AddItem; //Magazines

	
	["CUP_arifle_M16A4_Base"] call FNC_AddItem; //Primary rifle

	
	["CUP_optic_ACOG2"] call FNC_AddItem; //Red dot sight
	
	["CUP_launch_M72A6"] call FNC_AddItem; //Primary rifle
	
};

case (package + "PIL"): {
	
	["CUP_U_B_USArmy_PilotOverall"] call FNC_AddItem;
	["CUP_H_SPH4_visor"] call FNC_AddItem;
	["CUP_V_B_PilotVest"] call FNC_AddItem;
	
	ADD_GROUP(IFAK);
	ADD_GROUP(items2);
	ADD_GROUP(grenade);
	
	["hlc_30rnd_556x45_b_HK33", 5] call FNC_AddItem; //Magazines

	
	["hlc_rifle_hk33a2"] call FNC_AddItem; //Primary rifle

};

case (package + "PILO"): {
	
	["CUP_U_B_USArmy_PilotOverall"] call FNC_AddItem;
	["CUP_H_SPH4_visor"] call FNC_AddItem;
	["CUP_V_B_PilotVest"] call FNC_AddItem;
	
	ADD_GROUP(IFAK);
	ADD_GROUP(items);
	ADD_GROUP(grenade);
	ADD_GROUP(SLequip);
	
	["CUP_17Rnd_9x19_glock17", 5] call FNC_AddItem; //Magazines

	
	["CUP_hgun_Glock17"] call FNC_AddItem; //Primary rifle

};