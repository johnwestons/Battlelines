// Author:         [P] Tally (https://github.com/Tally-1)
// Comissioned by: Great Ape Gaming
// Description:    Takes an array of units/vehicles and extracts the sides (west/east/guer).
params["_unitArr"];
private _sides = [];

{
	_sides pushBackUnique (side _x);
	
} forEach _unitArr;

_sides;