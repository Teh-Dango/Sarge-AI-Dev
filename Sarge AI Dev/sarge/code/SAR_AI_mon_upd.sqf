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

	Parameters:
	_typearray (possible values = "max_grps", "rnd_grps", "max_p_grp", "grps_band","grps_sold","grps_surv")
	_valuearray (must be an array)
	_gridname (is the areaname of the grid for this change)
*/

private ["_typearray","_valuearray","_gridname","_path","_success","_forEachIndex"];

_typearray = _this select 0;
_valuearray =_this select 1;
_gridname = _this select 2;

_path = [SAR_AI_monitor, _gridname] call BIS_fnc_findNestedElement;

{
	switch (_x) do
	{
		case "max_grps":
		{
			_path set [1,1];
		};
		case "rnd_grps":
		{
			_path set [1,2];
		};
		case "max_p_grp":
		{
			_path set [1,3];
		};
		case "grps_band":
		{
			_path set [1,4];
		};
		case "grps_sold":
		{
			_path set [1,5];
		};
		case "grps_surv":
		{
			_path set [1,6];
		};
	};

	_success = [SAR_AI_monitor, _path, _valuearray select _forEachIndex] call BIS_fnc_setNestedElement;

} foreach _typearray;

_success;