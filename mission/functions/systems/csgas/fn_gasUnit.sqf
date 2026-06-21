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
publicVariable "blurred";


_unit setSkill ["aimingAccuracy", 0];
_unit setSkill ["aimingSpeed", 0];
_unit setSkill ["spotDistance",0];
_unit setSkill ["aimingShake",0];
_unit setSkill ["spotTime",0];


// Apply effects to given unit ONLY
[blurred, [5]] remoteExec ["ppeffectadjust", _unit];
[blurred, true] remoteExec ["ppeffectenable", _unit];
[blurred, 15] remoteExec ["ppeffectcommit", _unit];

[_unit] spawn {

    _sound = (_this # 0) say3D "cough";

	sleep 6.135;

	deleteVehicle _sound;
};


// Force AI to disperse (fleeing)
if (!isPlayer _unit) then
{
    
    if (isNull _unit getVariable "FleeingCS") then
    {
        _unit setVariable ["FleeingCS",true];
        [_unit] joinSilent grpNull;
        _unit addWaypoint [position _unit, 50, 1];
        _unit setCurrentWaypoint [group _unit, 1];
        _unit setBehaviour "CARELESS";
    };
};

// Effects wear off
[_unit, blurred] spawn {
    _gasTimer = [15] call BIS_fnc_countdown;

    waitUntil {[0] call BIS_fnc_countdown < 1};

    // Apply effects to given unit ONLY
    [(_this # 1), [0]] remoteExec ["ppeffectadjust", (_this # 0)];
    [(_this # 1), 15] remoteExec ["ppeffectcommit", (_this # 0)];
    [(_this # 1), false] remoteExec ["ppEffectEnable", (_this # 0)];

    (_this # 0) setSkill ["aimingAccuracy", 0.25];
    (_this # 0) setSkill ["aimingSpeed", 0.35];
    (_this # 0) setSkill ["spotDistance",0.85];
    (_this # 0) setSkill ["aimingShake",0.15];
    (_this # 0) setSkill ["spotTime",0.85];

    // Reform a patch-work squad
    [(_this # 0)] joinSilent (((_this # 0) nearEntities [["CAManBase"], 150] select {side (_this # 0) == east and !isPlayer (_this # 0)}) select 0);

    (_this # 0) setVariable ["FleeingCS",false];
    (_this # 0) setBehaviour "AWARE";
};