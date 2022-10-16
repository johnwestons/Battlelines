// Author:         [P] Tally
// Author links:   https://github.com/Tally-1 , https://thehartgen.web.app/projects/ , https://www.fiverr.com/hartgen_dev/script-anything-you-can-think-of-in-arma-3
// Comissioned by: Great Ape Gaming
// Description:    Determines on which side(s) a square is facing the enemy.

params ["_squareHash"];
private _neighbors = _squareHash get "neighbors";
private _pos = _squareHash get "position";
private _marker = _squareHash get "marker";
private _color  = markerColor _marker;
private _pointsOfContact = [];
private _validColors = ["colorblufor", "coloropfor", "coloryellow"];

{
	private _validMarker = (!isNil "_y") && { _Y != "" };
	private _enemy = (_validMarker 
	               && {((markerColor _y) != _color)
				   && {(toLower(markerColor _y)) in _validColors
				   && {markerShape _y == "RECTANGLE"}}});

	if(_enemy)
	then{
			private _enemyPos = markerPos _y;
			private _frontLinePos = [_pos, _enemyPos] call Tcore_fnc_getMidPoint;
			_pointsOfContact pushBack _frontLinePos;
	};
	
} forEach _neighbors;

_pointsOfContact;