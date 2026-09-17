0 spawn {
    while {true} do 
    {
            if (inputAction "defaultAction" > 0 && (getPosASL player # 2) < -1.0 && pose player == "SurfaceDiving" && !underwater player && alive player) then 
                {
                    player playMoveNow "AsdvPercMstpSnonWrflDnon";

                    player setPosASL [(getPosASL player # 0),(getPosASL player) # 1,-1.49];
                };
            
        };
};