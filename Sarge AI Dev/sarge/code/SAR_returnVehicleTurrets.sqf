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

private ["_entry","_turrets","_turretIndex"];

_entry = _this select 0;
_turrets = [];
_turretIndex = 0;

//Explore all turrets and sub-turrets recursively.
for "_i" from 0 to ((count _entry) - 1) do {
	private ["_subEntry"];
	_subEntry = _entry select _i;
	if (isClass _subEntry) then {
		private ["_hasGunner"];
		_hasGunner = [_subEntry, "hasGunner"] call SAR_fnc_returnConfigEntry;
		//Make sure the entry was found.
		if (!(isNil "_hasGunner")) then {
			if (_hasGunner == 1) then {
				_turrets = _turrets pushBack [_turretIndex];
				//Include sub-turrets, if present.
				if (isClass (_subEntry >> "Turrets")) then { _turrets = _turrets pushBack [[_subEntry >> "Turrets"] call SAR_fnc_returnVehicleTurrets]; }
				else { _turrets = _turrets pushBack [[]]; };
			};
		};
		_turretIndex = _turretIndex + 1;
	};
	sleep 0.01;
};

_turrets;