// Author:         [P] Tally (https://github.com/Tally-1)
// Comissioned by: Great Ape Gaming
// Description:    Creates a marker and sets it as a polyLine-type marker. the line is drawn between 
//                 points at 90 degrees (east -> west)

params ["_zoneCenter", "_zoneRadius","_postFix"];

private _frontlineDir = 90;
private _path = [_zoneCenter, _zoneRadius, _frontlineDir] call frontL_fnc_straightLinePath;

private _markerName  = [_zoneCenter, " frontLine_", _postFix] joinString "";
private _marker = createMarker [_markerName, _zoneCenter];
_marker setMarkerColor "ColorBlack";
_marker setMarkerPolyline _path;
_marker;