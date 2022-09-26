// Author:         [P] Tally
// Author links:   https://github.com/Tally-1 , https://thehartgen.web.app/projects/ , https://www.fiverr.com/hartgen_dev/script-anything-you-can-think-of-in-arma-3
// Comissioned by: Great Ape Gaming
// Description:    Gets squares bordering the "_squareHash" in 4 directions. can filter friends/enemies only.

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