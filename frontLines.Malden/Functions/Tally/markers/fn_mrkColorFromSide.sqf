// Author:         [P] Tally
// Author links:   https://github.com/Tally-1 , https://thehartgen.web.app/projects/ , https://www.fiverr.com/hartgen_dev/script-anything-you-can-think-of-in-arma-3
// Comissioned by: Great Ape Gaming
// Description:    returns a marker-color based on side.

params["_side"];
private _color = "ColorGrey";

if(isNil "_side")exitWith{_color};
if!(typeName _side == "SIDE")exitWith{_color};

switch (_side) do {
	case west:        {_color = "colorBLUFOR"; };
	case east:        {_color = "colorOPFOR"; };
	case independent: {_color = "colorIndependent"; };
	case sideEnemy:   {_color = "ColorYellow"; };
};

_color;