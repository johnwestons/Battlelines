private _updateTimer = time + FrontL_updateTimer;
private _heavyFncTimer = /*time + 30*/(FrontL_updateTimer*5);
sleep 3;
while {true}do{

if(time>_updateTimer)
then{
		private _time = time;
		private _script = [frontL_BattleZone] spawn frontL_fnc_updateBattleZone;
		waitUntil{scriptDone _script};
		

		if(time>_heavyFncTimer)
		then{
			
			private _script = [frontL_BattleZone] spawn frontL_fnc_defineIslandAreas;
			waitUntil{scriptDone _script};
			_heavyFncTimer = time + (FrontL_updateTimer*5);
		};

		systemChat (["zone updated in ", (time - _time), " S."] joinString "");
		_updateTimer = time + FrontL_updateTimer;
	};



sleep 1;

};