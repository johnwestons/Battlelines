params ["_zone"];
private _gridSquares = (_zone get "gridSquares");
private _frontLineSquares =  _gridSquares select {([_x] call frontL_fnc_isFrontLineSquare)};

_frontLineSquares