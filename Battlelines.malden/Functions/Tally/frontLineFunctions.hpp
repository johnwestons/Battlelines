class frontL
	{
		class init
		{
			class initFrontLines {
									file = "Functions\Tally\init\fn_initFrontLines.sqf";
									postInit = 1;
								};
		}
        
		class debug
		{
			class debugMessage {file="Functions\Tally\debug\fn_debugMessage.sqf"};
			class debugInit {file = "Functions\Tally\debug\fn_debugInit.sqf";};
		}
        
		class polyLine
		{
			class straightLinePath {file = "Functions\Tally\polyLine\fn_straightLinePath.sqf";};
			class pathFromPosArr {file = "Functions\Tally\polyLine\fn_pathFromPosArr.sqf";};
			class roundPolyLine {file = "Functions\Tally\polyLine\fn_roundPolyLine.sqf";};
			class drawFrontLine {file = "Functions\Tally\polyLine\fn_drawFrontLine.sqf";};
			class updateFrontLine {file = "Functions\Tally\polyLine\fn_updateFrontLine.sqf";};
			class baseFrontLine {file = "Functions\Tally\polyLine\fn_baseFrontLine.sqf";};
			class adjustFrontLine {file = "Functions\Tally\polyLine\fn_adjustFrontLine.sqf";};
			class adjustFrontLinePos {file = "Functions\Tally\polyLine\fn_adjustFrontLinePos.sqf";};

		}

		class zoneFnc
		{
			class createZone {file = "Functions\Tally\zoneFnc\fn_createZone.sqf";};
			class updateGrid {file = "Functions\Tally\zoneFnc\fn_updateGrid.sqf";};
			class zoneUnitMarkers {file = "Functions\Tally\zoneFnc\fn_zoneUnitMarkers.sqf";};
			class zoneUpdater {file = "Functions\Tally\zoneFnc\fn_zoneUpdater.sqf";};
			class updateZone {file = "Functions\Tally\zoneFnc\fn_updateZone.sqf";};
			class initZoneFromMarker {file = "Functions\Tally\zoneFnc\fn_initZoneFromMarker.sqf";};
			class getBattleGrid {file = "Functions\Tally\zoneFnc\fn_getBattleGrid.sqf";};
		}

		class gridSquareFnc
		{
			class gridSquares {file = "Functions\Tally\gridSquareFnc\fn_gridSquares.sqf"};
			class updateGridSquare {file = "Functions\Tally\gridSquareFnc\fn_updateGridSquare.sqf"};
			class squareOwnedBy {file = "Functions\Tally\gridSquareFnc\fn_squareOwnedBy.sqf"};
			class sidesInSquares {file = "Functions\Tally\gridSquareFnc\fn_sidesInSquares.sqf"};
			class squaresInDir {file = "Functions\Tally\gridSquareFnc\fn_squaresInDir.sqf"};
			class squareDominantSide {file = "Functions\Tally\gridSquareFnc\fn_squareDominantSide.sqf"};
			class nearestGridSquare {file = "Functions\Tally\gridSquareFnc\fn_nearestGridSquare.sqf"};
		}

		class objectDetection
		{
			class AiObjectsInArea {file = "Functions\Tally\objectDetection\fn_AiObjectsInArea.sqf"};
			class sidesInUnitArr {file = "Functions\Tally\objectDetection\fn_sidesInUnitArr.sqf"};
		}

		class misc
		{
			
			class frontLineDir {file="Functions\Tally\misc\fn_frontLineDir.sqf"};
			class sidePositions {file="Functions\Tally\misc\fn_sidePositions.sqf"};
			class straightPosArr {file="Functions\Tally\misc\fn_straightPosArr.sqf"};
			class midArrayIndex {file="Functions\Tally\misc\fn_midArrayIndex.sqf"};
			class frontLinePosBetween2Sides {file="Functions\Tally\misc\fn_frontLinePosBetween2Sides.sqf"};
			class squareGrid {file="Functions\Tally\misc\fn_squareGrid.sqf"};
			class sinCosPos {file="Functions\Tally\misc\fn_sinCosPos.sqf"};
			class removeExcludedPositions {file="Functions\Tally\misc\fn_removeExcludedPositions.sqf"};
			
			
		}
		class markers
		{
			class SquareMarker {file = "Functions\Tally\markers\fn_SquareMarker.sqf"};
			class dotMarker {file = "Functions\Tally\markers\fn_dotMarker.sqf"};
			class gridMarkers {file = "Functions\Tally\markers\fn_gridMarkers.sqf"};
			class roundMarker {file = "Functions\Tally\markers\fn_roundMarker.sqf"};
			class addUnitMarkers {file = "Functions\Tally\markers\fn_addUnitMarkers.sqf"};
			class removeUnitMarkers {file = "Functions\Tally\markers\fn_removeUnitMarkers.sqf"};
			class mrkColorFromSide {file = "Functions\Tally\markers\fn_mrkColorFromSide.sqf"};
		}
	};
#include "TallyCore.hpp"