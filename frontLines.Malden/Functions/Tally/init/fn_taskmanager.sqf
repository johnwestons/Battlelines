// Author:         [P] Tally
// Author links:   https://github.com/Tally-1 , https://thehartgen.web.app/projects/ , https://www.fiverr.com/hartgen_dev/script-anything-you-can-think-of-in-arma-3
// Comissioned by: Great Ape Gaming
// Description:    Updates the battleZone on a timer that is set in "fn_initFrontLines.sqf".

private _updateTimer = time + FrontL_updateTimer;
private _heavyFncTimer = time + FrontL_lineTimer;
sleep 3;
while {true}do{

if(time>_updateTimer)
then{
		private _time = time;
		if(FrontL_debug)then{{deleteMarker _x;} forEach frontL_DebugMarkers};
		
		if(time>_heavyFncTimer)
		exitWith{
			
			[frontL_BattleZone, true] call frontL_fnc_updateBattleZone;

			_heavyFncTimer = time + FrontL_lineTimer;
			_updateTimer = time + FrontL_updateTimer;
			systemChat (["battleZone and frontLine updated in ", (time - _time), " S."] joinString "");
		};


		[frontL_BattleZone, false] call frontL_fnc_updateBattleZone;
	
		systemChat (["zone updated in ", (time - _time), " S."] joinString "");

		_updateTimer = time + FrontL_updateTimer;
	};



sleep 1;

};