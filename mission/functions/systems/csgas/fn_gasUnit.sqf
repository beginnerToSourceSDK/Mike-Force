/*
    File: fn_gasUnit.sqf
    Author: S. Cooper
    Public: No

    Description:
        Applies gas effects to a given unit

    Parameter(s): Object (Unit to gas)

    Returns: nothing

    Example(s): none
*/
params ["_unit"];

blurred = ppEffectCreate ["DynamicBlur", 500];

_unit setSkill ["aimingAccuracy", 0];
_unit setSkill ["aimingSpeed", 0];
_unit setSkill ["spotDistance",0];
_unit setSkill ["aimingShake",0];
_unit setSkill ["spotTime",0];


// Apply effects to given unit ONLY
[blurred, 15] remoteExec ["ppeffectadjust", _unit];
[blurred, true] remoteExec ["ppeffectenable", _unit];
[blurred, 15] remoteExec ["ppeffectcommit", _unit];


[_unit] spawn {

    if (isNil _sound) then {
        _sound = (_this # 0) say3D "cough";

	    sleep 6.135;

	    deleteVehicle _sound;
    };
    

    (_this # 0) allowFleeing 1;
};


[_unit] spawn {
    _gasTimer = [30] call BIS_fnc_countdown;

    waitUntil {[0] call BIS_fnc_countdown < 1};

    // Apply effects to given unit ONLY
    [blurred, 0] remoteExec ["ppeffectadjust", _unit];
    [blurred, true] remoteExec ["ppeffectenable", _unit];
    [blurred, 15] remoteExec ["ppeffectcommit", _unit];

    (_this # 0) setSkill ["aimingAccuracy", 0.25];
    (_this # 0) setSkill ["aimingSpeed", 0.35];
    (_this # 0) setSkill ["spotDistance",0.85];
    (_this # 0) setSkill ["aimingShake",0.15];
    (_this # 0) setSkill ["spotTime",0.85];
    
    (_this # 0) allowFleeing 0;
};