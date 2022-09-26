// Author:         [P] Tally
// Author links:   https://github.com/Tally-1 , https://thehartgen.web.app/projects/ , https://www.fiverr.com/hartgen_dev/script-anything-you-can-think-of-in-arma-3
// Comissioned by: Great Ape Gaming
// Description:    Creates "dot-markers" at the amount specified, the positions 
//                 can be set by using the marker-names in the returned array.

params ["_markers", "_addCount", "_pos"];

//inverting negative number in order to get the correct iteration-amount.
if(_addCount < 0)then{_addCount = (_addCount - (_addCount*2));};

_addCount = _addCount-1;

for "_i" from 0 to _addCount do {
	private _postFix = random 1000000;
	private _marker = [_pos,_postFix] call frontL_fnc_dotMarker;
	_markers pushBack _marker;
};

_markers;