// Parameters:
// _unittype (leader, soldier, sniper)
// _side (mili, surv, band
// return value: tools array

private ["_unittype","_side","_unit_tools_list","_unit_tools","_tool","_probability","_chance"];

_unittype = _this select 0;
_side = _this select 1;

_unit_tools_list = call compile format["SAR_%2_%1_tools",_unittype,_side];

_unit_tools = [];
{
	_tool = _x select 0;
	_probability = _x select 1;
	_chance = (random 100);
	if(_chance < _probability) then {
		_unit_tools set [count _unit_tools, _tool];
	};
} foreach _unit_tools_list;

_unit_tools;
