// Author:         [P] Tally
// Author links:   https://github.com/Tally-1 , https://thehartgen.web.app/projects/ , https://www.fiverr.com/hartgen_dev/script-anything-you-can-think-of-in-arma-3
// Comissioned by: Great Ape Gaming
// Description:    Checks the average position of all squares (divided by side) in order to determine "zones of influence".

params ["_zone", "_frontLineSquares"];
private _gridSquares = _zone get "gridSquares";
private _bluPositions = [];
private _redPositions = [];
private _frontLinePositions = [];

{
	private _frontLineSquare = _x in _frontLineSquares;
	private _owner = [_x] call frontL_fnc_squareDominantSide;
    private _pos = _x get "position";

    if!(_frontLineSquare)
	then{
          if(_owner == WEST)
          then{_bluPositions pushBack _pos}
          else{_redPositions pushBack _pos};
	}
	else{_frontLinePositions pushBack _pos};
} forEach _gridSquares;

//since the frontline bulges in and out the actual midPosition needs to be adjusted
//to the distance of the average frontlinePosition but in the direction of the closest
//side-position, otherwise the center will be off, increasing the chance of a buggy line.
private _bluPos = [_bluPositions] call Tcore_fnc_avgPos;
private _redPos = [_redPositions] call Tcore_fnc_avgPos;
private _frontLinePos = [_frontLinePositions] call Tcore_fnc_avgPos;
private _midPos = [_bluPos, _redPos] call Tcore_fnc_getMidPoint;

private _nearestToFront = ([[_bluPos, _redPos], [], {_frontLinePos distance _x }, "ASCEND"] call BIS_fnc_sortBy)#0;

private _frontLineDir = _midPos getDir _nearestToFront;
private _frontLineDist = (_midPos distance2D _frontLinePos)*1.5;
private _adjustedMidPos = [_midPos, _frontLineDir, _frontLineDist] call frontL_fnc_sinCosPos;


if(FrontL_debug)
then{

	
	private _mrk1 = [_bluPos, 'bluPos', 2, 'colorBlue', 'Blue avg pos'] call frontL_fnc_dotMarker;
	private _mrk2 = [_redPos, 'redPos', 2, 'colorRed', 'Red avg pos'] call frontL_fnc_dotMarker;
	private _mrk3 = [_midPos, 'redPos', 2, 'colorBlack', 'MidPoint'] call frontL_fnc_dotMarker;
	private _mrk4 = [_frontLinePos, nil, 2, 'colorBlack', 'frontLine'] call frontL_fnc_dotMarker;
	private _mrk5 = [_adjustedMidPos, nil, 2, 'colorBlack', 'adjustedMidPos'] call frontL_fnc_dotMarker;
	frontL_DebugMarkers append [_mrk1, _mrk2, _mrk3, _mrk4, _mrk5];
};

[_bluPos, _redPos, _adjustedMidPos];