// Author:         [P] Tally
// Author links:   https://github.com/Tally-1 , https://thehartgen.web.app/projects/ , https://www.fiverr.com/hartgen_dev/script-anything-you-can-think-of-in-arma-3
// Comissioned by: Great Ape Gaming
// Description:    Determines whether or not a _squareHash is located next to the enemy "main-section".

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