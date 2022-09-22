// Author:         [P] Tally (https://github.com/Tally-1)
// Comissioned by: Great Ape Gaming
// Description:    This is a rudementary start for a moving frontLine
//                 in order to get the effect closer to what is shown in the YT-video (https://www.youtube.com/watch?v=VRd7tuuSEPY)
//                 more advanced and precise calculation is needed. Possible no doubt, but time-consuming.

params ["_zone", "_zoneUnits"];

private _center = _zone get "center";
private _radius = (_zone get "radius")*0.7;
private _frontLine = _zone get "frontLine";
private _lineColor = "ColorBlack";
private _activeSides = [_zoneUnits] call frontL_fnc_sidesInUnitArr;

//exit if there are less than 2 sides active in the area (aka. no fighting)
if((count _activeSides) == 1)
then{_lineColor = [(_activeSides#0)] call frontL_fnc_mrkColorFromSide;};
if((count _activeSides) < 2)
exitWith{[_frontLine, _center, _radius, _lineColor] call frontL_fnc_roundPolyLine;};

//average position for all units by side (should return 1 pos pr side).
private _sidePositions = [_zoneUnits, _radius] call frontL_fnc_sidePositions;

//dir between the 2-3 sidePositions.
private _frontLineDir = ([_sidePositions] call frontL_fnc_frontLineDir);
        _frontLineDir = [_frontLineDir] call Tcore_fnc_formatDir;

//create an array of positions in the correct angle, then adjust them according to held territory
private _basePosArr = [_sidePositions, _frontLineDir, _radius, _zone] call frontL_fnc_baseFrontLine;
private _adjustedPosArr = [_basePosArr, _frontLineDir, _radius, _zone, _sidePositions] call frontL_fnc_adjustFrontLine;

private _linePath = [_adjustedPosArr] call frontL_fnc_pathFromPosArr;

_frontLine setMarkerPolyline _linePath;
_frontLine setMarkerColor _lineColor;


true;