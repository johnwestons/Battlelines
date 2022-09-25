private _wantedSide = blufor;
params ["_zone"];
private _gridSquares = _zone get "gridSquares";

private _bluSquares = _gridSquares select {markerColor (_X get "marker") == "colorBLUFOR"};
private _redSquares = _gridSquares select {markerColor (_X get "marker") == "colorOPFOR"};


private _bluStartSquare = [_zone, _bluSquares, blufor] call frontL_fnc_getStartSquare;
private _redStartSquare = [_zone, _redSquares, opfor] call frontL_fnc_getStartSquare;

if(isNil "_bluStartSquare")
exitWith{systemChat "No blufor squares found"};

if(isNil "_redStartSquare")
exitWith{systemChat "No opfor squares found"};

private _bluMain = [_bluStartSquare, _zone] call frontL_fnc_allConnectingSquares;
private _redMain = [_redStartSquare, _zone, opfor] call frontL_fnc_allConnectingSquares;



if(isNil "_bluMain" || isNil "_redMain")
exitWith{systemChat "main undefined"};

if((count _bluMain == count _bluSquares)
&&{count _redMain == count _redSquares})
exitWith{
	{
		_x set ["island", false];
		
	} forEach _gridSquares;
	[];
};


private _islandSquares = [];
{
		private _island = !(_x in _bluMain || _x in _redMain);
		if(_island)
		then{
			_x set ["island", true];
			_islandSquares pushBackUnique _x;
			};
		
		
} forEach _gridSquares;
	true;

_islandSquares;