/*
    File: fn_unpackMCIBox.sqf
    Author: 04 Spc. Cooper
    Public: No

    Description:
        Unpacks the MCI box, resulting in a total of 4 cans and the accessory packet being transfered to the player's inventory if space is available

    Parameter(s):
		nothing

    Returns: nothing

    Example(s): none
*/


// Dessert Units
private _dUnits1 = ["vn_prop_food_can_02_06","vn_prop_food_can_02_07","vn_prop_food_can_02_08"];
private _dUnits2 = ["vn_prop_food_can_01_12","vn_prop_food_can_01_13","vn_prop_food_can_01_14","vn_prop_food_can_01_15"];
private _dUnit3 = "vn_prop_food_can_01_16";

// Meat Units
private _m1Group = ["vn_prop_food_box_02_01","vn_prop_food_box_02_02","vn_prop_food_box_02_07"];
private _m2Group = ["vn_prop_food_box_02_04","vn_prop_food_box_02_03"];
private _m3Group = ["vn_prop_food_box_02_08","vn_prop_food_box_02_05","vn_prop_food_box_02_06"];

//Spread Units
_s1 = "vn_prop_food_can_03_01";
_s2 = "vn_prop_food_can_03_04";
_s3 = ["vn_prop_food_can_03_02", "vn_prop_food_can_03_03"];

// B Units
_b1 = "vn_prop_food_can_01_10";
_b2 = "vn_prop_food_can_01_11";
_b3 = "vn_prop_food_can_02_05";

private _item = "";
private _interacted_item = uiNamespace getVariable ["vn_mf_interacted_item",[]];
if !(_interacted_item isEqualTo []) then
{
	_item = _interacted_item select 1;
};

// Meat Units
switch (_item) do 
{
    // Group 1
    case "vn_prop_food_box_02_01": {player addItem "vn_prop_food_can_01_05"};
    case "vn_prop_food_box_02_02": {player addItem "vn_prop_food_can_01_04"};
    case "vn_prop_food_box_02_07": {player addItem "vn_prop_food_can_01_02"};

    // Group 2
    case "vn_prop_food_box_02_03": {player addItem "vn_prop_food_can_02_03"};
    case "vn_prop_food_box_02_04": {player addItem "vn_prop_food_can_02_04"};

    // Group 3
    case "vn_prop_food_box_02_08": {player addItem "vn_prop_food_can_01_08"};
    case "vn_prop_food_box_02_05": {player addItem "vn_prop_food_can_01_03"};
    case "vn_prop_food_box_02_06": {player addItem "vn_prop_food_can_01_09"};

};


// Dessert, B and S units
switch (true) do
{
    case (_item in _m1Group): {
        player addItem (selectRandom _dUnits1);
        player addItem _s1;
        player addItem _b1;

    };
    case (_item in _m2Group): {
        player addItem (selectRandom _dUnits2);
        player addItem _s2;
        player addItem _b2;
    };
    case (_item in _m3Group): {
        player addItem _dUnit3;
        player addItem (selectRandom _s3);
        player addItem _b3;
    };
};
