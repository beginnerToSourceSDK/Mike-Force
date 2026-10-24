// fn_prepSupplyForAirdrop.sqf
// Created by: 04 PFC. Cooper, 10/24/2026 @ 2:37 PM
// Adds an option to rig a supply crate for airdropping over the AO when carrying a crate via the SOG Prairie Fire Advanced Logistics Module


// Taken from VN_fnc_log_useractions
private _load_condition = toString { 
        vn_log_moving_object && {(cursorTarget distance player) < 12 && {(toLower typeof cursorTarget) in vn_log_vehicle_list}} 
};


// Add custom action on top of the basic logistics actions
_vn_log_actions_array = player getVariable "vn_log_actions_array";
_vn_log_actions_array pushBack 
(player addAction 
[ 
        "Rig crate for airdrop", 
        { 
                // Let the crate drop, then place it inside the Chinook
                spawn { 
                    _crate = vn_log_moving_object_obj; 
                    vn_log_moving_object = false;
                    sleep 0.4;
                    _success = cursorObject setVehicleCargo _crate; 
                     
                    if (_success == false) then 
                    { 
                        hint "Cargo space is full or the action failed!"; 
                    }; 
                };

        }, 
        [], 
        10, 
        true, 
        true, 
        "", 
        _load_condition, 
        12, 
        false, 
        "", 
        "" 
]);

player setVariable ["vn_log_actions_array",_vn_log_actions_array];