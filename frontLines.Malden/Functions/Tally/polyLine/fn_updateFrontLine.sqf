// Author:         [P] Tally (https://github.com/Tally-1)
// Comissioned by: Great Ape Gaming
// Description:    This is a rudementary start for a moving frontLine
//                 in order to get the effect closer to what is shown in the YT-video (https://www.youtube.com/watch?v=VRd7tuuSEPY)
//                 more advanced and precise calculation is needed. Possible no doubt, but time-consuming.

params ["_zone"];

private _center = _zone get "center";
private _radius = (_zone get "radius")*0.7;
private _frontLine = _zone get "frontLine";
private _lineColor = "ColorBlack";
private _sidePositions = [_zone] call frontL_fnc_gridSidePos;
private _frontLineDir = ((_sidePositions#0) getDir (_sidePositions#1));

private _basePosArr = ([_sidePositions, _frontLineDir, _radius, _zone] call frontL_fnc_baseFrontLine) inAreaArray (_zone get "marker");

//get positions on squares that are not isolated from the main section and has at least one enemy adjacent
private _frontLineSquares = [_zone] call frontL_fnc_frontLineSquares;
_frontLineSquares = _frontLineSquares select {(_x get "occupier")== blufor};

//get the positions connecting to enemy territory
private _frontlinePositions = [_frontlineSquares] call frontL_fnc_frontLinePOC;

//insert start and end-points of the frontLine (see baseFrontLine)
_frontlinePositions insert [0, [(_basePosArr#0)], true];
_frontlinePositions pushBackUnique (_basePosArr#((count _basePosArr)-1));

// sort the positions in proper order, to avoid zig-zag and jumping steps
_frontlinePositions= [_frontlinePositions] call formatFrontlinePosArr;

private _linePath = [_frontlinePositions] call frontL_fnc_pathFromPosArr;

_frontLine setMarkerPolyline _linePath;
_frontLine setMarkerColor _lineColor;
_frontLine setMarkerSize [5,5];


true;