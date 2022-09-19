systemChat "devFile found";


// Author:         [P] Tally (https://github.com/Tally-1)
// Comissioned by: Great Ape Gaming
// Description:

/************************************Functions under construction************************///The closest position held by east in the east-dir


/************************************Init actions***************************************/








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

/************************************Code Snippets************************************************/
/*

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


systemChat 'DevFile read';