// Author:         [P] Tally
// Author links:   https://github.com/Tally-1 , https://thehartgen.web.app/projects/ , https://www.fiverr.com/hartgen_dev/script-anything-you-can-think-of-in-arma-3
// Comissioned by: Great Ape Gaming
// Description:    gets the middle index of an array.

private _floor = false;
params ["_array", "_floor"];
if(_array isEqualTo [])exitWith{-1};

private _iRange = (count _array)-1;
if(_iRange == 0)exitWith{0};

private _mid = (_iRange) / 2;
if(_mid == (round _mid))exitWith{_mid};

if(_floor)exitWith{(floor _mid)};

(ceil _mid);