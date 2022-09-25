private _updateTimer = time + FrontL_updateTimer;
private _heavyFncTimer = time + FrontL_lineTimer;
sleep 3;
while {true}do{

if(time>_updateTimer)
then{
		private _time = time;

		if(time>_heavyFncTimer)
		exitWith{
			
			private _script = [frontL_BattleZone, true] spawn frontL_fnc_updateBattleZone;
			waitUntil{scriptDone _script};

			_heavyFncTimer = time + FrontL_lineTimer;
			_updateTimer = time + FrontL_updateTimer;
			systemChat (["battleZone and frontLine updated in ", (time - _time), " S."] joinString "");
		};


		private _script = [frontL_BattleZone, false] spawn frontL_fnc_updateBattleZone;
		waitUntil{scriptDone _script};
	
		systemChat (["zone updated in ", (time - _time), " S."] joinString "");

		_updateTimer = time + FrontL_updateTimer;
	};



sleep 1;

};