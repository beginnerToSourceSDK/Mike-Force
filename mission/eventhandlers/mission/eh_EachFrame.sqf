/*
    File: eh_EachFrame.sqf
    Author: Savage Game Design
    Public: No

    Description:
	    Executes code each frame.

    Parameter(s): none

    Returns: nothing

    Example(s):
	    Not called directly.
*/

// add code you want to run each frame here
[] spawn {
   sleep 0.01;
   {
      [_x] call vn_mf_fnc_checkForGas;
      
   } forEach allUnits;
};