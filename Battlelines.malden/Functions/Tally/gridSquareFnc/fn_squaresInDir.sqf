// Author:         [P] Tally (https://github.com/Tally-1)
// Comissioned by: Great Ape Gaming
// Description:    Gets all squares in a zone along a trajectory. 
//                 See fn_gridSquares.sqf and fn_createZone.sqf for more info

params ["_zone", "_startPos", "_dir"];
	private _zoneRad = _zone get "radius";
	private _allGridSquares = _zone get "gridSquares";
	private _distNextPos = _zoneRad / 10;
    private _searchPos = _startPos;
	private _gridSquares = [];

	for "_I" from 1 to 20
	do{
		private _gridSquare = [_searchPos, _allGridSquares] call frontL_fnc_nearestGridSquare;
		
		if!(isNil "_gridSquare")then{
		_gridSquares pushBackUnique _gridSquare;
		};
		
		_searchPos = [_searchPos#0,_searchPos#1,_dir,_distNextPos] call Tcore_fnc_sinCosPos;
	};


_gridSquares;