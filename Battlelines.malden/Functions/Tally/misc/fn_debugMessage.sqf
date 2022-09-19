// Author:         [P] Tally (https://github.com/Tally-1)
// Comissioned by: Great Ape Gaming
// Description:    Displays a message and logs it to the RPT file when FrontL_debug is set to true.

params["_text", "_displayType"];

private _signature = "FrontLines  -->  ";

private _returnVal =
[_text, FrontL_debug, FrontL_debug, _displayType, _signature]
call Tcore_fnc_debugMessage;

_returnVal;