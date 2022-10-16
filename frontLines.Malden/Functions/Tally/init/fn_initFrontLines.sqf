// Author:         [P] Tally
// Author links:   https://github.com/Tally-1 , https://thehartgen.web.app/projects/ , https://www.fiverr.com/hartgen_dev/script-anything-you-can-think-of-in-arma-3
// Comissioned by: Great Ape Gaming
// Description:    Sets global-variables and calls the init-process.(server only).

if(!isServer)exitWith{};

FrontL_showUnitMarkers = false;
FrontL_debug = true;
FrontL_updateTimer = 3;
FrontL_lineTimer = 3;
frontL_gridSquareSize = 100;
frontL_gridSquareAlpha = 0.3;

//shorter function-name for ease of writing
if(isNil "fDbgMsg")then{fDbgMsg = frontL_fnc_debugMessage;};

if(FrontL_debug)then{[]spawn frontL_fnc_debugInit};

[] spawn frontL_fnc_execInit;

true;