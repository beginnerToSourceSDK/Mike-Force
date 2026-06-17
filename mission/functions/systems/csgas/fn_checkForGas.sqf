 
params ["_unit"];

_gas = (63 allObjects 3) select {_unit distance _x <= 5}; 
 
if (count _gas > 0 && getModelInfo (_gas # 0) # 0 == "vn_cs_gas_yellow.p3d" && !(goggles _unit == "vn_b_acc_m17_01" || goggles _unit == "vn_b_acc_m17_02")) then 
{ 
    [_unit] call vn_mf_fnc_gasUnit;
} else {
    
}; 