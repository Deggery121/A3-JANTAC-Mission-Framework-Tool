//AUTHOR: Deggery
//
//[this, "RUSD_PL"] call FNC_GearScript;
//[this, "RUSD_SL"] call FNC_GearScript;
//[this, "RUSD_TL"] call FNC_GearScript;
//[this, "RUSD_MD"] call FNC_GearScript;
//[this, "RUSD_RF"] call FNC_GearScript;
//[this, "RUSD_RFG"] call FNC_GearScript;
//[this, "RUSD_HEAVY"] call FNC_GearScript;
//[this, "RUSD_AHEAVY"] call FNC_GearScript;
//[this, "RUSD_AT"] call FNC_GearScript;

#define package "RUSD_"

SET_GROUP(uniform)
	//["CUP_I_B_PMC_Unit_38","CUP_I_B_PARA_Unit_2","CUP_I_B_PMC_Unit_41","CUP_I_B_PMC_Unit_42","CUP_I_B_PMC_Unit_37","CUP_I_B_PARA_Unit_1"] call FNC_AddItemRandom;
	["CUP_U_O_RUS_Ratnik_Desert"] call FNC_AddItem;
	["CUP_O_RUS_Patrol_bag_Desert"] call FNC_AddItem;
	["CUP_H_RUS_6B47_v2_GogglesDown_Desert","CUP_H_RUS_6B47_v2_Desert","CUP_H_RUS_6B47_v2_GogglesClosed_Desert","CUP_H_RUS_6B47_v2_Summer","CUP_H_RUS_6B47_v2_GogglesClosed_Summer"] call FNC_AddItemRandom;
	["CUP_Vest_RUS_6B45_Sh117_Desert","CUP_Vest_RUS_6B45_Sh117"] call FNC_AddItemRandom;
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
	["CUP_NVG_1PN138"] call FNC_AddItem;
	//["ACE_MapTools"] call FNC_AddItem;
	["murshun_cigs_cigpack", 1] call FNC_AddItem;
	["murshun_cigs_lighter", 1] call FNC_AddItem;
END_GROUP;

SET_GROUP(grenade)
	["CUP_HandGrenade_RGD5", 2] call FNC_AddItem;
	["SmokeShell", 1] call FNC_AddItem;
END_GROUP;
	
case (package + "PL"): {
	
	
	ADD_GROUP(uniform);
	ADD_GROUP(IFAK);
	ADD_GROUP(items);
	ADD_GROUP(grenade);
	ADD_GROUP(SLequip);
	
	
	["CUP_30Rnd_545x39_AK12_M", 8] call FNC_AddItem; //Magazines
	["16Rnd_9x21_Mag", 2] call FNC_AddItem; //Magazines
	
	["CUP_arifle_AK12_black_1P87"] call FNC_AddItem; //Primary rifle
	["hgun_Rook40_F"] call FNC_AddItem; //Primary rifle

	["CUP_optic_1P87_RIS"] call FNC_AddItem; //Red dot sight

};	

case (package + "SL"): {
	
	
	ADD_GROUP(uniform);
	ADD_GROUP(IFAK);
	ADD_GROUP(items);
	ADD_GROUP(grenade);
	ADD_GROUP(SLequip);
	
	
	["CUP_30Rnd_545x39_AK12_M", 8] call FNC_AddItem; //Magazines
	["16Rnd_9x21_Mag", 2] call FNC_AddItem; //Magazines
		
	["CUP_arifle_AK12_black_1P87"] call FNC_AddItem; //Primary rifle
	
	["hgun_Rook40_F"] call FNC_AddItem; //Primary rifle
	
	["CUP_optic_1P87_RIS"] call FNC_AddItem; //Red dot sight

	
};

case (package + "TL"): {
	
	
	ADD_GROUP(uniform);
	ADD_GROUP(IFAK);
	ADD_GROUP(items);
	ADD_GROUP(grenade);
	
	["CUP_30Rnd_545x39_AK12_M", 8] call FNC_AddItem; //Magazines
	["16Rnd_9x21_Mag", 2] call FNC_AddItem; //Magazines
	
	["CUP_arifle_AK12_black_1P87"] call FNC_AddItem; //Primary rifle
	["hgun_Rook40_F"] call FNC_AddItem; //Primary rifle
	
	["CUP_optic_1P87_RIS"] call FNC_AddItem; //Red dot sight


};


case (package + "RF"): {
	
	
	ADD_GROUP(uniform);
	ADD_GROUP(IFAK);
	ADD_GROUP(items);
	ADD_GROUP(grenade);
	
	["CUP_30Rnd_545x39_AK12_M", 8] call FNC_AddItem; //Magazines
	["16Rnd_9x21_Mag", 2] call FNC_AddItem; //Magazines
	
	["CUP_arifle_AK12_black_1P87"] call FNC_AddItem; //Primary rifle
	["hgun_Rook40_F"] call FNC_AddItem; //Primary rifle
	
	["CUP_optic_1P87_RIS"] call FNC_AddItem; //Red dot sight

	
};

case (package + "RFG"): {
	
	
	ADD_GROUP(uniform);
	ADD_GROUP(IFAK);
	ADD_GROUP(items);
	ADD_GROUP(grenade);
	
	["CUP_30Rnd_545x39_AK12_M", 8] call FNC_AddItem; //Magazines
	["16Rnd_9x21_Mag", 2] call FNC_AddItem; //Magazines
	["CUP_1Rnd_HE_GP25_M", 5] call FNC_AddItem; //Magazines
	["CUP_1Rnd_SMOKE_GP25_M", 5] call FNC_AddItem; //Magazines
	
	["CUP_arifle_AK12_GP34_black_OKP7"] call FNC_AddItem; //Primary rifle
	["hgun_Rook40_F"] call FNC_AddItem; //Primary rifle
	
	["CUP_optic_1P87_RIS"] call FNC_AddItem; //Red dot sight

	
};


case (package + "MD"): {
	
	_unit call FNC_defineMedic;
	["CUP_U_O_RUS_Ratnik_Desert"] call FNC_AddItem;
	["CUP_O_RUS_Patrol_bag_Desert","CUP_O_RUS_Patrol_bag_Desert_Shovel","CUP_O_RUS_Patrol_bag_BeigeDigital"] call FNC_AddItemRandom;
	["CUP_H_RUS_6B47_v2_GogglesDown_Desert","CUP_H_RUS_6B47_v2_Desert","CUP_H_RUS_6B47_v2_GogglesClosed_Desert","CUP_H_RUS_6B47_v2_Summer","CUP_H_RUS_6B47_v2_GogglesClosed_Summer"] call FNC_AddItemRandom;
	["CUP_Vest_RUS_6B45_Sh117_Desert","CUP_Vest_RUS_6B45_Sh117"] call FNC_AddItemRandom;

	ADD_GROUP(IFAK);
	ADD_GROUP(items);
	ADD_GROUP(grenade);
	
	["CUP_30Rnd_545x39_AK12_M", 8] call FNC_AddItem; //Magazines
	["16Rnd_9x21_Mag", 2] call FNC_AddItem; //Magazines
	
	["CUP_arifle_AK12_black_1P87"] call FNC_AddItem; //Primary rifle
	["hgun_Rook40_F"] call FNC_AddItem; //Primary rifle
	
	
	["CUP_optic_1P87_RIS"] call FNC_AddItem; //Red dot sight


	
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
	
	
	["CUP_U_O_RUS_Ratnik_Desert"] call FNC_AddItem;
	["CUP_O_RUS_Patrol_bag_Desert"] call FNC_AddItem;
	["CUP_H_RUS_6B47_v2_GogglesDown_Desert","CUP_H_RUS_6B47_v2_Desert","CUP_H_RUS_6B47_v2_GogglesClosed_Desert","CUP_H_RUS_6B47_v2_Summer","CUP_H_RUS_6B47_v2_GogglesClosed_Summer"] call FNC_AddItemRandom;
	["CUP_Vest_RUS_6B45_Sh117_PKP_Desert"] call FNC_AddItem;

	ADD_GROUP(IFAK);
	ADD_GROUP(items);
	ADD_GROUP(grenade);

	["CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Green_M", 4] call FNC_AddItem; //Magazines
	["16Rnd_9x21_Mag", 2] call FNC_AddItem; //Magazines
	
	["CUP_lmg_Pecheneg_PScope"] call FNC_AddItem; //Primary rifle
	["hgun_Rook40_F"] call FNC_AddItem; //Primary rifle	
	
	["CUP_optic_PechenegScope"] call FNC_AddItem; //Red dot sight

	
};

case (package + "AHEAVY"): {
	
	
	ADD_GROUP(uniform);
	ADD_GROUP(IFAK);
	ADD_GROUP(items);
	ADD_GROUP(grenade);

	["CUP_30Rnd_545x39_AK12_M", 10] call FNC_AddItem; //Magazines
	["CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Green_M", 2] call FNC_AddItem; //Magazines
	["16Rnd_9x21_Mag", 2] call FNC_AddItem; //Magazines

	["CUP_arifle_AK12_black_1P87"] call FNC_AddItem; //Primary rifle
	["hgun_Rook40_F"] call FNC_AddItem; //Primary rifle
	
	["CUP_optic_1P87_RIS"] call FNC_AddItem; //Red dot sight

};

case (package + "AT"): {
	
	
	ADD_GROUP(uniform);
	ADD_GROUP(IFAK);
	ADD_GROUP(items);
	ADD_GROUP(grenade);
	
	["CUP_30Rnd_545x39_AK12_M", 8] call FNC_AddItem; //Magazines
	["16Rnd_9x21_Mag", 2] call FNC_AddItem; //Magazines
	
	["CUP_arifle_AK12_black_1P87"] call FNC_AddItem; //Primary rifle
	["hgun_Rook40_F"] call FNC_AddItem; //Primary rifle
	
	["CUP_optic_1P87_RIS"] call FNC_AddItem; //Red dot sight

	
	["CUP_launch_RPG26_Loaded"] call FNC_AddItem; //Primary rifle
	
};

case (package + "MG"): {
	
	
	ADD_GROUP(uniform);
	ADD_GROUP(IFAK);
	ADD_GROUP(items);
	ADD_GROUP(grenade);
	
	["CUP_45Rnd_TE4_LRT4_Green_Tracer_545x39_RPK74M_M", 8] call FNC_AddItem; //Magazines
	["16Rnd_9x21_Mag", 2] call FNC_AddItem; //Magazines
	
	["CUP_arifle_RPK74M_1p78"] call FNC_AddItem; //Primary rifle
	["hgun_Rook40_F"] call FNC_AddItem; //Primary rifle
	
	["CUP_optic_PechenegScope"] call FNC_AddItem; //Red dot sight
	
};

case (package + "PIL"): {
	
	["cwr3_o_uniform_pilot_vmf"] call FNC_AddItem;
	["CUP_H_RUS_ZSH_Shield_Up"] call FNC_AddItem;
	["CUP_V_B_BAF_DDPM_Osprey_Mk3_Pilot"] call FNC_AddItem;
	
	ADD_GROUP(IFAK);
	ADD_GROUP(items);
	ADD_GROUP(grenade);
	ADD_GROUP(SLequip);
	

	["16Rnd_9x21_Mag", 2] call FNC_AddItem; //Magazines
	
	["hgun_Rook40_F"] call FNC_AddItem; //Primary rifle
	
};