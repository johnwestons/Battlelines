frontL_BattleZoneInitialized = false;
sleep 1;
private _timer = time;
systemChat "initializing BattleZone";
frontL_BattleZone = [] call frontL_fnc_initBattleZone;

private _script = [frontL_BattleZone, true] call frontL_fnc_updateBattleZone;
// waitUntil{scriptDone _script};

[] spawn frontL_fnc_taskManager;

frontL_BattleZoneInitialized = true;
systemChat (["initializing done in ", (time-_timer), " seconds"]joinString"");