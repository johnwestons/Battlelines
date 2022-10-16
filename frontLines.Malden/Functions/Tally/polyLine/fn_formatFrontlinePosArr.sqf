params ["_posArr", "_sidePositions"];

private _pathCrossSquare = {  
params ["_startPos", "_targetPos"];
private _midPos = [_startPos, _targetPos] call Tcore_fnc_getMidPoint;
private _radius = frontL_gridSquareSize / 6;
private _markers = (frontL_BattleZone get "gridMarkers") select {(markerPos _x distance2D _midPos)<_radius};
if(count _markers > 0)exitWith{true;};
false;
};

private _selectFirstPos = { 
params ["_sortedArr", "_previousPositions"];
private _bluPos = _sidePositions#0;
private _redPos = _sidePositions#1;
private _centerPos = _sidePositions#2;

_sortedArr#0;
};


private _selectNextPos = { 
	params ["_sortedArr", "_previousPositions"];
	private _nextPos = _sortedArr#0;
	if(count _previousPositions == 0)exitWith{_nextPos;};
	if(count _sortedArr == 1)        exitWith{_nextPos;};
	if(count _previousPositions == 1)exitWith{[_sortedArr] call _selectFirstPos};

	private _currentPos = _previousPositions#(count _previousPositions-1);
	private _pathJump = [_currentPos, _nextPos] call _pathCrossSquare;
	if!(_pathJump)exitWith{_nextPos;};

    private _maxDistance = frontL_gridSquareSize;
	private _nonJumpPos = _sortedArr select {(!([_currentPos, _X] call _pathCrossSquare)) 
	                                     && {//(_currentPos distance2D _x)<_maxDistance
										 true}};
	if(count _nonJumpPos == 0)exitWith{};
	private _nextPos = ([_nonJumpPos, [], {_currentPos distance _x }, "ASCEND"] call BIS_fnc_sortBy)#0;

	_nextPos;
};



private _getNearestXexcluded = { 
	params ["_pos", "_posArr", "_previousPositions"];
	private _eligble = _posArr select {!(_x in _previousPositions)};
	private _sortedArr = ([_eligble, [], {_pos distance _x }, "ASCEND"] call BIS_fnc_sortBy);
	private _nextPos = [_sortedArr, _previousPositions] call _selectNextPos;

	if(isNil '_nextPos')exitWith{};
	_nextPos;
};



private _end = _posArr#(count _posArr-1);
private _pos = _posArr#0;
private _newArr = [];
private _i = 0;
private _errorText = 'line could not be completed';

{
	private _newPos = [_pos, _posArr, _newArr] call _getNearestXexcluded;
	private _nil = isNil '_newPos';
	if(_nil)exitWith{_errorText call fDbgMsg};
	if((! _nil) && {_newPos isEqualTo _end})
	exitWith{_newArr pushBackUnique _newPos;};//start and endingPoints are inserted before calling this function, 
	                                          //hence the last pos in the original array is also the last position of the line.
	if!(_nil)
	then{
		_newArr pushBackUnique _newPos; 
	    _pos = _newPos; 
	};
	                          

	
} forEach _posArr;

if(FrontL_debug)
then{
	{
        private _mrk = [_x, nil, 0.35, 'colorGreen',(str _i)] call frontL_fnc_dotMarker; 
	    frontL_DebugMarkers pushBack _mrk;
		_i=_i+1;
    } forEach _newArr;

};
    


_newArr;