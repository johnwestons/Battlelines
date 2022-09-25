params ["_marker"];

((frontL_BattleZone get "gridSquares") select {(_x get "marker") == _marker})#0;