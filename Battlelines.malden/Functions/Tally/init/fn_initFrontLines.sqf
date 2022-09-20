// Author:         [P] Tally (https://github.com/Tally-1)
// Comissioned by: Great Ape Gaming
// Description:    Initializes all zones and spawns an updating loop. The loop frequency
//                 can be adjusted with the "FrontL_updateTimer" value.

FrontL_debug = true;
FrontL_updateTimer = 0;

//shorter function-name for ease of writing
if(isNil "fDbgMsg")
then{
  fDbgMsg = frontL_fnc_debugMessage;
  };


/*
private _zoneMarkers = allMapMarkers select {"frontL" in _x};
FrontL_AllZones = createHashMap;

{
  private _zone = [_x] call frontL_fnc_initZoneFromMarker;
  FrontL_AllZones set [_x, _zone];
  _x setMarkerAlpha 0;
} forEach _zoneMarkers;



[] spawn frontL_fnc_zoneUpdater;
*/

if(FrontL_debug)then{[]spawn frontL_fnc_debugInit};



true;