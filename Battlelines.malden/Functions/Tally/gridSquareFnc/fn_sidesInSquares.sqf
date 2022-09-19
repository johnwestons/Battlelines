// Author:         [P] Tally (https://github.com/Tally-1)
// Comissioned by: Great Ape Gaming
// Description:    Takes an array of "square-hashMaps" and returns which sides are present.
//                 ReturnValue can be: [west, east]

params["_squareArr"];
private _sides = [];

{
	private _side = [_x] call frontL_fnc_squareDominantSide;
	if(typeName _side == "SIDE")
	then{_sides pushBackUnique _side;};
	
} forEach _squareArr;

_sides;