// Author:         [P] Tally (https://github.com/Tally-1)
// Comissioned by: Great Ape Gaming
// Description:    Creates a dataobject with the data needed to perform operations
//                 based on conditions related to the area defined by each marker in 
//                 the provided array.

params ['_markerArr'];
private _gridSquares = [];

{
	private _gridHash = createHashMap;
	private _position = markerPos _x;
	
	_gridHash set ["markerName", _x];
	_gridHash set ["position", _position];
	_gridHash set ["occupier", objNull];
	_gridHash set ["previousOccupier", objNull];
	_gridHash set ["lastOccupied", -300];

	_gridSquares pushBack _gridHash;
	
} forEach _markerArr;

_gridSquares