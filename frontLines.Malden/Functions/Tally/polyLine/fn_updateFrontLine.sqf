// Author:         [P] Tally
// Author links:   https://github.com/Tally-1 , https://thehartgen.web.app/projects/ , https://www.fiverr.com/hartgen_dev/script-anything-you-can-think-of-in-arma-3
// Comissioned by: Great Ape Gaming
// Description:    Takes the point of contact of every blufor-square on the frontline 
//                 and draws a line from point to point using the setMarkerPolyline command.

params ["_zone"];

private _center = _zone get "center";
private _radius = (_zone get "radius")*0.7;
private _frontLine = _zone get "frontLine";
private _lineColor = "ColorBlack";
//get positions on squares that are not isolated from the main section and has at least one enemy adjacent
private _frontLineSquares = ([_zone] call frontL_fnc_frontLineSquares) select {(_x get "occupier")== blufor};
private _sidePositions = [_zone, _frontLineSquares] call frontL_fnc_gridSidePos;

private _frontLineDir = ((_sidePositions#0) getDir (_sidePositions#1));
private _frontPos = (_sidePositions#2);
private _basePosArr = ([_frontPos, _frontLineDir, _radius, _zone] call frontL_fnc_baseFrontLine) inAreaArray (_zone get "marker");



//get the positions connecting to enemy territory
private _frontlinePositions = [_frontlineSquares] call frontL_fnc_frontLinePOC;

//insert start and end-points of the frontLine (see baseFrontLine)
_frontlinePositions insert [0, [(_basePosArr#0)], true];
_frontlinePositions pushBackUnique (_basePosArr#((count _basePosArr)-1));

// sort the positions in proper order, to avoid zig-zag and jumping steps
_frontlinePositions= [_frontlinePositions, _sidePositions] call frontL_fnc_formatFrontlinePosArr;

private _linePath = [_frontlinePositions] call frontL_fnc_pathFromPosArr;

_frontLine setMarkerPolyline _linePath;
// [_frontLine,_linePath] remoteExecCall ['setMarkerPolyline',0];
_frontLine setMarkerColor _lineColor;
_frontLine setMarkerSize [5,5];


true;