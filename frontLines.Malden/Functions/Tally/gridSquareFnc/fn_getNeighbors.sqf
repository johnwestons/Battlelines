private _enemiesOnly = false;
private _friendsOnly = false;
params["_gridSquares", "_squareHash", "_enemiesOnly", "_friendsOnly"];


private _neighbors = _squareHash get "neighbors";
private _markers = [];

{
	private _push = 
	if(!isNil "_y")
	then{_markers pushBack _y};
	
} forEach _neighbors;

_neighbors = _gridSquares select {(_x get "marker") in _markers};

if!(_enemiesOnly && _friendsOnly)exitWith{_neighbors};

if(_enemiesOnly)exitWith{
	private _owner = [_squareHash] call frontL_fnc_squareDominantSide;
	_neighbors = _neighbors select {!(([_x] call frontL_fnc_squareDominantSide) == _owner)};

	_neighbors;
};

if(_friendsOnly)exitWith{
	private _owner = [_squareHash] call frontL_fnc_squareDominantSide;
	_neighbors = _neighbors select {!(([_x] call frontL_fnc_squareDominantSide) == _owner)};

	_neighbors;
};
systemchat "fn_getNeighbors was not called correctly, returning all neighbors";

_neighbors;