// Author:         [P] Tally (https://github.com/Tally-1)
// Comissioned by: Great Ape Gaming
// Description:    Takes a pos-arr and creates square markers on each position of the size defined by params

params [
	"_positions", 
	"_markerSize", 
	"_name"
	];

private _markerNames = [];

{
	private _markerName =
	[
		_x, 
		_markerSize,
		"SOLID",
		"ColorOrange",
		0.7,
		_name
	] call frontL_fnc_SquareMarker;
	_markerNames pushBack _markerName;
} forEach _positions;

_markerNames;