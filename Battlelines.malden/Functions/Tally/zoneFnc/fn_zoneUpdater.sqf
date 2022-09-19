// Author:         [P] Tally (https://github.com/Tally-1)
// Comissioned by: Great Ape Gaming
// Description:    Updates all zones.
//                 Too see what a zone is this context read fn_createZone.sqf

while { sleep 0.1; true; } do {
	
	{
		private _script = [_y] spawn frontL_fnc_updateZone;
		waitUntil{sleep 0.01; scriptDone _script};
	} forEach FrontL_AllZones;

	sleep FrontL_updateTimer
};