// Author:         [P] Tally
// Author links:   https://github.com/Tally-1 , https://thehartgen.web.app/projects/ , https://www.fiverr.com/hartgen_dev/script-anything-you-can-think-of-in-arma-3
// Comissioned by: Great Ape Gaming
// Description:    Called by "fn_allConnectingSquares.sqf", gets squares of the same color as the 
//                 _squareHash marker, that has a border with it.
//                 pushes these squares into the hash used in the call.

params["_connectedSquares", "_squareHash", "_gridSquares", "_wantedSide"];

_connectedSquares pushBackUnique _squareHash;
private _index = (count _connectedSquares)-1;
private _newNeighbors = [_gridSquares, _squareHash, false, true] call frontL_fnc_getNeighbors;
_newNeighbors = _newNeighbors select {markerColor (_squareHash get "marker") == markerColor (_x get "marker")};
_connectedSquares insert [_index, _newNeighbors, true];

_connectedSquares;