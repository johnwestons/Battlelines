// Author:         [P] Tally (https://github.com/Tally-1)
// Comissioned by: Great Ape Gaming
// Description:    _gridHash represents a single square in a zone (see fn_createZone.sqf), it is of the
//                 dataType "hashMap" and contains relevant data such as marker-name and occupier.

params["_gridHash", "_unitsInArea"];
// private _pos = _gridHash get "position";
private _marker = _gridHash get "markerName";

private _previousOccupier = _gridHash get "previousOccupier";
private _currentOccupier = _gridHash get "occupier";


private _inGridUnits = _unitsInArea inAreaArray _marker;

private _sidesPresent = [];


if(count _inGridUnits > 0)
then{
		{
			_sidesPresent pushBackUnique (side _x);
			_gridHash set ["lastOccupied", time];
			
		} forEach _inGridUnits;
};

private _newOccupier = objNull;
if(count _sidesPresent == 1)then{_newOccupier = _sidesPresent#0;};
if(count _sidesPresent > 1)then{_newOccupier = sideEnemy;};

if((typeName _newOccupier == "SIDE"))
then{
		_gridHash set ["previousOccupier", _currentOccupier];
};

_gridHash set ["occupier", _newOccupier];

private _timeSinceLastOccupation = time - (_gridHash get "lastOccupied");
private _dominantSide = _newOccupier;


if(!(typeName _dominantSide == "SIDE"))
then{_dominantSide = _currentOccupier;};

if(!(typeName _dominantSide == "SIDE"))
then{_dominantSide = _previousOccupier;};

private _color = [_dominantSide] call frontL_fnc_mrkColorFromSide;
_marker setMarkerColor _color;

if(_timeSinceLastOccupation > 180)
then{
		_gridHash set ["occupier", objNull];
		_gridHash set ["previousOccupier", objNull];
};