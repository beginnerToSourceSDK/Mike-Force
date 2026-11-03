/*
    File: fn_health_effects.sqf
    Author: Savage Game Design
    Public: No

    Description:
		Sets health stats based effects on player.

    Parameter(s): none

    Returns: nothing

    Example(s):
		call vn_mf_fnc_health_effects;
*/

private _stamina_scheme = "Default";
// disable spriting if player is thirsty
if (player getVariable ["vn_mf_db_thirst", 1] isEqualTo 0) then
{
	_stamina_scheme = "FastDrain";
	player allowSprint false;
}
else
{
	player allowSprint true;
};

// force walk if player is hungry
if (player getVariable ["vn_mf_db_hunger", 1] isEqualTo 0) then
{
	_stamina_scheme = "Exhausted";
	player forceWalk true;
}
else
{
	player forceWalk false;
};

// disable sprinting if player has medical condition (attributes) eg. poison or diarrhea
if (count (player getVariable ["vn_mf_db_attributes", []]) isEqualto 0) then
{
  player allowSprint true;
}
else
{
  _stamina_scheme = "Exhausted";
  // Enable running when taking anti-biotics and ill
  if (player getVariable "vn_mf_db_atbiActive" == true) then
  {
    player allowSprint true; // Treat illness
    0 spawn {
      sleep 90; // Effects of anti-biotics lasts for 90 seconds
      player allowSprint false;
      player setVariable ['vn_mf_db_atbiActive', false];
    };
  } else {
    player allowSprint false;
  };
  
};

// Enable running when taking pain-killers and limping
if (player getVariable "vn_mf_db_pkActive" == true && player getHitPointDamage "HitLegs" >= 0.5) then
{
  previousLegDamage = player getHitPointDamage "HitLegs";
  player setHitPointDamage ["HitLegs", 0.45]; // Stop the limping
    [previousLegDamage] spawn { 
      sleep 90; // Effects of pain-killers lasts for 90 seconds
      player setHitPointDamage ["HitLegs", (_this # 0)];
      player setVariable ['vn_mf_db_pkActive', false];
  };
};

setStaminaScheme _stamina_scheme;
