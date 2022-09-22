// Author:         [P] Tally (https://github.com/Tally-1)
// Comissioned by: Great Ape Gaming
// Description:    Takes the base front-line pos-array and adjusts each position in relation to which 
//                 squares on the grid are taken

params [
	"_basePosArr", 
	"_frontLineDir", 
	"_radius", 
	"_zone", 
	"_sidePositions"
	];

private _center = _zone get "center";
private _westPos = _sidePositions # 0;
private _eastPos = _sidePositions # 1;

//westDir refers to the direction held by bluFor (not actually west)
private _westDir = _center getDir _westPos;
private _eastDir = _center getDir _eastPos;

private _adjustedPosArr = [];


{
	private _newPos = ([_x, _eastDir, _zone] call frontL_fnc_adjustFrontLinePos);
	_adjustedPosArr pushBack _newPos;//may be one or more positions wrapped in an array
} forEach _basePosArr;

_adjustedPosArr;
