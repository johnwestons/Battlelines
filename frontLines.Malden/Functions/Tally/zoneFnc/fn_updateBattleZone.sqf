// Author:         [P] Tally
// Author links:   https://github.com/Tally-1 , https://thehartgen.web.app/projects/ , https://www.fiverr.com/hartgen_dev/script-anything-you-can-think-of-in-arma-3
// Comissioned by: Great Ape Gaming
// Description:    Updates the grid as well as the frontLine.

params["_battleZone", "_updateFrontLine"];
private _pos = _battleZone get "center";

private _zoneSize = (_battleZone get "radius") * 0.7;
private _unitsInZone = [_pos, _zoneSize] call frontL_fnc_AiObjectsInArea;
[_battleZone, _unitsInZone] call frontL_fnc_updateGrid;


if(_updateFrontLine)
then{
		private _script = [frontL_BattleZone] call frontL_fnc_defineIslandAreas;
		[_battleZone] call frontL_fnc_updateFrontLine;
};

if(FrontL_showUnitMarkers)
then{
		[_battleZone, _unitsInZone] call frontL_fnc_zoneUnitMarkers;
};
