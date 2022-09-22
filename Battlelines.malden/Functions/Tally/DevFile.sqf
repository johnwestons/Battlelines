systemChat "devFile found";


// Author:         [P] Tally (https://github.com/Tally-1)
// Description:    This file is used for loading / testing new functions,
//                 essentially my electronic scribble-block.

/************************************Functions under construction************************/

frontL_fnc_gridSqNeighbors = { 
params ["_gridHash", "_gridSquares"];
private _neighbors = createHashMap;
private _marker = _gridHash get "marker";
private _center = _gridHash get "position";
private _size = selectMax(markerSize _marker);
private _radius = _size*2;

private _topPos = [_center, 0, _radius] call frontL_fnc_sinCosPos;
private _rightPos = [_center, 90, _radius] call frontL_fnc_sinCosPos;
private _bottomPos = [_center, 180, _radius] call frontL_fnc_sinCosPos;
private _leftPos = [_center, 270, _radius] call frontL_fnc_sinCosPos;

_neighbors set ["top", ([_topPos, _gridSquares, _size, false] call frontL_fnc_nearestGridSquare) get "marker"];
_neighbors set ["right", ([_rightPos, _gridSquares, _size, false] call frontL_fnc_nearestGridSquare) get "marker"];
_neighbors set ["left", ([_bottomPos, _gridSquares, _size, false] call frontL_fnc_nearestGridSquare) get "marker"];
_neighbors set ["bottom", ([_leftPos, _gridSquares, _size, false] call frontL_fnc_nearestGridSquare) get "marker"];

_gridHash set ["neighbors", _neighbors];

_neighbors;
};



frontL_fnc_gridSquareEdges = { 
params ["_gridHash"];

private _edges = createHashMap;
private _marker = _gridHash get "marker";
private _size = selectMax(markerSize _marker);
private _dir = 0;
private _center = _gridHash get "position";
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

// private _logicMarkerPositions = [];
// {_logicMarkerPositions pushBackUnique _x;} forEach _sideMarkers;
// _logicMarkerPositions = _logicMarkerPositions inAreaArray _battleZoneMarker;

// private _sideMarkers = (_sideMarkers select {(markerPos _x) in _logicMarkerPositions});

// systemchat str _sideMarkers;

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

private _inMrkSqs = _gridSquares select (_condition);

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

true;
};



frontL_fnc_initBattleZone = { 
_zone = createHashMap;

private _battleZoneMarker = (allMapMarkers select {"frontL" in _x && {"battleZone" in _x}})#0;//The "in" check is case-sensitive.

private _gridAndGridSquareSize = [_battleZoneMarker] call frontL_fnc_getBattleGrid;
private _battleGrid = _gridAndGridSquareSize#0;
private _squareRadius = _gridAndGridSquareSize#1;
private _markerSize = _squareRadius/2;
private _center = markerPos _battleZoneMarker;
private _radius = (selectMax (markerSize _battleZoneMarker)) *2;
// private _anchorPositions = [_center, (_radius*0.7), 360] call Tcore_fnc_get360Positions;
private _gridMarkers = [_battleGrid, _markerSize, "battleZoneGSQ"] call frontL_fnc_gridMarkers;
private _gridSquares = [_gridMarkers] call frontL_fnc_gridSquares;
private _frontLine = [_center, _radius, "battleZoneLine"] call frontL_fnc_drawFrontLine;
private _unitCount = 0;

[_gridSquares, _battleZoneMarker] call frontL_fnc_assignGridSquareOwners;

_zone set ["center", _center];
_zone set ["radius", _radius];
_zone set ["cellSize", _markerSize];
_zone set ["gridSquares", _gridSquares];
_zone set ["gridMarkers", _gridMarkers];
_zone set ["unitMarkers", []];
_zone set ["frontLine", _frontLine];
_zone set ["unitCount", _unitCount];


_zone;

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

frontL_fnc_updateBattleZone = { 
params["_battleZone"];
private _pos = _battleZone get "center";

private _zoneSize = (_battleZone get "radius") * 0.7;
private _unitsInZone = [_pos, _zoneSize] call frontL_fnc_AiObjectsInArea;
[_battleZone, _unitsInZone] call frontL_fnc_updateGrid;
// systemChat str (count _unitsInZone);

};

/************************************Init actions***************************************/
// private _testMarkers = (allMapMarkers select {"battleZoneGSQ" in _x});
// frontL_BattleZone = nil;
// {deleteMarker _x} forEach _testMarkers;



// private _stringHash = [frontL_BattleZone] call frontL_fnc_stringifyHashMap;
// copyToClipboard str _stringHash;

// private _baseGrid = [_pos, _radius,300] call SquarePosArr;







/************************************Code Snippets / scribble************************************************/
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
*/

systemChat 'DevFile read';