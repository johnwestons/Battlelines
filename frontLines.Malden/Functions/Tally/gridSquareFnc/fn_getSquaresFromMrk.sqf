params["_gridSquares", "_marker"];
private _condition = 
{
	private _positions = [_gridSquares] call frontL_fnc_squarePositions;
	_positions = _positions inAreaArray _marker;
	((_x get "position") in _positions)
};

private _inMrkSqs = _gridSquares select _condition;

_inMrkSqs;