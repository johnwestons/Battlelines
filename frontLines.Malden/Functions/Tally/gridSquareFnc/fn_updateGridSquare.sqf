// Author:         [P] Tally (https://github.com/Tally-1)
// Comissioned by: Great Ape Gaming
// Description:    _squareHash represents a single square in a zone (see fn_createZone.sqf), it is of the
//                 dataType "hashMap" and contains relevant data such as marker-name and occupier.

params["_squareHash", "_unitsInArea", "_zone"];
// private _pos = _squareHash get "position";
private _marker = _squareHash get "marker";
private _gridSquares = _zone get "gridSquares";
private _previousOccupier = _squareHash get "previousOccupier";
private _currentOccupier = _squareHash get "occupier";
private _timeSinceLastOccupation = time - (_squareHash get "lastOccupied");
// private _neighbors = [_gridSquares, _squareHash] call frontL_fnc_squareNeighbors;
// private _owner = _squareHash get "occupier";
// private _enemySquares =  _neighbors select {!(([_x] call frontL_fnc_squareDominantSide) == _owner)};
// private _friendlySquares =  _neighbors select {!(_x in _enemySquares)};
private _inGridUnits = _unitsInArea inAreaArray _marker;

private _sidesPresent = [];


if(count _inGridUnits > 0)
then{
		{
			_sidesPresent pushBackUnique (side _x);
			_squareHash set ["lastOccupied", time];
			
		} forEach _inGridUnits;
};

private _newOccupier = objNull;
if(count _sidesPresent == 1)then{_newOccupier = _sidesPresent#0;};
if(count _sidesPresent > 1)then{_newOccupier = sideEnemy;};

// if(_timeSinceLastOccupation > 20
// &&{(count _inGridUnits) < 1
// &&{(count _enemySquares) > (count _friendlySquares)}})
// then{_newOccupier = ((_enemySquares)#0) get "occupier";};


if((typeName _newOccupier == "SIDE"))
then{
		_squareHash set ["previousOccupier", _currentOccupier];
		_squareHash set ["occupier", _newOccupier];
};




private _dominantSide = _newOccupier;


if(!(typeName _dominantSide == "SIDE"))
then{_dominantSide = _currentOccupier;};


private _color = [_dominantSide] call frontL_fnc_mrkColorFromSide;
_marker setMarkerColor _color;

/*This will be edited once we have an agreement on the logic */


