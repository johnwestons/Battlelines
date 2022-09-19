// Author:         [P] Tally (https://github.com/Tally-1)
// Comissioned by: Great Ape Gaming
// Description:    Updates all gridSquares in a zone, for more info see fn_createZone.sqf

params ["_zone", "_zoneUnits"];
private _gridSquares = _zone get "gridSquares";

{
	[_x, _zoneUnits] call frontL_fnc_updateGridSquare;
	
} forEach _gridSquares;

true;