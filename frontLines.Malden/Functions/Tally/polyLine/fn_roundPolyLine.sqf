// Author:         [P] Tally (https://github.com/Tally-1)
// Comissioned by: Great Ape Gaming
// Description:    Draws a round polyLine marker, the marker-name needs to be provided as a param.

private _lineColor = "ColorBlack";
params["_lineMarker", "_center", "_radius", "_lineColor"];


private _360DegPosArr = [_center, _radius, 360] call Tcore_fnc_get360Positions;
private _360Path = [_360DegPosArr] call frontL_fnc_pathFromPosArr;

_lineMarker setMarkerPolyline _360Path;
_lineMarker setMarkerColor _lineColor;