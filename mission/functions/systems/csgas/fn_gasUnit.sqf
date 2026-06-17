params ["_unit"];

blurred = ppEffectCreate ["DynamicBlur", 500];

_unit setSkill ["aimingAccuracy", 0];
_unit setSkill ["aimingSpeed", 0];
_unit setSkill ["spotDistance",0];
_unit setSkill ["aimingShake",0];
_unit setSkill ["spotTime",0];



blurred ppeffectadjust [15];
blurred ppeffectenable true;
blurred ppeffectcommit 15;

[_unit] spawn {
    _sound = (_this # 0) say3D "cough";

	sleep 6.135;

	deleteVehicle _sound;
};


[] spawn {
    _gasTimer = [30] call BIS_fnc_countdown;

    waitUntil {[0] call BIS_fnc_countdown < 1};

    blurred ppeffectadjust [0];
    blurred ppeffectcommit 15;
    
};