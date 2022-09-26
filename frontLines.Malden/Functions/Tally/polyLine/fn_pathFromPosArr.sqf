// Author:         [P] Tally
// Author links:   https://github.com/Tally-1 , https://thehartgen.web.app/projects/ , https://www.fiverr.com/hartgen_dev/script-anything-you-can-think-of-in-arma-3
// Comissioned by: Great Ape Gaming
// Description:    Takes an array of positions and turns it into a path
//                 used by the setMarkerPolyline function. a minimum of 2 positions are needed.
//                 https://community.bistudio.com/wiki/setMarkerPolyline
params["_posArr"];

//add debugMsgs here
if!(typeName _posArr == "ARRAY") exitWith{};
if(count _posArr < 2) exitWith{};

private _path = [];

{
	_path append [_x#0, _x#1];
} forEach _posArr;

_path;