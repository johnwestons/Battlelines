params ["_squareArr"];
private _positions = [];

{
	private _pointsOfContact = [_x] call frontL_fnc_squareEnemyPOC;
	_positions append _pointsOfContact;
} forEach _squareArr;

_positions;