// Author:         [P] Tally (https://github.com/Tally-1)
// Comissioned by: Great Ape Gaming
// Description:    Creates a square marker according to the definitions found in the params.

private _color = "ColorBlack";
private _brush = "BORDER";
private _alpha = 1;
private _postFix = '';
params[
	"_pos", 
	"_radius", 
	"_brush", 
	"_color", 
	"_alpha",
	"_postFix"
	];

private _markerName  = [_pos, " squareMarker_", _postFix] joinString "";
private _marker = createMarker [_markerName, _pos];

_markerName setMarkerShapeLocal "RECTANGLE";
_markerName setMarkerBrushLocal _brush;
_markerName setMarkerSizeLocal  [_radius, _radius];
_markerName setMarkerColorLocal _color;
_markerName setMarkerAlpha _alpha;

_markerName