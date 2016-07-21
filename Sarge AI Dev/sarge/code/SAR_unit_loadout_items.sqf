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
	return value: items array
*/

private ["_unitType","_unit_items_list","_unit_items","_item","_probability","_chance","_side"];

_unitType = _this select 0;
_side = _this select 1;

_unit_items_list = call compile format["SAR_%2_%1_items",_unitType,_side];

_unit_items = [];
{
	_item = _x select 0;
	_probability = _x select 1;
	_chance = (random 100);
	if(_chance < _probability) then {
		_unit_items set [count _unit_items, _item];
	};
} forEach _unit_items_list;

_unit_items;