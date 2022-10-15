params ["_posArr"];


private _selectNextPos = { 
	params ["_sortedArr", "_previousPositions"];
	private _justStarted = count _previousPositions < 3;
	private _ending = count _sortedArr < 3;
	if(/*_justStarted or _ending*/true)exitWith{_sortedArr#0};

	// private _currentPos = _previousPositions#(count _previousPositions-1);
	// private _previousPos = _previousPositions#(count _previousPositions-2);

	private _avgPos = [_previousPositions] call Tcore_fnc_avgPos;
	private _nextPos = ([[_sortedArr#0, _sortedArr#1], [], {_avgPos distance _x }, "ASCEND"] call BIS_fnc_sortBy)#0;

	// private _dirToNext = _currentPos getDir _nextPos;
	// private _dirToAfterNext = _currentPos getDir _nextPos;
	// private _dirToPrevious = _currentPos getDir _previousPos;

	_nextPos;

};



private _getNearestXexcluded = { 
	params ["_pos", "_posArr", "_previousPositions"];
	private _eligble = _posArr select {!(_x in _previousPositions)};
	private _sortedArr = ([_eligble, [], {_pos distance _x }, "ASCEND"] call BIS_fnc_sortBy);
	private _nextPos = [_sortedArr, _previousPositions] call _selectNextPos;

	private _newPos = _nextPos;
	_newPos;
};



private _end = _posArr#(count _posArr-1);
private _pos = _posArr#0;
private _newArr = [];

{
	private _newPos = [_pos, _posArr, _newArr] call _getNearestXexcluded;
	if(_newPos isEqualTo _end)
	exitWith{_newArr pushBackUnique _newPos;};//start and endingPoints are inserted before calling this function, 
	_newArr pushBackUnique _newPos;           //hence the last pos in the original array is also the last position of the
	_pos = _newPos;                           //line.
} forEach _posArr;




_newArr;