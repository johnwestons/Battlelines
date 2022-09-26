// Author:         [P] Tally
// Author links:   https://github.com/Tally-1 , https://thehartgen.web.app/projects/ , https://www.fiverr.com/hartgen_dev/script-anything-you-can-think-of-in-arma-3
// Comissioned by: Great Ape Gaming
// Description:    Displays a message and logs it to the RPT file when FrontL_debug is set to true.
private _displayType = 1;
params["_text", "_displayType"];

private _signature = "FrontLines  -->  ";

private _returnVal =
[_text, FrontL_debug, FrontL_debug, _displayType, _signature]
call Tcore_fnc_debugMessage;

_returnVal;