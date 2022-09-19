// Author:         [P] Tally (https://github.com/Tally-1)
// Comissioned by: Great Ape Gaming
// Description:    Returns the side of that has ownership of a given square

params["_squareHash"];

private _dominantSide = _x get "occupier";
if(!(typeName _dominantSide == "SIDE"))
then{_dominantSide = _x get "previousOccupier";};

_dominantSide;