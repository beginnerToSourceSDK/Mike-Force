/*
    File: fn_surfaceShooting.sqf
    Author: S. "Scoop" Cooper / nonJoker
    Public: Yes

    Description:
        Allows you to shoot while treading water

    Example:
        call vn_mf_fnc_surfaceShooting;
*/

0 spawn { 
    while {true} do  
    { 
            if (inputAction "defaultAction" > 0 && (getPosASL player # 2) < -1.0 && pose player == "SurfaceDiving" && !underwater player && alive player) then  
                { 
                    player setVariable ["shootingOnWater", true];
                    player playMoveNow "AsdvPercMstpSnonWrflDnon"; 
 
                    player setPosASL [(getPosASL player # 0),(getPosASL player) # 1,-1.49]; 
                }; 
        }; 
}; 


{addUserActionEventHandler [_x, "Activated", {
    if ((getPosASL player # 2) < -1.0 && pose player == "SurfaceDiving" && !underwater player && alive player && (player getVariable "shootingOnWater") == true) then
    {
        player switchMove "";
        player playMoveNow "";
        player setVariable ["shootingOnWater", false];
    };
}];} forEach [ 
    "MoveForward", 
    "MoveBack", 
    "TurnLeft", 
    "TurnRight" 
];