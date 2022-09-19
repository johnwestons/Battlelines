// Author:         [P] Tally (https://github.com/Tally-1)
// Comissioned by: Great Ape Gaming
// Description:    Boolean function, checks if a square is owned by a particular size
params["_squareHash", "_side"];
private _owner = [_squareHash] call frontL_fnc_squareDominantSide;

if(!(typeName _owner == "SIDE"))exitWith{false};
if!(_owner == _side)exitWith{false};
true;