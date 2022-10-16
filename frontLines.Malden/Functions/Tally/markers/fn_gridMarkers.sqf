// Author:         [P] Tally
// Author links:   https://github.com/Tally-1 , https://thehartgen.web.app/projects/ , https://www.fiverr.com/hartgen_dev/script-anything-you-can-think-of-in-arma-3
// Comissioned by: Great Ape Gaming
// Description:    Takes a pos-arr and creates square markers on each position, of the size defined by params

params [
	"_positions", 
	"_markerSize", 
	"_name"
	];

private _markerNames = [];
private _type = "Border";
if(FrontL_debug)
then{_type = "SolidBorder";};

{
	private _markerName =
	[
		_x, 
		_markerSize,
		"SolidBorder",
		"ColorOrange",
		0.7,
		_name
	] call frontL_fnc_SquareMarker;
	_markerNames pushBack _markerName;
} forEach _positions;

_markerNames;