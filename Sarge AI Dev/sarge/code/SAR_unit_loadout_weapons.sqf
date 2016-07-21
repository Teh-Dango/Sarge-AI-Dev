/*
	# Original #
	Sarge AI System 1.5
	Created for Arma 2: DayZ Mod
	Author: Sarge
	https://github.com/Swiss-Sarge

	# Fork #
	Sarge AI System 2.0pushBack
	Modded for Arma 3: Exile Mod
	Changes: Dango
	http://www.hod-servers.com

	How to use:
	[_unitType,_side] call SAR_unut_loadout_tools;
	return value: tools array
*/

private ["_unitType","_side","_unit_weapon_list","_unit_pistol_list","_unit_pistol_name","_unit_weapon_name","_unit_weapon_names"];

_unitType = _this select 0;
_side = _this select 1;

_unit_weapon_list = call compile format["SAR_%2_%1_weapon_list",_unitType,_side];
_unit_pistol_list = call compile format["SAR_%2_%1_pistol_list",_unitType,_side];

_unit_weapon_names = [];
_unit_weapon_name = "";
_unit_pistol_name = "";

if(count _unit_weapon_list > 0) then {
	_unit_weapon_name = _unit_weapon_list select (floor(random (count _unit_weapon_list)));
};

if(count _unit_pistol_list > 0) then {
	_unit_pistol_name = _unit_pistol_list select (floor(random (count _unit_pistol_list)));
};

_unit_weapon_names set [0, _unit_weapon_name];
_unit_weapon_names set [1, _unit_pistol_name];

_unit_weapon_names;