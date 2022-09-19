// Author:         [P] Tally (https://github.com/Tally-1)
// Comissioned by: Great Ape Gaming
// Description:    changes the position for a singular point on the frontline

params [
	"_centerPos",
	"_eastDir",
	"_zone"
	];

private _radius = _zone get "radius";
private _adjustedPos = _centerPos;
private _startPos = [_centerPos#0,_centerPos#1, (_eastDir -180), (_radius * 0.3)] call Tcore_fnc_sinCosPos;
private _endPos   = [_centerPos#0,_centerPos#1, _eastDir, (_radius * 0.3)] call Tcore_fnc_sinCosPos;
private _trajectoryPosArr = [_startPos, _endPos, 60] call frontL_fnc_straightPosArr;

private _squareArr = [_zone, _startPos, _eastDir] call frontL_fnc_squaresInDir;
private _sidesOnTrajectory = [_squareArr] call frontL_fnc_sidesInSquares;
private _sideCount = count _sidesOnTrajectory;

if(_sideCount == 2
&&{!(_squareArr isEqualTo [])})
then{
	_adjustedPos = [_centerPos, _radius, _squareArr, _trajectoryPosArr] call frontL_fnc_frontLinePosBetween2Sides;
};

if(_sideCount == 1)
then{

};



_adjustedPos;