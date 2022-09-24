private _testMarkers = (allMapMarkers select {"battleZoneGSQ" in _x});
frontL_BattleZone = nil;
frontL_opforSidePos = nil;
frontL_bluforSidePos = nil;
update = false;
sleep (FrontL_updateTimer+1);
{deleteMarker _x} forEach _testMarkers;

  private _timer = time;
  systemChat "initializing BattleZone";
  frontL_BattleZone = [] call frontL_fnc_initBattleZone;
  private _time = time -_timer;
  systemChat (["initializing done in ", _time, " seconds"]joinString"");
  systemChat "looping update";
[] spawn frontL_fnc_taskManager;

systemChat "init done";