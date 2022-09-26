// Author:         [P] Tally
// Author links:   https://github.com/Tally-1 , https://thehartgen.web.app/projects/ , https://www.fiverr.com/hartgen_dev/script-anything-you-can-think-of-in-arma-3
// Comissioned by: Great Ape Gaming
// Description:    Called by "fn_defineIslandAreas.sqf" and itself (in case the first iteration returned a square on a isolated area).

private _lastIndex = 0;
params ["_zone", "_gridSquares", "_wantedSide", "_lastIndex"];
private _countAll = (count _gridSquares -1);
private _startSquare = _gridSquares # _lastIndex;

private _connectedSquares = [_startSquare, _zone, _wantedSide] call frontL_fnc_allConnectingSquares;
// if(isNil "_connectedSquares")exitWith{systemChat "notFound";};

if((count _connectedSquares)>= round(_countAll/2))
exitWith{_startSquare};

_lastIndex=_lastIndex+1;

if(_lastIndex >= _countAll)
exitWith{};

([_zone, _gridSquares, _wantedSide, _lastIndex] call frontL_fnc_getStartSquare);
