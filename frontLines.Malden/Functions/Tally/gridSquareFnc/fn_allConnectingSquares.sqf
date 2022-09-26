// Author:         [P] Tally
// Author links:   https://github.com/Tally-1 , https://thehartgen.web.app/projects/ , https://www.fiverr.com/hartgen_dev/script-anything-you-can-think-of-in-arma-3
// Comissioned by: Great Ape Gaming
// Description:    Gets all squares that can be linked via markers of the same color as the marker found in the "_squareHash".
//                 Useful for defining where a frontLine is and which areas are isolated from the main-body.

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