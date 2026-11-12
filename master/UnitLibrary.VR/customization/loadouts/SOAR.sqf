//AUTHOR: Deggery
//
//[this, "SOAR_PL"] call FNC_GearScript;
//[this, "SOAR_SL"] call FNC_GearScript;
//[this, "SOAR_TL"] call FNC_GearScript;
//[this, "SOAR_MD"] call FNC_GearScript;
//[this, "SOAR_RF"] call FNC_GearScript;
//[this, "SOAR_RFG"] call FNC_GearScript;
//[this, "SOAR_HEAVY"] call FNC_GearScript;
//[this, "SOAR_AHEAVY"] call FNC_GearScript;
//[this, "SOAR_AT"] call FNC_GearScript;

#define package "SOAR_"

SET_GROUP(uniform)
	//["CUP_I_B_PMC_Unit_38","CUP_I_B_PARA_Unit_2","CUP_I_B_PMC_Unit_41","CUP_I_B_PMC_Unit_42","CUP_I_B_PMC_Unit_37","CUP_I_B_PARA_Unit_1"] call FNC_AddItemRandom;
	["CUP_U_B_BDUv2_gloves_DCU"] call FNC_AddItem;
	["CUP_B_USMC_MOLLE_WDL"] call FNC_AddItem;
	["CUP_H_USArmy_Helmet_ECH1_Black"] call FNC_AddItem;
	["CUP_V_CZ_NPP2006_vz95_black"] call FNC_AddItem;
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
	["ItemMap"] call FNC_AddItem;
	["ItemCompass"] call FNC_AddItem;
	["ItemWatch"] call FNC_AddItem;
	["CUP_NVG_PVS14"] call FNC_AddItem;
	//["ACE_MapTools"] call FNC_AddItem;
	["cigs_lucky_strike_cigpack", 1] call FNC_AddItem;
	["cigs_lighter", 1] call FNC_AddItem;
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
	
	
	["CUP_30Rnd_556x45_Stanag_Tracer_Red", 8] call FNC_AddItem; //Magazines
	
	["CUP_arifle_Colt727"] call FNC_AddItem; //Primary rifle

	["CUP_optic_CompM2_low"] call FNC_AddItem; //Red dot sight
	
};	

case (package + "SL"): {
	
	
	ADD_GROUP(uniform);
	ADD_GROUP(IFAK);
	ADD_GROUP(items);
	ADD_GROUP(grenade);
	ADD_GROUP(SLequip);
	
	
	["CUP_30Rnd_556x45_Stanag_Tracer_Red", 8] call FNC_AddItem; //Magazines
	["CUP_arifle_Colt727", 2] call FNC_AddItem; //Magazines
		
	["CUP_optic_CompM2_low"] call FNC_AddItem; //Red dot sight
	
	
};

case (package + "TL"): {
	
	
	ADD_GROUP(uniform);
	ADD_GROUP(IFAK);
	ADD_GROUP(items);
	ADD_GROUP(grenade);
	
	["CUP_30Rnd_556x45_Stanag_Tracer_Red", 8] call FNC_AddItem; //Magazines
	
	["CUP_arifle_Colt727"] call FNC_AddItem; //Primary rifle
	
	["CUP_optic_CompM2_low"] call FNC_AddItem; //Red dot sight
	

};


case (package + "RF"): {
	
	
	ADD_GROUP(uniform);
	ADD_GROUP(IFAK);
	ADD_GROUP(items);
	ADD_GROUP(grenade);
	
	["CUP_30Rnd_556x45_Stanag_Tracer_Red", 8] call FNC_AddItem; //Magazines
	
	["CUP_arifle_Colt727"] call FNC_AddItem; //Primary rifle
	
	["CUP_optic_CompM2_low"] call FNC_AddItem; //Red dot sight
	
	
};

case (package + "RFG"): {
	
	
	ADD_GROUP(uniform);
	ADD_GROUP(IFAK);
	ADD_GROUP(items);
	ADD_GROUP(grenade);
	
	["CUP_30Rnd_556x45_Stanag_Tracer_Red", 8] call FNC_AddItem; //Magazines
	["1Rnd_HE_Grenade_shell", 5] call FNC_AddItem; //Magazines
	["1Rnd_Smoke_Grenade_shell", 5] call FNC_AddItem; //Magazines
	
	["CUP_arifle_Colt727_M203"] call FNC_AddItem; //Primary rifle
	
	["CUP_optic_CompM2_low"] call FNC_AddItem; //Red dot sight
	
	
};


case (package + "MD"): {
	
	_unit call FNC_defineMedic;
	["CUP_U_B_BDUv2_gloves_DCU"] call FNC_AddItem;
	["CUP_B_USMC_MOLLE_WDL"] call FNC_AddItem;
	["CUP_H_USArmy_Helmet_ECH1_Black"] call FNC_AddItem;
	["CUP_V_CZ_NPP2006_vz95_black"] call FNC_AddItem;

	ADD_GROUP(IFAK);
	ADD_GROUP(items);
	ADD_GROUP(grenade);
	
	["CUP_30Rnd_556x45_Stanag_Tracer_Red", 8] call FNC_AddItem; //Magazines
	
	["CUP_arifle_Colt727"] call FNC_AddItem; //Primary rifle
	
	
	["CUP_optic_CompM2_low"] call FNC_AddItem; //Red dot sight
	

	
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

	["CUP_200Rnd_TE4_Red_Tracer_556x45_M249", 4] call FNC_AddItem; //Magazines

	
	["CUP_lmg_M249_E2"] call FNC_AddItem; //Primary rifle
	
	
	
	
};

case (package + "AHEAVY"): {
	
	
	ADD_GROUP(uniform);
	ADD_GROUP(IFAK);
	ADD_GROUP(items);
	ADD_GROUP(grenade);

	["CUP_30Rnd_556x45_Stanag_Tracer_Red", 10] call FNC_AddItem; //Magazines
	["CUP_200Rnd_TE4_Red_Tracer_556x45_M249", 2] call FNC_AddItem; //Magazines


	["CUP_arifle_Colt727"] call FNC_AddItem; //Primary rifle
	
	
	["CUP_optic_CompM2_low"] call FNC_AddItem; //Red dot sight
	
};

case (package + "AT"): {
	
	
	ADD_GROUP(uniform);
	ADD_GROUP(IFAK);
	ADD_GROUP(items);
	ADD_GROUP(grenade);
	
	["CUP_30Rnd_556x45_Stanag_Tracer_Red", 8] call FNC_AddItem; //Magazines
	
	["CUP_arifle_Colt727"] call FNC_AddItem; //Primary rifle
	
	["CUP_optic_CompM2_low"] call FNC_AddItem; //Red dot sight
	
	
	["CUP_launch_M72A6"] call FNC_AddItem; //Primary rifle
	
};

case (package + "PIL"): {
	
	["CUP_U_B_USArmy_PilotOverall"] call FNC_AddItem;
	["CUP_B_USMC_MOLLE_WDL"] call FNC_AddItem;
	["CUP_H_SPH4_khaki_visor"] call FNC_AddItem;
	["CUP_V_B_USArmy_PilotVest"] call FNC_AddItem;
	
	ADD_GROUP(IFAK);
	ADD_GROUP(items);
	ADD_GROUP(grenade);
	ADD_GROUP(SLequip);
	
	
	
	["CUP_30Rnd_556x45_Stanag_Tracer_Red", 3] call FNC_AddItem; //Magazines
	["CUP_arifle_Colt727"] call FNC_AddItem; //Magazines
	
	["CUP_7Rnd_45ACP_1911", 2] call FNC_AddItem; //Magazines
	["CUP_hgun_Colt1911"] call FNC_AddItem; //Magazines
	
	
};