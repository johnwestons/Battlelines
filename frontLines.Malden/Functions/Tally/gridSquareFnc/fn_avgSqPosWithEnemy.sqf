params ["_squareHash","_gridSquares"];
private _positions = [(_squareHash get "position")];
private _enemySquares = [_gridSquares, _squareHash] call frontL_fnc_getNeighbors;
private _enemyPositions = [_enemySquares] call frontL_fnc_squarePositions;
{_positions pushBack _X} forEach _enemyPositions;

private _avgPos = [_positions] call Tcore_fnc_avgPos;

_avgPos;