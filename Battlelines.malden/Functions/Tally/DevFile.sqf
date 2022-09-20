systemChat "devFile found";


// Author:         [P] Tally (https://github.com/Tally-1)
// Description:    This file is used for loading / testing new functions,
//                 essentially my electronic scribble-block.

/************************************Functions under construction************************/
frontL_fnc_sinCosPos = { 
private _zValue = 0;
params ["_pos", "_Dir", "_Distance", "_zValue"];

private _OrigX = _pos#0;
private _Origy = _pos#1;
Private _NewX = ((sin _Dir) * _Distance) + _OrigX;
Private _Newy = ((cos _Dir) * _Distance) + _OrigY;

Private _newPos = [_NewX,_NewY, _zValue];

_newPos;
};

////////////////////////////////////////////////////

frontL_fnc_filledSquarePosArr = { 
private _posCount = 100;
private _zValue = 0;
private _includeWaterPos = false;

params [
	"_Center", 
	"_Size", 
	"_posCount",
	"_zValue",
	"_includeWaterPos"
	];
private _iterationDistance	=  _Size / 10;
private _grid = [];

private _startPos 	= 	[
							(_Center#0) - (_Size / 2),
							(_Center#1) - (_Size / 2),
							 _Center#2
						];

_startPos = [_startPos, 45, (_iterationDistance * 0.75)] call frontL_fnc_sinCosPos;

private _pos = _startPos;
private _Counter = 1;
private _maxCount = round (_posCount / 10);
// private _restartCount = _maxCount+1;

//production Loop
for "_I" from 1 to _posCount do{

if(_Counter > _maxCount)
then{
        _Counter = 1;
		_Pos = 	[
                    _startPos#0,
                    (_pos#1) + _iterationDistance,
                    _pos#2
                ];
    };

//only include positions on land. (can be adjusted using param _includeWaterPos) 
if(_includeWaterPos || (!surfaceIsWater _pos))then{_grid pushBack _pos;};

_pos = 	[
			(_pos # 0) + _iterationDistance,
			(_pos # 1),
			1.5
		];

_Counter = (_Counter + 1);
};

_grid;
};


SquarePosArr = { 
private _posCount = 100;
private _zValue = 0;
private _includeWaterPos = false;
params [
	"_Center", 
	"_Size", 
	"_posCount",
	"_zValue",
	"_includeWaterPos"
	];

private _bottomLeft    = [_center, 225, (_Size * 0.7071)] call frontL_fnc_sinCosPos;
private _topLeft       = [_center, 315, (_Size * 0.7071)] call frontL_fnc_sinCosPos;
private _cToCdistance  = _bottomLeft distance2D _topLeft;

private _positions   = [];
private _axisCount   = round(_posCount / 10);
private _posDistance = (_cToCdistance / _axisCount);

private _yAxis = [_bottomLeft, _topLeft, (_axisCount-2)] call frontL_fnc_straightPosArr;

{
	private _westPos = _x;
	private _eastPos = [_westPos, 90, _cToCdistance] call frontL_fnc_sinCosPos;
	private _newPositions = [_westPos, _eastPos, (_axisCount-2), true, _zValue] call frontL_fnc_straightPosArr;
	_positions append _newPositions;
} forEach _yAxis;

_positions = _positions select {(_includeWaterPos || (!surfaceIsWater _X))};

_positions;
};





/************************************Init actions***************************************/
private _testMarkers = (allMapMarkers select {"testMarker" in _x});
{deleteMarker _x} forEach _testMarkers;

private _battleZoneMarker =  (allMapMarkers select {"frontL" in _x && {"battleZone" in _x}})#0;

private _pos = markerPos _battleZoneMarker;
private _xY  = markerSize _battleZoneMarker; //Returns half the x/y value (https://community.bistudio.com/wiki/getMarkerSize)
private _radius = selectMax _xY *2;
private _dir = markerDir _battleZoneMarker;

private _baseGrid = [_pos, _radius, 300, 0, false] call SquarePosArr;
private _battleGrid = _baseGrid inAreaArray _battleZoneMarker;

private _J = 0;
{
	private _marker = [_x, "testMarker"] call frontL_fnc_dotMarker;
	// sleep 0.1;
	// _marker setMarkerText (str _J);
	_J=_J+1;
} forEach _battleGrid;

// private _baseGrid = [_pos, _radius,300] call SquarePosArr;







/************************************Code Snippets / scribble************************************************/
/*

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