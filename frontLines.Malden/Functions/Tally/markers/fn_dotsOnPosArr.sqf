// Author:         [P] Tally
// Author links:   https://github.com/Tally-1 , https://thehartgen.web.app/projects/ , https://www.fiverr.com/hartgen_dev/script-anything-you-can-think-of-in-arma-3
// Comissioned by: Great Ape Gaming
// Description:    Takes an array of positions and draws a dot on each position.

private _text = "";
params["_posArr", "_text", "_postFix"];
private _markers = [];
private _j = 0;
{
	private _marker = [_x, "flmrk"] call frontL_fnc_dotMarker;
	_markers pushBack _marker;
	if(_text == "number")then{_marker setMarkerText (str _j)};
	_j=_j+1;
	if(canSuspend)then{sleep 0.1};
} forEach _posArr;

_markers