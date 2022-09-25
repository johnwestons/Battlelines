// Author:         [P] Tally (https://github.com/Tally-1)
// Comissioned by: Great Ape Gaming
// Description:    Initializes the BattleZone and spawns an updating loop. The loop frequency
//                 can be adjusted with the "FrontL_updateTimer" value.

if(!isServer)exitWith{};

FrontL_showUnitMarkers = false;
FrontL_debug = true;
FrontL_updateTimer = 3;
FrontL_lineTimer = 20;
frontL_gridSquareSize = 100;

//shorter function-name for ease of writing
if(isNil "fDbgMsg")then{fDbgMsg = frontL_fnc_debugMessage;};

if(FrontL_debug)then{[]spawn frontL_fnc_debugInit};
// sleep 1;

[] spawn frontL_fnc_execInit;

true;