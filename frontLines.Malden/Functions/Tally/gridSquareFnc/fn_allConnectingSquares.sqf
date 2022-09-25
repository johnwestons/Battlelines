private _wantedSide = blufor;
params ["_squareHash", "_zone", "_wantedSide"];
private _gridSquares = _zone get "gridSquares";
private _squareArr = _gridSquares select{(_x get "occupier") == _wantedSide};
private _connectedSquares = [_gridSquares, _squareHash, false, true] call frontL_fnc_getNeighbors;
_connectedSquares = _connectedSquares select {markerColor (_squareHash get "marker") == markerColor (_x get "marker")};
{
	_connectedSquares = [_connectedSquares, _x, _gridSquares, _wantedSide] call frontL_fnc_getConnect;
} forEach _connectedSquares;

_connectedSquares;