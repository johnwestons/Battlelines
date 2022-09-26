// Author:         [P] Tally
// Author links:   https://github.com/Tally-1 , https://thehartgen.web.app/projects/ , https://www.fiverr.com/hartgen_dev/script-anything-you-can-think-of-in-arma-3
// Comissioned by: Great Ape Gaming
// Description:    Returns the nearest gridSquare from an array. 
//                 See fn_gridSquares.sqf and fn_createZone.sqf for more info

private _maxRadius = 20;
private _returnMidIndex = true;
params ["_pos", "_squareArr", "_maxRadius", "_returnMidIndex"];


private _positions = [];
{_positions pushBack (_x get "position")} forEach _squareArr;
_positions = _positions select {(_x distance2d _pos) < _maxRadius};

private _nearestPos = [_pos, _positions] call Tcore_fnc_nearestPos;

private _gridHash = (_squareArr select {(_x get "position") isEqualTo _nearestPos})#0;

if(isNil "_gridHash"
&&{_returnMidIndex})
then{
		private _midIndex = [_squareArr] call frontL_fnc_midArrayIndex;
		_gridHash = _squareArr # _midIndex;
};


if(isNil "_gridHash")exitWith{};

_gridHash;