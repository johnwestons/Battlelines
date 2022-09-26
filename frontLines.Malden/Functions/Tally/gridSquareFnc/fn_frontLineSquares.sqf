// Author:         [P] Tally
// Author links:   https://github.com/Tally-1 , https://thehartgen.web.app/projects/ , https://www.fiverr.com/hartgen_dev/script-anything-you-can-think-of-in-arma-3
// Comissioned by: Great Ape Gaming
// Description:    Gets all squares on the frontLine.

params ["_zone"];
private _gridSquares = (_zone get "gridSquares");
private _frontLineSquares =  _gridSquares select {([_x] call frontL_fnc_isFrontLineSquare)};

_frontLineSquares