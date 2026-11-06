/*
    File: fn_unpackRationCase.sqf
    Author: 04 Spc. Cooper
    Public: No

    Description:
        Unpacks one (1) menu item from the selected case

    Parameter(s):
		nothing

    Returns: nothing

    Example(s): none
*/

private _item = "";
private _interacted_item = uiNamespace getVariable ["vn_mf_interacted_item",[]];
if !(_interacted_item isEqualTo []) then
{
	_item = _interacted_item select 1;
};


// Menu items
_mcis = ["vn_prop_food_box_02_01","vn_prop_food_box_02_02","vn_prop_food_box_02_03","vn_prop_food_box_02_04","vn_prop_food_box_02_05","vn_prop_food_box_02_06","vn_prop_food_box_02_07","vn_prop_food_box_02_08"];
_lrrps = ["vn_prop_food_lrrp_01_01","vn_prop_food_lrrp_01_02","vn_prop_food_lrrp_01_03","vn_prop_food_lrrp_01_04","vn_prop_food_lrrp_01_05","vn_prop_food_lrrp_01_06","vn_prop_food_lrrp_01_07","vn_prop_food_lrrp_01_08"];
_pirs = ["vn_prop_food_pir_01_01","vn_prop_food_pir_01_02","vn_prop_food_pir_01_03","vn_prop_food_pir_01_04","vn_prop_food_pir_01_05"];

switch (_item) do
{
    case "vn_prop_food_box_01_03": {player addItem (selectRandom _mcis)};
    case "class vn_prop_food_box_01_01": {player addItem (selectRandom _lrrps)};
    case "class vn_prop_food_box_01_02": {player addItem (selectRandom _pirs)};
};