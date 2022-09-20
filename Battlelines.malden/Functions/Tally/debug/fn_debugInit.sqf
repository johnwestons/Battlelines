// Author:         [P] Tally (https://github.com/Tally-1)
// Comissioned by: Great Ape Gaming
// Description:    This function is for debugging and testing new functions located in 
//                 DevFile.sqf by pressing numpad 1, pressing numpad 2 will recompile every 
//                 function located in CFG functions and reinitialize the flow from start.
//                 Useful for when you make minor changes to funtions that have already
//                 been precompiled.
//                 set FrontL_debug (in fn_initFrontLines.sqf) to false to avoid this.



waituntil {isTouchingGround player;};

  execVM 'Functions\Tally\DevFile.sqf';

  (findDisplay 46) displayAddEventHandler 
  ["KeyDown", "
        private _Pressed = false;
        if ((_this # 1) == 79) then {execVM 'Functions\Tally\DevFile.sqf'; _Pressed = true};
        if ((_this # 1) == 80) then {
          hint 'reCompiling...'; 
          [5] call BIS_fnc_recompile; 
          _Pressed = true;
          };
  _Pressed"];

true;