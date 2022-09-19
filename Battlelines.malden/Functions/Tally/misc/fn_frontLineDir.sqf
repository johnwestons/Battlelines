// Author:         [P] Tally (https://github.com/Tally-1)
// Comissioned by: Great Ape Gaming
// Description:    Takes 2-3 positions and returns the average direction between them.

params ["_sidePositions"];
private _dir = 0;

if(count _sidePositions < 2)exitWith{_dir};

_dir = ((_sidePositions#0) getDir (_sidePositions#1));

if(count _sidePositions == 2)
exitWith{_dir};

_dir = [[_sidePositions#1, _sidePositions#2], _sidePositions#0] call Tcore_fnc_avgRelDir;

_dir