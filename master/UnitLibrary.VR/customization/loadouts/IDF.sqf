//AUTHOR: Deggery
//
//[this, "IDF_PL"] call FNC_GearScript;
//[this, "IDF_SL"] call FNC_GearScript;
//[this, "IDF_TL"] call FNC_GearScript;
//[this, "IDF_MD"] call FNC_GearScript;
//[this, "IDF_RF"] call FNC_GearScript;
//[this, "IDF_RFG"] call FNC_GearScript;
//[this, "IDF_HEAVY"] call FNC_GearScript;
//[this, "IDF_AHEAVY"] call FNC_GearScript;
//[this, "IDF_AT"] call FNC_GearScript;

#define package "IDF_"

SET_GROUP(uniform)
	//["CUP_I_B_PMC_Unit_38","CUP_I_B_PARA_Unit_2","CUP_I_B_PMC_Unit_41","CUP_I_B_PMC_Unit_42","CUP_I_B_PMC_Unit_37","CUP_I_B_PARA_Unit_1"] call FNC_AddItemRandom;
	["CFP_IDF_1","CFP_IDF_2","CFP_IDF_3"] call FNC_AddItemRandom;
	["CUP_B_IDF_Backpack"] call FNC_AddItem;
	["CFP_MitzHelm4_Wdl","CFP_MitzHelm1_Des2","CFP_MitzHelm3_Wdl2","CFP_MitzHelm2_Des2","CFP_IDF_M76_BD_CB_GG"] call FNC_AddItemRandom;
	["CUP_V_IDF_Vest","CUP_V_B_LBT_LBV_GRN"] call FNC_AddItemRandom;
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
	["cigs_eckstein_cigpack", 1] call FNC_AddItem;
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
	
	
	["CUP_30Rnd_556x45_Stanag", 8] call FNC_AddItem; //Magazines
	
	["CUP_arifle_M4A1"] call FNC_AddItem; //Primary rifle
	
	["CUP_optic_MEPRO_moa_clear"] call FNC_AddItem; //Red dot sight

};	

case (package + "SL"): {
	
	
	ADD_GROUP(uniform);
	ADD_GROUP(IFAK);
	ADD_GROUP(items);
	ADD_GROUP(grenade);
	ADD_GROUP(SLequip);
	
	
	["CUP_30Rnd_556x45_Stanag", 8] call FNC_AddItem; //Magazines
		
	["CUP_arifle_M4A1"] call FNC_AddItem; //Magazines
	
		
	["CUP_optic_MEPRO_moa_clear"] call FNC_AddItem; //Red dot sight

	
};

case (package + "TL"): {
	
	
	ADD_GROUP(uniform);
	ADD_GROUP(IFAK);
	ADD_GROUP(items);
	ADD_GROUP(grenade);
	
	["CUP_30Rnd_556x45_Stanag", 8] call FNC_AddItem; //Magazines
	
	["CUP_arifle_M4A1"] call FNC_AddItem; //Primary rifle
		
	["CUP_optic_MEPRO_moa_clear"] call FNC_AddItem; //Red dot sight


};


case (package + "RF"): {
	
	
	ADD_GROUP(uniform);
	ADD_GROUP(IFAK);
	ADD_GROUP(items);
	ADD_GROUP(grenade);
	
	["CUP_30Rnd_556x45_Stanag", 8] call FNC_AddItem; //Magazines
	
	["CUP_arifle_M4A1"] call FNC_AddItem; //Primary rifle
		
	["CUP_optic_MEPRO_moa_clear"] call FNC_AddItem; //Red dot sight

	
};

case (package + "RFG"): {
	
	
	ADD_GROUP(uniform);
	ADD_GROUP(IFAK);
	ADD_GROUP(items);
	ADD_GROUP(grenade);
	
	["CUP_30Rnd_556x45_Stanag", 8] call FNC_AddItem; //Magazines
	["1Rnd_HE_Grenade_shell", 5] call FNC_AddItem; //Magazines
	["1Rnd_Smoke_Grenade_shell", 5] call FNC_AddItem; //Magazines
	
	["CUP_arifle_M4A1_BUIS_GL"] call FNC_AddItem; //Primary rifle
		
	["CUP_optic_MEPRO_moa_clear"] call FNC_AddItem; //Red dot sight

	
};


case (package + "MD"): {
	
	_unit call FNC_defineMedic;
	["CFP_IDF_1","CFP_IDF_2","CFP_IDF_3"] call FNC_AddItemRandom;
	["CUP_B_IDF_Backpack"] call FNC_AddItem;
	["CFP_MitzHelm4_Wdl","CFP_MitzHelm1_Des2","CFP_MitzHelm3_Wdl2","CFP_MitzHelm2_Des2","CFP_IDF_M76_BD_CB_GG"] call FNC_AddItemRandom;
	["CUP_V_IDF_Vest","CUP_V_B_LBT_LBV_GRN"] call FNC_AddItemRandom;

	ADD_GROUP(IFAK);
	ADD_GROUP(items);
	ADD_GROUP(grenade);
	
	["CUP_30Rnd_556x45_Stanag", 8] call FNC_AddItem; //Magazines
	
	["CUP_arifle_M4A1"] call FNC_AddItem; //Primary rifle
		
	
	["CUP_optic_MEPRO_moa_clear"] call FNC_AddItem; //Red dot sight


	
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
	
	
	["CFP_IDF_1","CFP_IDF_2","CFP_IDF_3"] call FNC_AddItemRandom;
	["CUP_B_IDF_Backpack"] call FNC_AddItem;
	["CFP_MitzHelm4_Wdl","CFP_MitzHelm1_Des2","CFP_MitzHelm3_Wdl2","CFP_MitzHelm2_Des2","CFP_IDF_M76_BD_CB_GG"] call FNC_AddItemRandom;
	["CUP_V_IDF_Vest","CUP_V_B_LBT_LBV_GRN"] call FNC_AddItemRandom;

	ADD_GROUP(IFAK);
	ADD_GROUP(items);
	ADD_GROUP(grenade);

	["150Rnd_762x54_Box", 4] call FNC_AddItem; //Magazines
	
	["LMG_Zafir_F"] call FNC_AddItem; //Primary rifle
	
	["CUP_optic_PechenegScope"] call FNC_AddItem; //Red dot sight

	
};

case (package + "AHEAVY"): {
	
	
	ADD_GROUP(uniform);
	ADD_GROUP(IFAK);
	ADD_GROUP(items);
	ADD_GROUP(grenade);

	["CUP_30Rnd_556x45_Stanag", 8] call FNC_AddItem; //Magazines
	["150Rnd_762x54_Box", 2] call FNC_AddItem; //Magazines

	["CUP_arifle_M4A1"] call FNC_AddItem; //Primary rifle
		
	["CUP_optic_MEPRO_moa_clear"] call FNC_AddItem; //Red dot sight

};

case (package + "AT"): {
	
	
	ADD_GROUP(uniform);
	ADD_GROUP(IFAK);
	ADD_GROUP(items);
	ADD_GROUP(grenade);
	
	["CUP_30Rnd_556x45_Stanag", 8] call FNC_AddItem; //Magazines
	
	["CUP_arifle_M4A1"] call FNC_AddItem; //Primary rifle
		
	["CUP_optic_MEPRO_moa_clear"] call FNC_AddItem; //Red dot sight

	
	["CUP_launch_M72A6"] call FNC_AddItem; //Primary rifle
	
};

case (package + "MG"): {
	
	
	ADD_GROUP(uniform);
	ADD_GROUP(IFAK);
	ADD_GROUP(items);
	ADD_GROUP(grenade);
	
	["CUP_20Rnd_762x51_B_M110", 12] call FNC_AddItem; //Magazines
	
	["CUP_srifle_m110_kac_black"] call FNC_AddItem; //Primary rifle
		
	["CUP_optic_ACOG2"] call FNC_AddItem; //Red dot sight
	
};

case (package + "PIL"): {
	
	["CFP_IDF_1","CFP_IDF_2","CFP_IDF_3"] call FNC_AddItemRandom;
	["CUP_B_IDF_Backpack"] call FNC_AddItem;
	["CFP_MitzHelm4_Wdl","CFP_MitzHelm1_Des2","CFP_MitzHelm3_Wdl2","CFP_MitzHelm2_Des2","CFP_IDF_M76_BD_CB_GG"] call FNC_AddItemRandom;
	["CUP_V_IDF_Vest","CUP_V_B_LBT_LBV_GRN"] call FNC_AddItemRandom;
	
	ADD_GROUP(IFAK);
	ADD_GROUP(items);
	ADD_GROUP(grenade);
	ADD_GROUP(SLequip);
	

	
		
};