// Author:         [P] Tally (https://github.com/Tally-1)
// Comissioned by: Great Ape Gaming
// Description:    creates a data-object(hashmap) containing positions and other relevant data used
//                 to understand and display the frontline of a certain area.

params ["_center", "_radius"];

_zone = createHashMap;

private _name          = ([_center] call Tcore_fnc_closestLocationName)#0;
private _containerSize = _radius / 2;
private _markerSize    = _containerSize /10;
private _gridPositions = [_center, _radius] call Tcore_fnc_grid100Pos;
private _anchorPositions = [_center, (_radius*0.7), 360] call Tcore_fnc_get360Positions;
private _gridMarkers   = [_gridPositions, _markerSize, _name] call frontL_fnc_gridMarkers;
private _gridSquares   = [_gridMarkers] call frontL_fnc_gridSquares;
private _zoneContainer = [_center, _containerSize, nil, nil, nil, "zoneContainer"] call frontL_fnc_squareMarker;
private _frontLine     = [_center, _radius, _name] call frontL_fnc_drawFrontLine;
private _unitCount     = 0;


_zone set ["center", _center];
_zone set ["radius", _radius];
_zone set ["cellSize", _markerSize];
_zone set ["gridSquares", _gridSquares];
_zone set ["anchorPositions", _anchorPositions];
_zone set ["unitMarkers", []];
_zone set ["zoneContainer", _zoneContainer];
_zone set ["frontLine", _frontLine];
_zone set ["unitCount", _unitCount];


_zone;