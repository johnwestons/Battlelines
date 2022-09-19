// Author:         [P] Tally (https://github.com/Tally-1)
// Comissioned by: Great Ape Gaming
// Description:    Updates all data related to a zone.
//                 Too see what a zone is this context read fn_createZone.sqf
params["_zone"];
private _pos = _zone get "center";

private _zoneSize = (_zone get "radius") * 0.7;
private _unitsInZone = [_pos, _zoneSize] call frontL_fnc_AiObjectsInArea;

[_zone, _unitsInZone] call frontL_fnc_updateGrid;
[_zone, _unitsInZone] call frontL_fnc_updateFrontLine;
[_zone, _unitsInZone] call frontL_fnc_zoneUnitMarkers;


private _currentCount = count _unitsInZone;
private _previousCount =  _zone get "unitCount";

true;