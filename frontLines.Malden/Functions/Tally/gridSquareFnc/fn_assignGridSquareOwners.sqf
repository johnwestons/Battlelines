params["_gridSquares", "_battleZoneMarker"]; 

private _radius = selectMax(markerSize _battleZoneMarker);
private _sideMarkers = [_battleZoneMarker] call frontL_fnc_battleZoneSideMarkers;
private _opforSidePos = markerPos((_sideMarkers select {"opfor" in _x})#0);
private _bluforSidePos = markerPos((_sideMarkers select {"blufor" in _x})#0);
private _center = [_opforSidePos, _bluforSidePos] call Tcore_fnc_getMidPoint;
private _bluDir = _center getDir _bluforSidePos;

private _bluCenter = [_center, _bluDir, _radius] call frontL_fnc_sinCosPos;
private _bluContainer = [_bluCenter, _radius] call frontL_fnc_SquareMarker;
_bluContainer setMarkerDir _bluDir;
private _bluSquares = [_gridSquares, _bluContainer] call frontL_fnc_getSquaresFromMrk;
private _opSquares = _gridSquares select {!(_x in _bluSquares)};
{
	(_x get "marker") setMarkerColor "ColorBlue";
	_x set ["occupier", bluFor];
	_x set ["previousOccupier", bluFor];
	_x set ["lastOccupied", time];
} forEach _bluSquares;

{
	(_x get "marker") setMarkerColor "ColorRed";
	_x set ["occupier", opfor];
	_x set ["previousOccupier", opfor];
	_x set ["lastOccupied", time];
} forEach _opSquares;


deleteMarker _bluContainer;
frontL_opforSidePos = _opforSidePos;
frontL_bluforSidePos = _bluforSidePos;
true;