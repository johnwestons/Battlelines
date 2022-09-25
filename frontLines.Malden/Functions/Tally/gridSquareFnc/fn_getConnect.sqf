params["_connectedSquares", "_squareHash", "_gridSquares", "_wantedSide"];

_connectedSquares pushBackUnique _squareHash;
private _index = (count _connectedSquares)-1;
private _newNeighbors = [_gridSquares, _squareHash, false, true] call frontL_fnc_getNeighbors;
_newNeighbors = _newNeighbors select {markerColor (_squareHash get "marker") == markerColor (_x get "marker")};
_connectedSquares insert [_index, _newNeighbors, true];

_connectedSquares;