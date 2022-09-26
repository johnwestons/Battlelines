// Author:         [P] Tally
// Author links:   https://github.com/Tally-1 , https://thehartgen.web.app/projects/ , https://www.fiverr.com/hartgen_dev/script-anything-you-can-think-of-in-arma-3
// Comissioned by: Great Ape Gaming
// Description:    Initializes the main battleZone as well as the frontLine.
_zone = createHashMap;

private _battleZoneMarker = (allMapMarkers select {"frontL" in _x && {"battleZone" in _x}})#0;//The "in" check is case-sensitive.

private _gridAndGridSquareSize = [_battleZoneMarker] call frontL_fnc_getBattleGrid;
private _battleGrid = _gridAndGridSquareSize#0;
private _squareRadius = _gridAndGridSquareSize#1;
private _markerSize = _squareRadius/2;
private _center = markerPos _battleZoneMarker;
private _radius = (selectMax (markerSize _battleZoneMarker)) *2;
private _anchorPositions = [_center, (_radius*0.7), 360] call Tcore_fnc_get360Positions;
private _gridMarkers = [_battleGrid, _markerSize, "battleZoneGSQ"] call frontL_fnc_gridMarkers;
private _gridSquares = [_gridMarkers] call frontL_fnc_gridSquares;
private _frontLine = [_center, _radius, "battleZoneLine"] call frontL_fnc_drawFrontLine;
private _unitCount = 0;

[_gridSquares, _battleZoneMarker] call frontL_fnc_assignGridSquareOwners;

_zone set ["marker", _battleZoneMarker];
_zone set ["anchorPositions", _anchorPositions];
_zone set ["center", _center];
_zone set ["radius", _radius];
_zone set ["cellSize", _markerSize];
_zone set ["gridSquares", _gridSquares];
_zone set ["gridMarkers", _gridMarkers];
_zone set ["unitMarkers", []];
_zone set ["frontLine", _frontLine];
_zone set ["unitCount", _unitCount];

frontL_gridSquareSize = _squareRadius;

_zone;