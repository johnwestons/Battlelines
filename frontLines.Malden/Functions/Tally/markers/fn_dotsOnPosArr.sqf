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