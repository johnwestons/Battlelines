// Author:         [P] Tally
// Author links:   https://github.com/Tally-1 , https://thehartgen.web.app/projects/ , https://www.fiverr.com/hartgen_dev/script-anything-you-can-think-of-in-arma-3
// Comissioned by: Great Ape Gaming
// Description:    Takes an array of marker-names and deletes a defined amount of markers
//                 as well as updating and returning the array.


params ["_markers", "_deleteCount"];
_deleteCount = _deleteCount-1;
for "_i" from 0 to _deleteCount do{
	deleteMarker (_markers # 0);
	_markers deleteAt 0;
};
_markers;