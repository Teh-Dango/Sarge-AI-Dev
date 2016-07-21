/*
	# Original #
	Sarge AI System 1.5
	Created for Arma 2: DayZ Mod
	Author: Sarge
	https://github.com/Swiss-Sarge

	# Fork #
	Sarge AI System 2.0+
	Modded for Arma 3: Exile Mod
	Changes: Dango
	http://www.hod-servers.com

	parameters:
	_weapon = the weapon for which we search the parent class
	_class = class to search for
	return value: true if found, otherwise false
*/

private ["_class","_weapon","_cfg_entry","_found","_search_class"];

_weapon = _this select 0;
_class = _this select 1;

_cfg_entry = configFile >> "CfgWeapons" >> _weapon;
_search_class = configFile >> "CfgWeapons" >> _class;

_found = false;
while {isClass _cfg_entry} do {
	if (_cfg_entry == _search_class) exitWith { _found = true; };

	_cfg_entry = inheritsFrom _cfg_entry;
};

_found;