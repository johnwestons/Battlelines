// Author:         [P] Tally (https://github.com/Tally-1)
// Comissioned by: Great Ape Gaming
// Description:    Creates a round marker.

private _color = "ColorBlack";
private _brush = "BORDER";
params["_pos", "_radius", "_brush", "_color"];

private _markerName  = [(round((random 1) * 100000)), "_randomCircle"] joinString "";
private _marker = createMarker [_markerName, _pos];

_markerName setMarkerShapeLocal "ELLIPSE";
_markerName setMarkerBrushLocal _brush;
_markerName setMarkerSizeLocal  [_radius, _radius];
_markerName setMarkerColorLocal _color;
_markerName setMarkerAlpha 1;


_markerName