params ["_zone"];
private _gridSquares = _zone get "gridSquares";
private _bluPositions = [];
private _redPositions = [];

{
	private _owner = [_x] call frontL_fnc_squareDominantSide;
	private _pos = _x get "position";
	if(_owner == WEST)
	then{_bluPositions pushBack _pos}
	else{_redPositions pushBack _pos};
	
} forEach _gridSquares;

private _bluPos = [_bluPositions] call Tcore_fnc_avgPos;
private _redPos = [_redPositions] call Tcore_fnc_avgPos;

[_bluPos, _redPos];