params ["_position", "_radius", "_locationTypes"];
private _name = "";
private _pos  = [0,0,0];
private _size = 0;
{
    if ((text _x) isNotEqualTo "") 
	exitWith{
				_name = text _x; 
				_pos = locationPosition _x;
				_size = selectMax(size _x);
				
				_name};
} forEach nearestLocations [_position, _locationTypes, _Radius];

[_name, _pos, _size]