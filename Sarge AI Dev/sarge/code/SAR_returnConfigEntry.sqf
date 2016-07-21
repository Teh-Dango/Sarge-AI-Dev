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
*/

private ["_config", "_entryName","_entry", "_value"];

_config = _this select 0;
_entryName = _this select 1;
_entry = _config >> _entryName;

//If the entry is not found and we are not yet at the config root, explore the class' parent.
if (((configName (_config >> _entryName)) == "") && {!((configName _config) in ["CfgVehicles", "CfgWeapons", ""])}) then {
	[inheritsFrom _config, _entryName] call SAR_fnc_returnConfigEntry;
} else { 
	if (isNumber _entry) then {
		_value = getNumber _entry; 
	} else { 
		if (isText _entry) then { _value = getText _entry; }; 
	}; 
};

//Make sure returning 'nil' works.
if (isNil "_value") exitWith {nil};

_value;