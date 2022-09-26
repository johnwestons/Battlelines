// Author:         [P] Tally
// Author links:   https://github.com/Tally-1 , https://thehartgen.web.app/projects/ , https://www.fiverr.com/hartgen_dev/script-anything-you-can-think-of-in-arma-3
// Comissioned by: Great Ape Gaming
// Description:    Detects all ai-objects of the sides allowed within an area defined 
//                 by a center and a radius. Agents are weeded out by checking for group.

private _allowedSides = [east, west];
private _radius = 200;
params ["_pos", "_radius", "_allowedSides"];

private _nearObjects = _pos nearEntities ["LAND", _radius];
private _relevantObjects = [];

{
	private _group = (group _x);
	private _hasGroup = !isNil "_group";
	private _alive = alive _x;
	private _allowedSide = (side _x) in _allowedSides;

	if(_hasGroup
	&&{_alive
	&&{_allowedSide}})
	then{_relevantObjects pushBack _x};

} forEach _nearObjects;

_relevantObjects;