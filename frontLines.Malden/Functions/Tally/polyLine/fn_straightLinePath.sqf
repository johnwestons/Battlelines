// Author:         [P] Tally
// Author links:   https://github.com/Tally-1 , https://thehartgen.web.app/projects/ , https://www.fiverr.com/hartgen_dev/script-anything-you-can-think-of-in-arma-3
// Comissioned by: Great Ape Gaming
// Description:    Creates a straight path for use in the polyLine function.
//                 Defines 2 positions on the left and right of the center, relative to the "_direction"

params ["_center", "_length", "_direction"];

private _pStart = [_center#0, _center#1, _direction, (_length * 0.7)] call Tcore_fnc_sinCosPos;
private _pEnd = [_center#0, _center#1, (_direction + 180), (_length * 0.7)] call Tcore_fnc_sinCosPos;
private _path = [[_pStart, _pEnd]] call frontL_fnc_pathFromPosArr;
_path;