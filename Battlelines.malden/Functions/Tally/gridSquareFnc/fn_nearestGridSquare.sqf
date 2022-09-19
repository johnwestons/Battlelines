// Author:         [P] Tally (https://github.com/Tally-1)
// Comissioned by: Great Ape Gaming
// Description:    Returns the nearest gridSquare from an array. 
//                 See fn_gridSquares.sqf and fn_createZone.sqf for more info

private _maxRadius = 20;
params ["_pos", "_squareArr", "_maxRadius"];


private _positions = [];
{_positions pushBack (_x get "position")} forEach _squareArr;
_positions = _positions select {(_x distance2d _pos) < _maxRadius};

private _nearestPos = [_pos, _positions] call Tcore_fnc_nearestPos;

private _gridHash = (_squareArr select {(_x get "position") isEqualTo _nearestPos})#0;

if(isNil "_gridHash")
then{
		private _midIndex = [_squareArr] call frontL_fnc_midArrayIndex;
		_gridHash = _squareArr # _midIndex;
};

_gridHash;