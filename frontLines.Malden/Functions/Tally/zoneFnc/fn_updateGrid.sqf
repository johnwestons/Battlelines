// Author:         [P] Tally
// Author links:   https://github.com/Tally-1 , https://thehartgen.web.app/projects/ , https://www.fiverr.com/hartgen_dev/script-anything-you-can-think-of-in-arma-3
// Comissioned by: Great Ape Gaming
// Description:    Updates all gridSquares in a zone, for more info see fn_createZone.sqf

params ["_zone", "_zoneUnits"];
private _gridSquares = _zone get "gridSquares";

{
	[_x, _zoneUnits, _zone] call frontL_fnc_updateGridSquare;
	
} forEach _gridSquares;

true;