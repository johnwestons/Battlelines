// Author:         [P] Tally
// Author links:   https://github.com/Tally-1 , https://thehartgen.web.app/projects/ , https://www.fiverr.com/hartgen_dev/script-anything-you-can-think-of-in-arma-3
// Comissioned by: Great Ape Gaming
// Description:    Deletes positions from a posArr that are inside a marker.

params ["_battleGrid", "_marker"];

private _excludedPositions = _battleGrid inAreaArray _marker;
_battleGrid = (_battleGrid select {!(_x in _excludedPositions)});


_battleGrid;