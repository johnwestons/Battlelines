// Author:         [P] Tally (https://github.com/Tally-1)
// Comissioned by: Great Ape Gaming
// Description:    Creates a "dot-marker" at the position and color defined by the params.
//                 the postFix should be unique.

private _color = "ColorBlack";
private _size = 1;
private _text = "";
params[
	"_pos",
	"_postFix",
	"_size",
	"_color",
	"_text"
	];

if(isNil "_postFix")
then{_postFix = str _pos};

private _markername = [_pos, " dot_", _postFix] joinString "";
private _marker = createMarker [_markername, _pos];
_marker setMarkerTextLocal _text;
_marker setMarkerTypeLocal "hd_dot";
_marker setMarkerSize [_size,_size];


_marker;