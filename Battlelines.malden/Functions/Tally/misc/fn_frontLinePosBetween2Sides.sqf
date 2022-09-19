// Author:         [P] Tally (https://github.com/Tally-1)
// Comissioned by: Great Ape Gaming
// Description:    tries to get a mid-point between opfor and blufor by checking ownership of squares.
//                 See fn_gridSquares.sqf and fn_createZone.sqf for more info.

params [
	"_centerPos", 
	"_radius", 
	"_squareArr", 
	"_trajectoryPosArr"
	];

private _westSquares = _squareArr select {([_X, west] call frontL_fnc_squareOwnedBy)};
private _eastSquares = _squareArr select {([_X, east] call frontL_fnc_squareOwnedBy)};

if(_westSquares isEqualTo [])exitWith{_centerPos};
if(_eastSquares isEqualTo [])exitWith{_centerPos};

private _westPos = ([_centerPos, _westSquares, _radius] call frontL_fnc_nearestGridSquare) get "position";
private _eastPos = ([_centerPos, _eastSquares, _radius] call frontL_fnc_nearestGridSquare) get "position";

private _midPos = [_westPos, _eastPos] call Tcore_fnc_getMidpoint;
private _adjustedPos = [_midPos, _trajectoryPosArr] call Tcore_fnc_nearestPos;

if(typeName _adjustedPos == "SCALAR")
then{_adjustedPos = _centerPos};

_adjustedPos;