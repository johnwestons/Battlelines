// Author:         [P] Tally (https://github.com/Tally-1)
// Comissioned by: Great Ape Gaming
// Description:    Creates a dataobject with the data needed to perform operations
//                 based on conditions related to the area defined by each marker in 
//                 the provided array.

params ['_markerArr'];
private _gridSquares = [];

{
	private _squareHash = createHashMap;
	private _position = markerPos _x;
	
	_squareHash set ["marker", _x];
	_squareHash set ["position", _position];
	_squareHash set ["occupier", objNull];
	_squareHash set ["previousOccupier", objNull];
	_squareHash set ["lastOccupied", -300];
	_squareHash set ["island", false];

	_gridSquares pushBack _squareHash;
	
} forEach _markerArr;

// private _lastSquare = (count _gridSquares)-2;

{[_x, _gridSquares] call frontL_fnc_gridSqNeighbors;} forEach _gridSquares;



_gridSquares