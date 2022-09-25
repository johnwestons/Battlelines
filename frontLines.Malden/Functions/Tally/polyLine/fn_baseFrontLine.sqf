// Author:         [P] Tally (https://github.com/Tally-1)
// Comissioned by: Great Ape Gaming
// Description:    Returns an array of positions in the direction of the frontline.

params[
	"_sidePositions", //posArr
	"_frontLineDir", //direction (integer)
	"_radius",      //size in meters
	"_zone"        //for info see fn_createZone.sqf
	];
private _anchorPoints = _zone get "anchorPositions";


//the base, may be skewed outside of the zone
private _midPos = [_sidePositions#0, _sidePositions#1] call Tcore_fnc_getMidpoint;
private _lineStart = [_midPos#0, _midPos#1, (_frontLineDir -90), _radius] call Tcore_fnc_sinCosPos;
private _lineEnd = [_midPos#0, _midPos#1, (_frontLineDir +90), _radius] call Tcore_fnc_sinCosPos;


//adjust the  extremes to fit within the zone.
_lineStart = [_lineStart, _anchorPoints] call Tcore_fnc_nearestPos;
_lineEnd = [_lineEnd, _anchorPoints] call Tcore_fnc_nearestPos;

//get an array of positions between start and end.
private _baseLine = [_lineStart, _lineEnd, 30] call frontL_fnc_straightPosArr;

_baseLine;