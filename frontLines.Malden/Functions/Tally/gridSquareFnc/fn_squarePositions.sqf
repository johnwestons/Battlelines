// Author:         [P] Tally
// Author links:   https://github.com/Tally-1 , https://thehartgen.web.app/projects/ , https://www.fiverr.com/hartgen_dev/script-anything-you-can-think-of-in-arma-3
// Comissioned by: Great Ape Gaming
// Description:    Takes an array of _squareHash and returns their position in an array.

params ["_gridSquares"];
private _positions = [];
{_positions pushBackUnique (_x get "position");} forEach _gridSquares;

_positions