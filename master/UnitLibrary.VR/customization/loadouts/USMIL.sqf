//AUTHOR: Deggery
//
//[this, "USMIL_PL"] call FNC_GearScript;
//[this, "USMIL_SL"] call FNC_GearScript;
//[this, "USMIL_TL"] call FNC_GearScript;
//[this, "USMIL_MD"] call FNC_GearScript;
//[this, "USMIL_RF"] call FNC_GearScript;
//[this, "USMIL_RFG"] call FNC_GearScript;
//[this, "USMIL_HEAVY"] call FNC_GearScript;
//[this, "USMIL_AHEAVY"] call FNC_GearScript;
//[this, "USMIL_AT"] call FNC_GearScript;
//[this, "USMIL_CR"] call FNC_GearScript;

#define package "USMIL_"

SET_GROUP(uniform)
	//["CUP_I_B_PMC_Unit_38","CUP_I_B_PARA_Unit_2","CUP_I_B_PMC_Unit_41","CUP_I_B_PMC_Unit_42","CUP_I_B_PMC_Unit_37","CUP_I_B_PARA_Unit_1"] call FNC_AddItemRandom;
	["CUP_U_B_BDUv2_M81_US"] call FNC_AddItem;
	["CUP_B_USMC_MOLLE_WDL"] call FNC_AddItem;
	["CUP_H_PASGTv2_WDL"] call FNC_AddItem;
	["CUP_V_B_PASGT"] call FNC_AddItem;
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
	
	
	["CUP_30Rnd_556x45_Stanag_Tracer_Red", 8] call FNC_AddItem; //Magazines
	["CUP_arifle_M16A2"] call FNC_AddItem; //Primary rifle

};	

case (package + "SL"): {
	
	
	ADD_GROUP(uniform);
	ADD_GROUP(IFAK);
	ADD_GROUP(items);
	ADD_GROUP(grenade);
	ADD_GROUP(SLequip);
	
	
	["CUP_30Rnd_556x45_Stanag_Tracer_Red", 8] call FNC_AddItem; //Magazines
	["CUP_arifle_M16A2", 2] call FNC_AddItem; //Magazines
	
	
	
};

case (package + "TL"): {
	
	
	ADD_GROUP(uniform);
	ADD_GROUP(IFAK);
	ADD_GROUP(items);
	ADD_GROUP(grenade);
	
	["CUP_30Rnd_556x45_Stanag_Tracer_Red", 8] call FNC_AddItem; //Magazines
	["CUP_arifle_M16A2"] call FNC_AddItem; //Primary rifle
	

};


case (package + "RF"): {
	
	
	ADD_GROUP(uniform);
	ADD_GROUP(IFAK);
	ADD_GROUP(items);
	ADD_GROUP(grenade);
	
	["CUP_30Rnd_556x45_Stanag_Tracer_Red", 8] call FNC_AddItem; //Magazines
	["CUP_arifle_M16A2"] call FNC_AddItem; //Primary rifle
	
	
};

case (package + "RFG"): {
	
	
	ADD_GROUP(uniform);
	ADD_GROUP(IFAK);
	ADD_GROUP(items);
	ADD_GROUP(grenade);
	
	["CUP_30Rnd_556x45_Stanag_Tracer_Red", 8] call FNC_AddItem; //Magazines
	["1Rnd_HE_Grenade_shell", 5] call FNC_AddItem; //Magazines
	["1Rnd_Smoke_Grenade_shell", 5] call FNC_AddItem; //Magazines
	
	["CUP_arifle_M16A2_GL"] call FNC_AddItem; //Primary rifle	
	
};


case (package + "MD"): {
	
	_unit call FNC_defineMedic;
	["CUP_U_B_BDUv2_M81_US"] call FNC_AddItem;
	["CUP_B_USMC_MOLLE_WDL"] call FNC_AddItem;
	["CUP_H_PASGTv2_WDL"] call FNC_AddItem;
	["CUP_V_B_PASGT"] call FNC_AddItem;
	
	ADD_GROUP(IFAK);
	ADD_GROUP(items);
	ADD_GROUP(grenade);
	
	["CUP_30Rnd_556x45_Stanag_Tracer_Red", 8] call FNC_AddItem; //Magazines
	["CUP_arifle_M16A2"] call FNC_AddItem; //Primary rifle
	
	

	
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
	["CUP_200Rnd_TE4_Red_Tracer_556x45_M249", 2] call FNC_AddItem; //Ast. Magazines

	["CUP_arifle_M16A2"] call FNC_AddItem; //Primary rifle

	
	
};

case (package + "AT"): {
	
	
	ADD_GROUP(uniform);
	ADD_GROUP(IFAK);
	ADD_GROUP(items);
	ADD_GROUP(grenade);
	
	["CUP_30Rnd_556x45_Stanag_Tracer_Red", 8] call FNC_AddItem; //Magazines
	
	
	["CUP_arifle_M16A2"] call FNC_AddItem; //Primary rifle
	["CUP_launch_M72A6"] call FNC_AddItem; //Luancher
	
};

case (package + "CR"): {
	
	["CUP_U_B_BDUv2_M81_US"] call FNC_AddItem;
	["CUP_B_USMC_MOLLE_WDL"] call FNC_AddItem;
	["H_HelmetCrew_I_E"] call FNC_AddItem;
	["CUP_V_B_PASGT"] call FNC_AddItem;
	
	ADD_GROUP(IFAK);
	ADD_GROUP(items);
	ADD_GROUP(grenade);
	ADD_GROUP(SLequip);
	
	
	
	["CUP_30Rnd_556x45_Stanag_Tracer_Red", 8] call FNC_AddItem; //Magazines
	["CUP_arifle_M4A1"] call FNC_AddItem; //Magazines
	
	
	
};