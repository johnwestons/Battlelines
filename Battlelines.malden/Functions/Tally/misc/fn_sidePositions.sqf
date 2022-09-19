// Author:         [P] Tally (https://github.com/Tally-1)
// Comissioned by: Great Ape Gaming
// Description:    Defines the average position of all sides (west, east, guer) within a radius
//                 The outPut will be as follows [west, east, independent] (currently the rest 
//                 of the system only allows for east and west. independent is there only as a 
//                 possible future plugin)

params ["_unitArr", "_radius"];

private _westUnits = [];
private _eastUnits = [];
private _indyUnits = [];

{
	if(side _x == west)
	then{_westUnits pushBackUnique _x;};

	if(side _x == east)
	then{_eastUnits pushBackUnique _x;};

	if(side _x == independent)
	then{_indyUnits pushBackUnique _x;};

} forEach _zoneUnits;


private _westAvgPos = [0,0,0];
private _eastAvgPos = [0,0,0];
private _indyAvgPos = [0,0,0];


if(count _westUnits > 0)
then{
		private _unit = _westUnits#0;
		_westAvgPos = [_unit, _radius] call Tcore_fnc_clusterPos;
};

if(count _eastUnits > 0)
then{
		private _unit = _eastUnits#0;
		_eastAvgPos = [_unit, _radius] call Tcore_fnc_clusterPos;
};

if(count _indyUnits > 0)
then{
		private _unit = _indyUnits#0;
		_indyAvgPos = [_unit, _radius] call Tcore_fnc_clusterPos;
};

private _sidePositions = [];

{
	if!(_x isEqualTo [0,0,0])
	then{_sidePositions pushBack _x};
} forEach [_westAvgPos, _eastAvgPos, _indyAvgPos];

_sidePositions;