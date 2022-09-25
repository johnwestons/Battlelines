systemChat "devFile found";


// Author:         [P] Tally (https://github.com/Tally-1)
// Description:    This file is used for loading / testing new functions,
//                 essentially my electronic scribble-block.

/************************************Functions under construction************************/

frontL_fnc_gridSqNeighbors = { 
params ["_squareHash", "_gridSquares"];
private _neighbors = createHashMap;
private _marker = _squareHash get "marker";
private _center = _squareHash get "position";
private _size = selectMax(markerSize _marker);
private _radius = frontL_gridSquareSize;

private _topPos = [_center, 0, _radius] call frontL_fnc_sinCosPos;
private _rightPos = [_center, 90, _radius] call frontL_fnc_sinCosPos;
private _bottomPos = [_center, 180, _radius] call frontL_fnc_sinCosPos;
private _leftPos = [_center, 270, _radius] call frontL_fnc_sinCosPos;

private _topNeighbor = ([_topPos, _gridSquares, _radius, false] call frontL_fnc_nearestGridSquare) get "marker";
private _rightNeighbor = ([_rightPos, _gridSquares, _radius, false] call frontL_fnc_nearestGridSquare) get "marker";
private _bottomNeighbor = ([_bottomPos, _gridSquares, _radius, false] call frontL_fnc_nearestGridSquare) get "marker";
private _leftNeighbor = ([_leftPos, _gridSquares, _radius, false] call frontL_fnc_nearestGridSquare) get "marker";

if(isNil "_topNeighbor")then{_topNeighbor = ""};
if(isNil "_rightNeighbor")then{_rightNeighbor = ""};
if(isNil "_bottomNeighbor")then{_bottomNeighbor = ""};
if(isNil "_leftNeighbor")then{_leftNeighbor = ""};

_neighbors set ["top",   _topNeighbor];
_neighbors set ["right", _rightNeighbor];
_neighbors set ["left",   _bottomNeighbor];
_neighbors set ["bottom", _leftNeighbor];

_squareHash set ["neighbors", _neighbors];

_neighbors;
};



frontL_fnc_gridSquareEdges = { 
params ["_squareHash"];

private _edges = createHashMap;
private _marker = _squareHash get "marker";
private _size = selectMax(markerSize _marker);
private _dir = 0;
private _center = _squareHash get "position";
private _keyValue = "top";

for"_I" from 1 to 8 do {
private _pos = [_center, _dir, _size] call frontL_fnc_sinCosPos;
_edges set [_keyValue, _pos];

switch (_i) do {
	case 1: { _keyValue = "topRight"; };
	case 2: { _keyValue = "right"; };
	case 3: { _keyValue = "bottomRight"; };
	case 4: { _keyValue = "bottom"; };
	case 5: { _keyValue = "bottomLeft"; };
	case 6: { _keyValue = "left"; };
	case 7: { _keyValue = "topLeft"; };
};

private _dir = _dir+45;
_edges;
};

};


frontL_fnc_battleZoneSideMarkers = {  
params["_battleZoneMarker"]; 
private _condition = { "frontL" in _x 
                       && {("opforSide" in _x) 
				       || ("bluforSide" in _x)}
                     };

private _sideMarkers = (allMapMarkers select _condition);


_sideMarkers;
};

frontL_fnc_getSquarePositions = { 
params["_gridSquares"];
private _positions = [];
{
	_positions pushBack (_x get "position");
	
} forEach _gridSquares;

_positions
};

frontL_fnc_getSquaresFromMrk = { 
params["_gridSquares", "_marker"];
private _condition = 
{
	private _positions = [_gridSquares] call frontL_fnc_getSquarePositions;
	_positions = _positions inAreaArray _marker;
	((_x get "position") in _positions)
};

private _inMrkSqs = _gridSquares select _condition;

_inMrkSqs;
};


frontL_fnc_assignGridSquareOwners = { 
params["_gridSquares", "_battleZoneMarker"]; 

private _radius = selectMax(markerSize _battleZoneMarker);
private _sideMarkers = [_battleZoneMarker] call frontL_fnc_battleZoneSideMarkers;
private _opforSidePos = markerPos((_sideMarkers select {"opfor" in _x})#0);
private _bluforSidePos = markerPos((_sideMarkers select {"blufor" in _x})#0);
private _center = [_opforSidePos, _bluforSidePos] call Tcore_fnc_getMidPoint;
private _bluDir = _center getDir _bluforSidePos;

private _bluCenter = [_center, _bluDir, _radius] call frontL_fnc_sinCosPos;
private _bluContainer = [_bluCenter, _radius] call frontL_fnc_SquareMarker;
_bluContainer setMarkerDir _bluDir;
private _bluSquares = [_gridSquares, _bluContainer] call frontL_fnc_getSquaresFromMrk;
private _opSquares = _gridSquares select {!(_x in _bluSquares)};
{
	(_x get "marker") setMarkerColor "ColorBlue";
	_x set ["occupier", bluFor];
	_x set ["previousOccupier", bluFor];
	_x set ["lastOccupied", time];
} forEach _bluSquares;

{
	(_x get "marker") setMarkerColor "ColorRed";
	_x set ["occupier", opfor];
	_x set ["previousOccupier", opfor];
	_x set ["lastOccupied", time];
} forEach _opSquares;


deleteMarker _bluContainer;
frontL_opforSidePos = _opforSidePos;
frontL_bluforSidePos = _bluforSidePos;
true;
};







frontL_fnc_stringifyHashMap = {
	params ["_hashMap"];
	private _stringHash = createHashMap;
	private _nonStringValues= ["SIDE","OBJECT"];

	{
		private _key = _X;
		private _value = _y;
		private _typeName = typeName _y;
		if(isNil "_value")then{_value = ""};
		if(isNil "_typeName")then{_value = ""};

		
		
		if(_typeName in _nonStringValues)
		then{_value = str _value};

		_stringHash set [_key, _value];

	} forEach _hashMap;

_stringHash;	
};


frontL_fnc_gridSidePos = { 
params ["_zone"];
private _gridSquares = _zone get "gridSquares";
private _bluPositions = [];
private _redPositions = [];

{
	private _owner = [_x] call frontL_fnc_squareDominantSide;
	private _pos = _x get "position";
	if(_owner == WEST)
	then{_bluPositions pushBack _pos}
	else{_redPositions pushBack _pos};
	
} forEach _gridSquares;

private _bluPos = [_bluPositions] call Tcore_fnc_avgPos;
private _redPos = [_redPositions] call Tcore_fnc_avgPos;

[_bluPos, _redPos]
};

frontL_fnc_getNeighbors = { 
private _enemiesOnly = false;
private _friendsOnly = false;
params["_gridSquares", "_squareHash", "_enemiesOnly", "_friendsOnly"];


private _neighbors = _squareHash get "neighbors";
private _markers = [];

{
	private _push = 
	if(!isNil "_y")
	then{_markers pushBack _y};
	
} forEach _neighbors;

_neighbors = _gridSquares select {(_x get "marker") in _markers};

if!(_enemiesOnly && _friendsOnly)exitWith{_neighbors};

if(_enemiesOnly)exitWith{
	private _owner = [_squareHash] call frontL_fnc_squareDominantSide;
	_neighbors = _neighbors select {!(([_x] call frontL_fnc_squareDominantSide) == _owner)};

	_neighbors;
};

if(_friendsOnly)exitWith{
	private _owner = [_squareHash] call frontL_fnc_squareDominantSide;
	_neighbors = _neighbors select {!(([_x] call frontL_fnc_squareDominantSide) == _owner)};

	_neighbors;
};
systemchat "fn_getNeighbors was not called correctly, returning all neighbors";

_neighbors;
};

frontL_fnc_gridSquareArrOwners = { 
params ["_gridSquares"];
private _owners = [];

{
	private _owner = [_x] call frontL_fnc_squareDominantSide;
	_owners pushBackUnique _owner;
	
} forEach _gridSquares;

_owners};


// frontL_fnc_frontlineSquares = { 
// params ["_gridSquares"];
// private _frontlineSquares = [];

// {
// 	private _neighbors = [_gridSquares, _x] call frontL_fnc_getNeighbors;
// 	private _owners = [_neighbors] call frontL_fnc_gridSquareArrOwners;
// 	_owners pushBackUnique ([_x] call frontL_fnc_squareDominantSide);
// 	if(count _owners > 1)
// 	then{_frontlineSquares pushBack _x};
	
// } forEach _gridSquares;

// _frontlineSquares};


frontL_fnc_findFirstSquares = { 
params ["_zone", "_basePosArr"];
private _gridSquares = _zone get "gridSquares";
private _startPos = _basePosArr#0;
private _endPos   = _basePosArr#((count _basePosArr)-1);
private _midPos   = [_startPos, _endPos] call Tcore_fnc_getMidPoint;
private _searchRadius = (_startPos distance2d _midPos);

private _startSquares = [_zone, _midPos, _searchRadius] call frontL_fnc_squaresInArea;

_startSquares};


frontL_fnc_squaresInArea = { 
params["_zone", "_pos", "_radius"];
private _gridSquares = _zone get "gridSquares";
private _size = _radius/2;
private _markers = (allMapMarkers select {"battleZoneGSQ" in _x});

_markers = _markers inAreaArray [_pos, _size, _size];
_gridSquares select {(_x get "marker") in _markers};
_gridSquares;
};



frontL_fnc_avgSqPosWithEnemy = { 
params ["_squareHash","_gridSquares"];
private _positions = [(_squareHash get "position")];
private _enemySquares = [_gridSquares, _squareHash] call frontL_fnc_getNeighbors;
private _enemyPositions = [_enemySquares] call frontL_fnc_squarePositions;
{_positions pushBack _X} forEach _enemyPositions;

private _avgPos = [_positions] call Tcore_fnc_avgPos;

_avgPos;
};







dotsOnPosArr = { 
private _text = "";
params["_posArr", "_text", "_postFix"];
private _markers = [];
private _j = 0;
{
	private _marker = [_x, "flmrk"] call frontL_fnc_dotMarker;
	_markers pushBack _marker;
	if(_text == "number")then{_marker setMarkerText (str _j)};
	_j=_j+1;
	if(canSuspend)then{sleep 0.1};
} forEach _posArr;

_markers};


frontL_fnc_actualFlPosArr = { 
params ["_zone", "_basePosArr"];
private _startSquares = [_zone, _basePosArr] call frontL_fnc_findFirstSquares;
private _frontlineSquares = [_startSquares] call frontL_fnc_frontlineSquares;
private _bluSquares = _frontlineSquares select {(_x get "occupier") == bluFor};
private _frontlinePositions = [_frontlineSquares] call frontL_fnc_squarePositions;
private _startPos = _basePosArr#0;
private _endPos = _basePosArr#((count _basePosArr)-1);
private _length = _startPos distance2D _endPos;
private _frontLineDir = _startPos getDir _endPos;
private _frontLineCenter = [_frontlinePositions] call Tcore_fnc_avgPos;
// [_frontlinePositions] call dotsOnPosArr;
private _lineStart = [_frontLineCenter, _frontLineDir, _length] call frontL_fnc_sinCosPos;
private _lineEnd = [_frontLineCenter, (_frontLineDir +180), _length] call frontL_fnc_sinCosPos;
private _baseLine = ([_lineStart, _lineEnd, 30] call frontL_fnc_straightPosArr)inAreaArray (_zone get "marker");
        _startPos = _baseLine#((count _baseLine)-1);
        _endPos = _baseLine#0;

private _adjustedLine = [_startPos];
{_adjustedLine pushBack ([_x, _startSquares] call frontL_fnc_avgSqPosWithEnemy);} forEach _bluSquares;
_adjustedLine pushBack _endPos;

_adjustedLine;};


frontL_fnc_squarePositions = { 
params ["_gridSquares"];
private _positions = [];
{_positions pushBackUnique (_x get "position");} forEach _gridSquares;

_positions};


frontL_fnc_isFrontLineSquare = { 
params ["_squareHash"];
private _marker = _squareHash get "marker";
private _color  = markerColor _marker;
private _adjacentMarkers = _squareHash get "neighbors";
private _allColors = [_color];
private _isolated = (_x get "island");
private _borderEnemy = false;
{
	
	private _isEnemy = (!isNil "_y") 
                     && { _Y != "" 
					 && {(markerColor _y) != _color
					 &&{!(([_y] call frontL_fnc_squareFromMarker) get "island")}}};
	if(_isEnemy)
	then{_borderEnemy = true;};
	
} forEach _adjacentMarkers;

private _isFrontLine = _borderEnemy && {! _isolated};


_isFrontLine;
};

frontL_fnc_squareFromMarker = { 
params ["_marker"];

((frontL_BattleZone get "gridSquares") select {(_x get "marker") == _marker})#0;
};

frontL_fnc_frontLineSquares = { 
params ["_zone"];
private _gridSquares = (_zone get "gridSquares");
private _frontLineSquares =  _gridSquares select {([_x] call frontL_fnc_isFrontLineSquare)};

_frontLineSquares};


// frontL_fnc_squareEnemyPOC = { 

// };


// frontL_fnc_frontLinePOC = { 

// };



// frontL_fnc_updateFrontLine = { 

// };


// frontL_fnc_outnumberedSquare = { 

// };








// frontL_fnc_getConnect = { 

// };


// frontL_fnc_allConnectingSquares = { 

// };


// frontL_fnc_getStartSquare = { 

// };


// frontL_fnc_defineIslandAreas = { 

// };
// frontL_fnc_initBattleZone = { 

// };



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



// frontL_fnc_updateBattleZone = { 


// };

/************************************Init / onKeyDown actions***************************************/
{deleteMarker _x} forEach (allMapMarkers select {"test1" in _x});
private _playerPos = getPos player;

private _westPos = [_playerPos, 270, 30] call frontL_fnc_sinCosPos;
private _eastPos = [_playerPos, 90, 30] call frontL_fnc_sinCosPos;
private _nortPos = [_playerPos, 0, 30] call frontL_fnc_sinCosPos;
private _midPos = [_westPos, _eastPos] call Tcore_fnc_getMidPoint;

private _cornerArr = [_westPos, _nortPos, _eastPos];

[_cornerArr, "number", "test1"] call dotsOnPosArr;

hint parsetext([
	"n->w`", (_nortPos getDir _westPos),"<br/>",
	"n->e`", (_nortPos getDir _eastPos),"<br/>",
	"w->n`", (_westPos getDir _nortPos),"<br/>",
	"e->n`", (_eastPos getDir _nortPos)
]joinstring"");

/************************************Code Snippets / scribble************************************************//*

frontL_fnc_getSquaresFromMrk = { 
params["_gridSquares", "_marker"];

// private _frontlinePositions = [_frontlineSquares] call frontL_fnc_squarePositions;
// private _testMarkers = (allMapMarkers select {"flmrk" in _x});
// {deleteMarker _x} forEach (allMapMarkers select {"flmrk" in _x});
// [_frontlinePositions, "number", "flmrk"] call dotsOnPosArr;

/*
Array
Boolean
Code
Config
Namespace
NaN
Number
Side
String
{
	private _marker = [_x, "testMarker"] call frontL_fnc_dotMarker;
	
} forEach _battleGrid;


{
	[_x, "testMarker"] call frontL_fnc_dotMarker;
	
} forEach _positions;


private _sqrs = [zone1, (getPos player), 96.7] call frontL_fnc_squaresInDir;
pth = [];
// copyToClipboard str _sqrs;
private _c = 1;
{
	private _pos = _x get "position";
	pth pushBack _pos;
	mrk1 = [_pos, nil,nil,nil,(str _c)] call frontL_fnc_dotMarker;

	_c=_c+1;
} forEach _sqrs;
pth = [pth] call frontL_fnc_pathFromPosArr;
mrk1 setMarkerPolyline pth;


private _anchorPosArr = zone1 get "anchorPositions";
private _j = 0;

{
	private _postFix = ["anchor",_j]joinString"";
	[_x, _postFix, 0.5] call frontL_fnc_dotMarker;
	_j=_j+1;
	
} forEach _anchorPosArr;
*/
// [targetPos, (_radius*0.7)] call frontL_fnc_roundMarker;
// copyToClipboard str zone1;
/*

//inDirRange
/*
frontL_fnc_SquareInOwnTerritory = { 
params["", "_centerPos", "_eastDir"];
private _pos = _squareHash get "position";
private _dirFromCenter = _centerPos getDir _pos;
private _inEasternTerritory = [_dirFromCenter, _eastDir] call Tcore_fnc_inDirRange;

};

*/


// {deleteMarker _x;} forEach dbgmrk;

// {
// 	private _mrk = [_x, nil, 0.4] call frontL_fnc_dotMarker;
// 	_mrk setMarkerColor "ColorGreen";
// 	dbgmrk pushBack _mrk;
	
// } forEach _adjustedPosArr;
/*

//how to draw a static line:
private _marker = createMarkerLocal ['_markerName', playerpos];
_marker setMarkerColorLocal "ColorBlack";
_marker setMarkerPolyline [
	playerPos#0,
    playerPos#1, 
	targetPos#0,
	targetPos#1
	];

private _mapCtrl = (findDisplay 12 displayCtrl 51);
_mapCtrl ctrlRemoveAllEventHandlers "Draw";

frontL_fnc_drawLine = {
	params['_handler', '_from', '_to'];
	private _color = [1,1,1,1];
	 _handler drawLine [
		_from,
		_to,
		_color
	];

};


private _drawStringCode = "[(_this select 0), LocPos, playerPos] call frontL_fnc_drawLine";
private _handler =
_mapCtrl ctrlAddEventHandler ["Draw","
	(_this select 0) drawLine [
		getPos player,
		[0,0,0],
		[0,1,1,1]
	];
"];
*/
/*
loopUpdate = false;
{deleteMarker _x} forEach allMapMarkers;
zone1 = nil;

dbgmrk = [];
frontL_zones = [];
playerPos = getPos player;
private _location = [playerPos] call Tcore_fnc_closestLocationName;
private _name = _location#0;
private _size = _location#2;
targetPos = _location#1;

systemChat str _size;

private _radius     = _size*2;

zone1 = [targetPos, _radius] call frontL_fnc_createZone;


sleep 1;
loopUpdate = true;




while{loopUpdate} do
{
	private _script = [zone1] spawn frontL_fnc_updateZone;
	waitUntil {sleep 1; scriptDone _script;  };
};
*//***********************************************************************************************/

systemChat 'DevFile read';