// Author:         [P] Tally
// Author links:   https://github.com/Tally-1 , https://thehartgen.web.app/projects/ , https://www.fiverr.com/hartgen_dev/script-anything-you-can-think-of-in-arma-3
// Comissioned by: Great Ape Gaming
// Description:    Looks for markers with the conditions defined below, make sure you only place 2, size and color does not matter, only the name.
//                 Is used to divide the battleZone in 2.

params["_battleZoneMarker"]; 
private _condition = { "frontL" in _x 
                       && {("opforSide" in _x) 
				       || ("bluforSide" in _x)}
                     };

private _sideMarkers = (allMapMarkers select _condition);


_sideMarkers;