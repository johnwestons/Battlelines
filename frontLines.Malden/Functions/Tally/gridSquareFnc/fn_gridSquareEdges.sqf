params ["_squareHash"];

private _edges = createHashMap;
private _marker = _squareHash get "marker";
private _size = selectMax(markerSize _marker);
private _dir = 0;
private _center = _squareHash get "position";
private _keyValue = "top";

for"_I" from 1 to 8 do {
private _pos = [_center, _dir, _size] call frontL_fnc_sinCosPos;
_edges set [_keyValue, _pos];

switch (_i) do {
	case 1: { _keyValue = "topRight"; };
	case 2: { _keyValue = "right"; };
	case 3: { _keyValue = "bottomRight"; };
	case 4: { _keyValue = "bottom"; };
	case 5: { _keyValue = "bottomLeft"; };
	case 6: { _keyValue = "left"; };
	case 7: { _keyValue = "topLeft"; };
};

private _dir = _dir+45;
_edges;
};
