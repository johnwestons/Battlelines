// Author:         [P] Tally (https://github.com/Tally-1)
// Comissioned by: Great Ape Gaming
// Description:    Creates a grid of positions then removes from that grid any positions outside of the marker
//                 with "frontL" and "battleZone" in the marker name (if there are more than one only the first will be used).
//                 Any position found within the area of a marker with "frontL" and "excluded" in the name will be removed.
//                 Keep in mind that the marker-name check is CASE-SENSITIVE.
//                The actual gridSize is slightly larger than set in the "fn_initFrontLines.sqf" file.
params["_battleZoneMarker"];

private _exclusionMarkers = (allMapMarkers select {"frontL" in _x && {"excluded" in _x}});//The "in" check is case-sensitive.
private _pos = markerPos _battleZoneMarker;
private _xY  = markerSize _battleZoneMarker; //Returns half the x/y value (https://community.bistudio.com/wiki/getMarkerSize)
private _radius = selectMax _xY *2;
private _posCount = round((_radius / frontL_gridSquareSize)*10);


private _baseGrid = [_pos, _radius, _posCount, 0, false] call frontL_fnc_SquareGrid;
private _actualSquareSize = _baseGrid#0 distance2D _baseGrid#1;//there is a slight deviation from wanted squareSize to actual size.
private _battleGrid = _baseGrid inAreaArray _battleZoneMarker;

{_battleGrid = [_battleGrid, _x] call frontL_fnc_removeExcludedPositions;} forEach _exclusionMarkers;


[_battleGrid, _actualSquareSize];
