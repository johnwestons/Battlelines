// Author:         [P] Tally
// Author links:   https://github.com/Tally-1 , https://thehartgen.web.app/projects/ , https://www.fiverr.com/hartgen_dev/script-anything-you-can-think-of-in-arma-3
// Comissioned by: Great Ape Gaming
// Description:    Inits the BattleZone and the update-loop(task-manager).

frontL_BattleZoneInitialized = false;
frontL_DebugMarkers = [];
sleep 1;
private _timer = time;
systemChat "initializing BattleZone";
frontL_BattleZone = [] call frontL_fnc_initBattleZone;

[frontL_BattleZone, true] call frontL_fnc_updateBattleZone;

[] spawn frontL_fnc_taskManager;

frontL_BattleZoneInitialized = true;
systemChat (["initializing done in ", (time-_timer), " seconds"]joinString"");