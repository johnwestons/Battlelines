// Author:         [P] Tally
// Author links:   https://github.com/Tally-1 , https://thehartgen.web.app/projects/ , https://www.fiverr.com/hartgen_dev/script-anything-you-can-think-of-in-arma-3
// Comissioned by: Great Ape Gaming
// Description:    Gets all points of contact on the frontline.

params ["_squareArr"];
private _positions = [];

{
	private _pointsOfContact = [_x] call frontL_fnc_squareEnemyPOC;
	_positions append _pointsOfContact;
} forEach _squareArr;

_positions;