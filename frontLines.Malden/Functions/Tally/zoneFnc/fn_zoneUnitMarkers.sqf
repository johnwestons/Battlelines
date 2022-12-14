// Author:         [P] Tally
// Author links:   https://github.com/Tally-1 , https://thehartgen.web.app/projects/ , https://www.fiverr.com/hartgen_dev/script-anything-you-can-think-of-in-arma-3
// Comissioned by: Great Ape Gaming
// Description:    Updates all unit-markers in the battleZone zone.

params ["_zone", "_zoneUnits"];
private _markerList = _zone get "unitMarkers";
private _pos = _zone get "center";
private _markerCount = count _markerList;
private _unitCount = count _zoneUnits;
private _countDiff = _markerCount - _unitCount;

if(_markerCount > _unitCount)
then{_markerList = [_markerList, _countDiff] call frontL_fnc_removeUnitMarkers;};

if(_markerCount < _unitCount)
then{_markerList = [_markerList, _countDiff, _pos] call frontL_fnc_addUnitMarkers;
};

private _j = 0;

{
	private _unit = _x;
	private _pos = getPos _unit;
	private _marker = (_markerList#_j);
	private _color = [(side _unit)] call frontL_fnc_mrkColorFromSide;

	if(!isNil "_marker")
	then{
		_marker setMarkerColorLocal _color;
		_marker setMarkerPos _pos;
	};
	

	_j=_j+1;
} forEach _zoneUnits;

_zone set ["unitMarkers", _markerList];

true;