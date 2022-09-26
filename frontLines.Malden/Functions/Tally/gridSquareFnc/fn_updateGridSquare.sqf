// Author:         [P] Tally
// Author links:   https://github.com/Tally-1 , https://thehartgen.web.app/projects/ , https://www.fiverr.com/hartgen_dev/script-anything-you-can-think-of-in-arma-3
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
private _timedOut = _timeSinceLastOccupation > 30;
private _inGridUnits = _unitsInArea inAreaArray _marker;
private _empty = (count _inGridUnits < 1);
private _outNumbered = [_squareHash] call frontL_fnc_outnumberedSquare;
private _enemySide = (([_gridSquares, _squareHash, true] call frontL_fnc_getNeighbors)#0)get "occupier";
private _sidesPresent = [];

private _enemySwallow = (_empty 
                      &&{(_outNumbered || _squareHash get "island")
					  &&{_timedOut
					  &&{!isNil "_enemySide"}}});

if!(_empty)
then{
		{
			_sidesPresent pushBackUnique (side _x);
			_squareHash set ["lastOccupied", time];
			
		} forEach _inGridUnits;
};

private _newOccupier = objNull;
if(_enemySwallow)
then{
        _newOccupier = _enemySide;
		_squareHash set ["lastOccupied", time];
	};
if(count _sidesPresent == 1)then{_newOccupier = _sidesPresent#0;};
if(count _sidesPresent > 1)then{_newOccupier = sideEnemy;};


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

/*This will be edited once we have an agreement on the capture logic */


