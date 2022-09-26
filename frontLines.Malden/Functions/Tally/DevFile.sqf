systemChat "devFile found";
// Author:         [P] Tally
// Author links:   https://github.com/Tally-1 , https://thehartgen.web.app/projects/ , https://www.fiverr.com/hartgen_dev/script-anything-you-can-think-of-in-arma-3 
// Description:    This file is used for loading / testing new functions,
//                 essentially my electronic scribble-block.

/************************************Functions under construction************************/


formatFrontlinePosArr = { 
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

};


/************************************Init / onKeyDown actions***************************************/
// {deleteMarker _x} forEach (allMapMarkers select {"test1" in _x});
// private _playerPos = getPos player;

// private _westPos = [_playerPos, 270, 30] call frontL_fnc_sinCosPos;
// private _eastPos = [_playerPos, 90, 30] call frontL_fnc_sinCosPos;
// private _nortPos = [_playerPos, 0, 30] call frontL_fnc_sinCosPos;
// private _midPos = [_westPos, _eastPos] call Tcore_fnc_getMidPoint;

// private _cornerArr = [_westPos, _nortPos, _eastPos];

// [_cornerArr, "number", "test1"] call frontL_fnc_dotsOnPosArr;

// hint parsetext([
// 	"n->w`", (_nortPos getDir _westPos),"<br/>",
// 	"n->e`", (_nortPos getDir _eastPos),"<br/>",
// 	"w->n`", (_westPos getDir _nortPos),"<br/>",
// 	"e->n`", (_eastPos getDir _nortPos)
// ]joinstring"");

/************************************Code Snippets / scribble************************************************//*


/***********************************************************************************************/

systemChat 'DevFile read';