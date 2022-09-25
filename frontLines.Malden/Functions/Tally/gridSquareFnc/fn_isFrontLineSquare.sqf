params ["_squareHash"];
private _marker = _squareHash get "marker";
private _color  = markerColor _marker;
private _adjacentMarkers = _squareHash get "neighbors";
private _allColors = [_color];
private _isolated = (_x get "island");
private _borderEnemy = false;
{
	
	private _isEnemy = (!isNil "_y") 
                     && { _Y != "" 
					 && {(markerColor _y) != _color
					 &&{!(([_y] call frontL_fnc_squareFromMarker) get "island")}}};
	if(_isEnemy)
	then{_borderEnemy = true;};
	
} forEach _adjacentMarkers;

private _isFrontLine = _borderEnemy && {! _isolated};


_isFrontLine;