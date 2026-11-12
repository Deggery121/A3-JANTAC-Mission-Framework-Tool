/*
 * Author: Olsen
 *
 * Remove all gear.
 *
 * Arguments:
 * 0: unit <object>
 *
 * Return Value:
 * nothing
 *
 * Public: No
 */

private _unit = _this;


[_unit,"MedB"] call bis_fnc_setUnitInsignia;
_unit setvariable ["ace_medical_medicClass", 1, true];