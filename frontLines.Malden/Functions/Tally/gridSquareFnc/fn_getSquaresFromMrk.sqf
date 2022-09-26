// Author:         [P] Tally
// Author links:   https://github.com/Tally-1 , https://thehartgen.web.app/projects/ , https://www.fiverr.com/hartgen_dev/script-anything-you-can-think-of-in-arma-3
// Comissioned by: Great Ape Gaming
// Description:    Gets gridSquareHashmaps that are located within the area of a marker.

params["_gridSquares", "_marker"];
private _positions = [_gridSquares] call frontL_fnc_squarePositions;
	    _positions = _positions inAreaArray _marker;

private _condition = {((_x get "position") in _positions)};
private _inMrkSqs = _gridSquares select _condition;

_inMrkSqs;