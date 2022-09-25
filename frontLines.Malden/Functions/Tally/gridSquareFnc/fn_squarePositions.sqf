params ["_gridSquares"];
private _positions = [];
{_positions pushBackUnique (_x get "position");} forEach _gridSquares;

_positions