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

	How to use:
	[_unit,_weapons,_items,_tools] call SAR_unut_loadout;
	return value: tools array
*/

private ["_unit","_weapons","_weapon","_items","_unit_magazine_name","_item","_tool","_tools","_forEachIndex"];

_unit = _this select 0;
_weapons = _this select 1;
_items = _this select 2;
_tools = _this select 3;

removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeGoggles _unit;

_unit enableFatigue false;

{
	_weapon = _weapons select _forEachIndex;

	if (_weapon !="") then {
		_unit_magazine_name = getArray (configFile >> "CfgWeapons" >> _weapon >> "magazines") select 0;
		_unit addMagazine _unit_magazine_name;
		_unit addWeapon _weapon;
	};
} forEach _weapons;

{
	_item = _items select _forEachIndex;
	_unit addMagazine _item;
} forEach _items;

{
	_tool = _tools select _forEachIndex;
	_unit addWeapon _tool;
} forEach _tools;
