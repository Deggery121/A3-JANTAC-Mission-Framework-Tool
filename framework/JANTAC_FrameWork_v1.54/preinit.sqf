#define preinit

#include "core\script_macros.hpp"

FW_DebugMessages = [];
FW_Modules = [];

PREP(notTrackUnit);
PREP(debugMessage);
PREP(randomRange);
PREP(trackAsset);
PREP(canLinkItem);
PREP(canAttachItem);
PREP(addItemOrg);
PREP(addItemRandomOrg);
PREP(addItemVehicleOrg);
PREP(addItemVehicleRandomOrg);
PREP(removeAllGear);
PREP(removeBackpackContents);
PREP(defineMedic);
PREP(removeAllVehicleGear);
PREP(registerModule);
PREP(checkClassname);
PREP(makeUnitsList);

FNC_Briefing = compile preprocessFileLineNumbers "customization\briefing.sqf";

FNC_Menu = compile preprocessFileLineNumbers "core\menu.sqf";

FNC_JANFUBriefGear = compile preprocessFileLineNumbers "core\JANFUBriefGear.sqf";

FNC_displayLoadouts = compile preprocessFileLineNumbers "core\functions\fnc_displayLoadouts.sqf";

#include "modules\modules.sqf" //DO NOT REMOVE