// Author:         [P] Tally
// Author links:   https://github.com/Tally-1 , https://thehartgen.web.app/projects/ , https://www.fiverr.com/hartgen_dev/script-anything-you-can-think-of-in-arma-3
// Comissioned by: Great Ape Gaming
// Description:    Gets a _squareHash from the BattleZone by using the markerName attached to said _squareHash.

params ["_marker"];

((frontL_BattleZone get "gridSquares") select {(_x get "marker") == _marker})#0;