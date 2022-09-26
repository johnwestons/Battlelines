// Author:         [P] Tally
// Author links:   https://github.com/Tally-1 , https://thehartgen.web.app/projects/ , https://www.fiverr.com/hartgen_dev/script-anything-you-can-think-of-in-arma-3
// Comissioned by: Great Ape Gaming
// Description:    Used in the init-function of the BattleZone, adds 4 neighbors to the _squareHash.

params ["_squareHash", "_gridSquares"];
private _neighbors = createHashMap;
private _marker = _squareHash get "marker";
private _center = _squareHash get "position";
private _size = selectMax(markerSize _marker);
private _radius = frontL_gridSquareSize;

private _topPos = [_center, 0, _radius] call frontL_fnc_sinCosPos;
private _rightPos = [_center, 90, _radius] call frontL_fnc_sinCosPos;
private _bottomPos = [_center, 180, _radius] call frontL_fnc_sinCosPos;
private _leftPos = [_center, 270, _radius] call frontL_fnc_sinCosPos;

private _topNeighbor = ([_topPos, _gridSquares, _radius, false] call frontL_fnc_nearestGridSquare) get "marker";
private _rightNeighbor = ([_rightPos, _gridSquares, _radius, false] call frontL_fnc_nearestGridSquare) get "marker";
private _bottomNeighbor = ([_bottomPos, _gridSquares, _radius, false] call frontL_fnc_nearestGridSquare) get "marker";
private _leftNeighbor = ([_leftPos, _gridSquares, _radius, false] call frontL_fnc_nearestGridSquare) get "marker";

if(isNil "_topNeighbor")then{_topNeighbor = ""};
if(isNil "_rightNeighbor")then{_rightNeighbor = ""};
if(isNil "_bottomNeighbor")then{_bottomNeighbor = ""};
if(isNil "_leftNeighbor")then{_leftNeighbor = ""};

_neighbors set ["top",   _topNeighbor];
_neighbors set ["right", _rightNeighbor];
_neighbors set ["left",   _bottomNeighbor];
_neighbors set ["bottom", _leftNeighbor];

_squareHash set ["neighbors", _neighbors];

_neighbors;