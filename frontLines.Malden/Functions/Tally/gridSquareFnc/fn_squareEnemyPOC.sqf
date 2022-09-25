params ["_squareHash"];
private _neighbors = _squareHash get "neighbors";
private _pos = _squareHash get "position";
private _marker = _squareHash get "marker";
private _color  = markerColor _marker;
private _pointsOfContact = [];


{
	private _isMarker = (!isNil "_y") && { _Y != "" };
	private _enemy = (_isMarker && {(markerColor _y) != _color});

	if(_enemy)
	then{
			private _enemyPos = markerPos _y;
			private _frontLinePos = [_pos, _enemyPos] call Tcore_fnc_getMidPoint;
			_pointsOfContact pushBack _frontLinePos;
	};
	
} forEach _neighbors;

_pointsOfContact;