params["_battleZoneMarker"]; 
private _condition = { "frontL" in _x 
                       && {("opforSide" in _x) 
				       || ("bluforSide" in _x)}
                     };

private _sideMarkers = (allMapMarkers select _condition);


_sideMarkers;