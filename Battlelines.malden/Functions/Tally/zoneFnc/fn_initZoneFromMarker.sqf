// Author:         [P] Tally (https://github.com/Tally-1)
// Comissioned by: Great Ape Gaming
// Description:    Creates a zone based on values of provided marker.
//                 Too see what a zone is this context read fn_createZone.sqf

params ["_marker"];

if(isNil "_marker")exitWith{};
// if(isNull _marker)exitWith{};

private _pos = markerPos _marker;
if(isNil "_pos")exitWith{};
if(surfaceIsWater _pos)exitWith{};

private _radius = (selectMax(markerSize _x))*2;
if(_radius < 50)exitWith{};

private _zone = [_pos, _radius] call frontL_fnc_createZone;

_zone;