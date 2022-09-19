// Author:         [P] Tally (https://github.com/Tally-1)
// Comissioned by: Great Ape Gaming
// Description:    Initializes all zones and spawns an updating loop. The loop frequency
//                 can be adjusted with the "FrontL_updateTimer" value.

FrontL_debug = true;
FrontL_updateTimer = 0;

private _zoneMarkers = allMapMarkers select {"frontL" in _x};
FrontL_AllZones = createHashMap;

{
  private _zone = [_x] call frontL_fnc_initZoneFromMarker;
  FrontL_AllZones set [_x, _zone];
  _x setMarkerAlpha 0;
} forEach _zoneMarkers;



[] spawn frontL_fnc_zoneUpdater;


//this codeBlock is for debugging and testing new functions by pressing numpad 1-2
// set FrontL_debug to false to avoid this.
// Will be moved to its own file soon.
if(FrontL_debug)
then{
[]spawn{
  waituntil {isTouchingGround player};

  execVM 'Functions\Tally\DevFile.sqf';

  (findDisplay 46) displayAddEventHandler 
  ["KeyDown", "
        private _Pressed = false;
        if ((_this # 1) == 79) then {execVM 'Functions\Tally\DevFile.sqf'; _Pressed = true};
        if ((_this # 1) == 80) then {hint 'reCompiling...'; [5] call BIS_fnc_recompile; _Pressed = true};
        if ((_this # 1) == 81) then {
                        {
                          [_x] call SFSM_fnc_battlefieldEnd;	
                        }forEach SFSM_battles;
                        _Pressed = true;
                      };
  _Pressed"];
}};



true;