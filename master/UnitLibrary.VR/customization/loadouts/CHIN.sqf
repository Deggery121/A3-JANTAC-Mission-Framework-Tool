//AUTHOR: Richard
//
//[this, "CHIN_PL"] call FNC_GearScript; OFFICER
//[this, "CHIN_SL"] call FNC_GearScript; SQUAD LEADER
//[this, "CHIN_RTO"] call FNC_GearScript; SQUAD LEADER/RTO
//[this, "CHIN_MD"] call FNC_GearScript; MEDIC
//[this, "CHIN_TLA"] call FNC_GearScript; TEAM LEADER GRENADIER
//[this, "CHIN_TLB"] call FNC_GearScript; TEAM LEADER DEMO
//[this, "CHIN_AR"] call FNC_GearScript; AUTO RIFLEMAN
//[this, "CHIN_ARA"] call FNC_GearScript; ASST AUTO RIFLEMAN
//[this, "CHIN_LAT"] call FNC_GearScript; LIGHT AT
//[this, "CHIN_RIF"] call FNC_GearScript; RIFLEMAN
//[this, "CHIN_CREW"] call FNC_GearScript; Crewman
//[this, "CHIN_PILOT"] call FNC_GearScript; PILOT

#define package "CHIN_"

SET_GROUP(uniform)
	["JAN_PLA_Ocean"] call FNC_AddItemRandom;
	["JAN_PLA_QGF3_O"] call FNC_AddItemRandom;
END_GROUP;
	
SET_GROUP(vest)
	["CUP_V_PMC_CIRAS_Black_Patrol"] call FNC_AddItemRandom;
END_GROUP;
	
SET_GROUP(IFAK)
	["ACE_elasticBandage", 6, "uniform"] call FNC_AddItem;
	["ACE_packingBandage", 6, "uniform"] call FNC_AddItem;
	["ACE_morphine", 1, "uniform"] call FNC_AddItem;
	["ACE_epinephrine", 1, "uniform"] call FNC_AddItem;
	["ACE_tourniquet", 1, "uniform"] call FNC_AddItem;
END_GROUP;
	
SET_GROUP(items)
	["ACRE_BF888S", 1] call FNC_AddItem;
	["ItemMap"] call FNC_AddItem;
	["ItemCompass"] call FNC_AddItem;
	["ItemWatch"] call FNC_AddItem;
	["cigs_nil_cigpack"] call FNC_AddItem;
	["cigs_lighter"] call FNC_AddItem;
END_GROUP;
	
	
case (package + "PL"): {
	
	ADD_GROUP(uniform);	
	["CUP_V_PMC_CIRAS_Black_Grenadier"] call FNC_AddItemRandom;
	["Backpack_tactical"] call FNC_AddItemRandom;
	
	ADD_GROUP(IFAK);
	ADD_GROUP(items);	
	
	["Binocular"] call FNC_AddItem;
	
	["ACRE_PRC148", 1] call FNC_AddItem; //Long range radio
	
	["30Rnd_580x42_Mag_F", 11,"vest"] call FNC_AddItem; //Magazines
	["30Rnd_580x42_Mag_Tracer_F", 3,"vest"] call FNC_AddItem;
	
	["1Rnd_HE_Grenade_shell", 9,"vest"] call FNC_AddItem;
	["CUP_1Rnd_Smoke_M203", 3,"vest"] call FNC_AddItem;
	["CUP_1Rnd_SmokeGreen_M203", 2,"vest"] call FNC_AddItem;
	["CUP_1Rnd_SmokeRed_M203", 2,"vest"] call FNC_AddItem;
	
	["SmokeShell", 1] call FNC_AddItem; //White smoke
	["SmokeShellGreen", 1] call FNC_AddItem; //Green smoke
	["CUP_HandGrenade_RGD5", 1] call FNC_AddItem; //Frag grenade
	
	["JAN_Weapons_ARifle_QBZ95_RIS_GL_blk"] call FNC_AddItem; //Primary rifle
	["optic_MRCO"] call FNC_AddItem;
	["30Rnd_580x42_Mag_F"] call FNC_AddItem; // starting magazine
	

};

case (package + "RTO"): {
	
	ADD_GROUP(uniform);	
	["CUP_V_PMC_CIRAS_Black_Patrol"] call FNC_AddItemRandom;
	["B_RadioBag_01_black_F"] call FNC_AddItemRandom;
	
	ADD_GROUP(IFAK);
	ADD_GROUP(items);	
	
	["Binocular"] call FNC_AddItem;
	
	["ACRE_PRC148", 1] call FNC_AddItem; //Long range radio
	
	["30Rnd_580x42_Mag_F", 11,"vest"] call FNC_AddItem; //Magazines
	["30Rnd_580x42_Mag_Tracer_F", 3,"vest"] call FNC_AddItem;
	
	
	["SmokeShell", 2] call FNC_AddItem; //White smoke
	["SmokeShellGreen", 1] call FNC_AddItem; //Green smoke
	["CUP_HandGrenade_RGD5", 2] call FNC_AddItem; //Frag grenade
	
	["JAN_Weapons_ARifle_QBZ95_RIS_blk"] call FNC_AddItem; //Primary rifle
	["optic_MRCO"] call FNC_AddItem;
	["30Rnd_580x42_Mag_F"] call FNC_AddItem; // starting magazine
	
};

case (package + "RTO2"): {
	
	ADD_GROUP(uniform);	
	["CUP_V_PMC_CIRAS_Black_Patrol"] call FNC_AddItemRandom;
	["cwr3_b_backpack_radio"] call FNC_AddItemRandom;
	
	ADD_GROUP(IFAK);
	ADD_GROUP(items);	
	
	["Binocular"] call FNC_AddItem;
	
	["ACRE_PRC148", 1] call FNC_AddItem; //Long range radio
	
	["30Rnd_580x42_Mag_F", 11,"vest"] call FNC_AddItem; //Magazines
	["30Rnd_580x42_Mag_Tracer_F", 3,"vest"] call FNC_AddItem;
	
	
	["SmokeShell", 2] call FNC_AddItem; //White smoke
	["SmokeShellGreen", 1] call FNC_AddItem; //Green smoke
	["CUP_HandGrenade_RGD5", 2] call FNC_AddItem; //Frag grenade
	
	["JAN_Weapons_ARifle_QBZ95_RIS_blk"] call FNC_AddItem; //Primary rifle
	["optic_MRCO"] call FNC_AddItem;
	["30Rnd_580x42_Mag_F"] call FNC_AddItem; // starting magazine
	
};

case (package + "SL"): {
	
	ADD_GROUP(uniform);	
	["CUP_V_PMC_CIRAS_Black_Grenadier"] call FNC_AddItemRandom;
	["Backpack_tactical"] call FNC_AddItemRandom;
	
	ADD_GROUP(IFAK);
	ADD_GROUP(items);	
	
	["Binocular"] call FNC_AddItem;
	
	["ACRE_PRC148", 1] call FNC_AddItem; //Long range radio
	
	["30Rnd_580x42_Mag_F", 11,"vest"] call FNC_AddItem; //Magazines
	["30Rnd_580x42_Mag_Tracer_F", 3,"vest"] call FNC_AddItem;
	
	["1Rnd_HE_Grenade_shell", 9,"vest"] call FNC_AddItem;
	["CUP_1Rnd_Smoke_M203", 3,"vest"] call FNC_AddItem;
	["CUP_1Rnd_SmokeGreen_M203", 2,"vest"] call FNC_AddItem;
	["CUP_1Rnd_SmokeRed_M203", 2,"vest"] call FNC_AddItem;
	
	["SmokeShell", 1] call FNC_AddItem; //White smoke
	["SmokeShellGreen", 1] call FNC_AddItem; //Green smoke
	["CUP_HandGrenade_RGD5", 1] call FNC_AddItem; //Frag grenade
	
	["JAN_Weapons_ARifle_QBZ95_GL_blk"] call FNC_AddItem; //Primary rifle
	["30Rnd_580x42_Mag_F"] call FNC_AddItem; // starting magazine
	
};

case (package + "MD"): {
	
	_unit call FNC_defineMedic;
	["CUP_V_PMC_CIRAS_Black_Veh"] call FNC_AddItemRandom;
	["JMSSA_ita_bagMed_b"] call FNC_AddItem;
	
	ADD_GROUP(uniform);	
	ADD_GROUP(IFAK);
	ADD_GROUP(items);	
	
	["30Rnd_580x42_Mag_F", 11,"vest"] call FNC_AddItem; //Magazines
	
	["SmokeShell", 2] call FNC_AddItem; //White smoke
	["SmokeShellGreen", 2] call FNC_AddItem; //Green smoke
	["CUP_HandGrenade_RGD5", 1] call FNC_AddItem; //Frag grenade

	["JAN_Weapons_ARifle_QBZ95_blk"] call FNC_AddItem; //Primary rifle
	["30Rnd_580x42_Mag_F"] call FNC_AddItem; // starting magazine
	
	 
	
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
	
	ADD_GROUP(uniform);	
	["CUP_V_PMC_CIRAS_Black_Patrol"] call FNC_AddItemRandom;
	["B_AssaultPack_blk"] call FNC_AddItemRandom;
	
	ADD_GROUP(IFAK);
	ADD_GROUP(items);	
	
	["30Rnd_580x42_Mag_F", 10,"vest"] call FNC_AddItem; //Magazines
	["30Rnd_580x42_Mag_Tracer_F", 3,"vest"] call FNC_AddItem;
	
	["SmokeShell", 2] call FNC_AddItem; //White smoke
	["SmokeShellGreen", 1] call FNC_AddItem; //Green smoke
	["CUP_HandGrenade_RGD5", 2] call FNC_AddItem; //Frag grenade
	
	
	["JAN_Weapons_ARifle_QBZ95_blk"] call FNC_AddItem; //Primary rifle
	["30Rnd_580x42_Mag_F"] call FNC_AddItem; // starting magazine
	
	["CUP_PipeBomb_M", 2,"backpack"] call FNC_AddItem; 
	["ACE_Clacker", 1,"backpack"] call FNC_AddItem; 
	
};


case (package + "AR"): {
	
	ADD_GROUP(uniform);	
	["CUP_V_PMC_CIRAS_Black_Veh"] call FNC_AddItemRandom;
	["JAN_B_FieldPack_PLA_Basic_O"] call FNC_AddItemRandom;
	ADD_GROUP(IFAK);
	ADD_GROUP(items);
	
	["100Rnd_580x42_Mag_Tracer_F", 6,"vest"] call FNC_AddItem; //Magazines
	
	["SmokeShell", 2] call FNC_AddItem; //White smoke
	["CUP_HandGrenade_RGD5", 2] call FNC_AddItem; //Frag grenade

	["arifle_CTARS_blk_F"] call FNC_AddItem; //Primary rifle
	["100Rnd_580x42_Mag_Tracer_F"] call FNC_AddItem; // starting magazine
	
	 
	
};

case (package + "ARA"): {
	
	
	ADD_GROUP(uniform);	
	["CUP_V_PMC_CIRAS_Black_Patrol"] call FNC_AddItemRandom;
	["JAN_B_FieldPack_PLA_Basic_O"] call FNC_AddItemRandom;
	ADD_GROUP(IFAK);
	ADD_GROUP(items);
	
	["30Rnd_580x42_Mag_F", 12,"vest"] call FNC_AddItem; //Magazines
	["100Rnd_580x42_Mag_Tracer_F", 4,"backpack"] call FNC_AddItem; 
	
	["SmokeShell", 2] call FNC_AddItem; //White smoke
	["CUP_HandGrenade_RGD5", 2] call FNC_AddItem; //Frag grenade

	["JAN_Weapons_ARifle_QBZ95_blk"] call FNC_AddItem; //Primary rifle
	["30Rnd_580x42_Mag_F"] call FNC_AddItem; // starting magazine
	
	 
	
};

case (package + "RIF"): {
		
	ADD_GROUP(uniform);	
	["CUP_V_PMC_CIRAS_Black_Patrol"] call FNC_AddItemRandom;
	
	ADD_GROUP(IFAK);
	ADD_GROUP(items);	
	
	["30Rnd_580x42_Mag_F", 13,"vest"] call FNC_AddItem; //Magazines
	
	["SmokeShell", 1] call FNC_AddItem; //White smoke
	["SmokeShellGreen", 1] call FNC_AddItem; //Green smoke
	["CUP_HandGrenade_RGD5", 1] call FNC_AddItem; //Frag grenade
	
	["JAN_Weapons_ARifle_QBZ95_blk"] call FNC_AddItem; //Primary rifle
	["30Rnd_580x42_Mag_F"] call FNC_AddItem; // starting magazine
	
};

case (package + "LAT"): {
		
	ADD_GROUP(uniform);	
	["CUP_V_PMC_CIRAS_Black_Veh"] call FNC_AddItemRandom;
	["CFP_RPGPack_Black"] call FNC_AddItemRandom;
	
	ADD_GROUP(IFAK);
	ADD_GROUP(items);	
	
	["30Rnd_580x42_Mag_F", 11,"vest"] call FNC_AddItem; //Magazines
	
	["SmokeShell", 2] call FNC_AddItem; //White smoke
	["SmokeShellGreen", 1] call FNC_AddItem; //Green smoke
	["CUP_HandGrenade_RGD5", 1] call FNC_AddItem; //Frag grenade
	["CUP_PG7VL_M", 1] call FNC_AddItem; //Frag grenade
	["CUP_OG7_M", 1] call FNC_AddItem; //Frag grenade
	
	["JAN_Weapons_ARifle_QBZ95_blk"] call FNC_AddItem; //Primary rifle
	["30Rnd_580x42_Mag_F"] call FNC_AddItem; // starting magazine
	["CUP_launch_RPG7V"] call FNC_AddItem;
	["CUP_PG7VL_M", 1] call FNC_AddItem; //Frag grenade
	["CUP_optic_PGO7V3"] call FNC_AddItem;
	
};

case (package + "ALAT"): {
	
	
	ADD_GROUP(uniform);	
	["CUP_V_PMC_CIRAS_Black_Patrol"] call FNC_AddItemRandom;
	["JAN_B_FieldPack_PLA_Basic_O"] call FNC_AddItemRandom;
	ADD_GROUP(IFAK);
	ADD_GROUP(items);
	
	["30Rnd_580x42_Mag_F", 12,"vest"] call FNC_AddItem; //Magazines
	["CUP_PG7VL_M", 2,"backpack"] call FNC_AddItem; 
	["CUP_OG7_M", 1,"backpack"] call FNC_AddItem; 
	
	["SmokeShell", 2] call FNC_AddItem; //White smoke
	["CUP_HandGrenade_RGD5", 1] call FNC_AddItem; //Frag grenade

	["JAN_Weapons_ARifle_QBZ95_blk"] call FNC_AddItem; //Primary rifle
	["30Rnd_580x42_Mag_F"] call FNC_AddItem; // starting magazine
	
	 
	
};

case (package + "CREW"): {
	
	["JAN_PLA_Ocean"] call FNC_AddItemRandom;
	["CUP_V_PMC_CIRAS_Black_Veh"] call FNC_AddItemRandom;
	["CUP_H_Navy_CrewHelmet_Blue"] call FNC_AddItemRandom;
	
	ADD_GROUP(IFAK);
	ADD_GROUP(items);
	
	["SmokeShell", 1] call FNC_AddItem; //White smoke
	["SmokeShellGreen", 1] call FNC_AddItem; //Green smoke	
	
	["16Rnd_9x21_Mag", 3,"vest"] call FNC_AddItem; //Magazines

	["JAN_Weapons_HGun_QSZ92"] call FNC_AddItem; //Primary rifle
	["16Rnd_9x21_Mag"] call FNC_AddItem; // starting magazine
	
	 
};

case (package + "CREWB"): {
	
	["JAN_PLA_Ocean"] call FNC_AddItemRandom;
	["CUP_V_PMC_CIRAS_Black_Veh"] call FNC_AddItemRandom;
	["CUP_H_Navy_CrewHelmet_Blue"] call FNC_AddItemRandom;
	
	ADD_GROUP(IFAK);
	ADD_GROUP(items);
	
	["ACRE_PRC148", 1] call FNC_AddItem; //Long range radio
	
	["SmokeShell", 1] call FNC_AddItem; //White smoke
	["SmokeShellGreen", 1] call FNC_AddItem; //Green smoke	
	
	["16Rnd_9x21_Mag", 3,"vest"] call FNC_AddItem; //Magazines

	["JAN_Weapons_HGun_QSZ92"] call FNC_AddItem; //Primary rifle
	["16Rnd_9x21_Mag"] call FNC_AddItem; // starting magazine
	
	 
};

case (package + "PIL"): {
	
	["JAN_PLA_Ocean"] call FNC_AddItemRandom;
	["CUP_V_PMC_CIRAS_Black_Veh"] call FNC_AddItemRandom;
	["H_PilotHelmetHeli_B"] call FNC_AddItemRandom;
	
	ADD_GROUP(IFAK);
	["ItemMap"] call FNC_AddItem;
	["ItemCompass"] call FNC_AddItem;
	["ItemWatch"] call FNC_AddItem;
	["cigs_nil_cigpack"] call FNC_AddItem;
	["cigs_lighter"] call FNC_AddItem;
	
	["ACRE_PRC148", 1] call FNC_AddItem; //Long range radio
	
	["SmokeShell", 1] call FNC_AddItem; //White smoke
	["SmokeShellGreen", 1] call FNC_AddItem; //Green smoke	
	
	["16Rnd_9x21_Mag", 3,"vest"] call FNC_AddItem; //Magazines

	["JAN_Weapons_HGun_QSZ92"] call FNC_AddItem; //Primary rifle
	["16Rnd_9x21_Mag"] call FNC_AddItem; // starting magazine
	
	 
};

