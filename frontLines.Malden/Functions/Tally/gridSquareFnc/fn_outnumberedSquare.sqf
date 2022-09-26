// Author:         [P] Tally
// Author links:   https://github.com/Tally-1 , https://thehartgen.web.app/projects/ , https://www.fiverr.com/hartgen_dev/script-anything-you-can-think-of-in-arma-3
// Comissioned by: Great Ape Gaming
// Description:    Determines if a _squareHash has more enemy than friendly squares around it.

params ["_squareHash"];
private _marker = _squareHash get "marker";
private _color  = markerColor _marker;
private _adjacentMarkers = (_squareHash get "neighbors");
private _friends = 0;
private _enemies = 0;

{
	private _isMarker = (!isNil "_y") && { _Y != "" };
	if(_isMarker)
	then{
		private _nColor = (markerColor _y);
		if(_nColor == _color)
		then{_friends=_friends+1;}
		else{_enemies=_enemies+1;}
	};	
} forEach _adjacentMarkers;

private _outNumbered = _enemies > _friends;

_outNumbered;