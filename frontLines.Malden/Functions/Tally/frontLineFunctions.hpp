class frontL
	{
		class init
		{
			class initFrontLines {
									file = "Functions\Tally\init\fn_initFrontLines.sqf";
									postInit = 1;
								};
			class taskmanager {file = "Functions\Tally\init\fn_taskmanager.sqf";};
			class execInit {file = "Functions\Tally\init\fn_execInit.sqf";};
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
			class frontLinePOC {file = "Functions\Tally\polyLine\fn_frontLinePOC.sqf";};

		}

		class zoneFnc
		{
			
			class defineIslandAreas {file = "Functions\Tally\zoneFnc\fn_defineIslandAreas.sqf";};
			class updateGrid {file = "Functions\Tally\zoneFnc\fn_updateGrid.sqf";};
			class zoneUnitMarkers {file = "Functions\Tally\zoneFnc\fn_zoneUnitMarkers.sqf";};
			class updateBattleZone {file = "Functions\Tally\zoneFnc\fn_updateBattleZone.sqf";};
			class initBattleZone {file = "Functions\Tally\zoneFnc\fn_initBattleZone.sqf";};
			class getBattleGrid {file = "Functions\Tally\zoneFnc\fn_getBattleGrid.sqf";};
			class gridSidePos  {file = "Functions\Tally\zoneFnc\fn_gridSidePos.sqf";};
		}

		class gridSquareFnc
		{
			class gridSquares {file = "Functions\Tally\gridSquareFnc\fn_gridSquares.sqf"};
			class updateGridSquare {file = "Functions\Tally\gridSquareFnc\fn_updateGridSquare.sqf"};
			class squareDominantSide {file = "Functions\Tally\gridSquareFnc\fn_squareDominantSide.sqf"};
			class nearestGridSquare {file = "Functions\Tally\gridSquareFnc\fn_nearestGridSquare.sqf"};
			class getStartSquare {file = "Functions\Tally\gridSquareFnc\fn_getStartSquare.sqf"};
			class allConnectingSquares {file = "Functions\Tally\gridSquareFnc\fn_allConnectingSquares.sqf"};
			class getConnect {file = "Functions\Tally\gridSquareFnc\fn_getConnect.sqf"};
			class outnumberedSquare {file = "Functions\Tally\gridSquareFnc\fn_outnumberedSquare.sqf"};
			class squareEnemyPOC {file = "Functions\Tally\gridSquareFnc\fn_squareEnemyPOC.sqf"};
			class frontLineSquares {file = "Functions\Tally\gridSquareFnc\fn_frontLineSquares.sqf"};
			class squareFromMarker {file = "Functions\Tally\gridSquareFnc\fn_squareFromMarker.sqf"};
			class isFrontLineSquare {file = "Functions\Tally\gridSquareFnc\fn_isFrontLineSquare.sqf"};
			class squarePositions {file = "Functions\Tally\gridSquareFnc\fn_squarePositions.sqf"};
			class gridSqNeighbors {file = "Functions\Tally\gridSquareFnc\fn_gridSqNeighbors.sqf"};
			class getNeighbors  {file = "Functions\Tally\gridSquareFnc\fn_getNeighbors.sqf"};
			class getSquaresFromMrk {file = "Functions\Tally\gridSquareFnc\fn_getSquaresFromMrk.sqf"};
			class assignGridSquareOwners {file = "Functions\Tally\gridSquareFnc\fn_assignGridSquareOwners.sqf"};
		}

		class objectDetection
		{
			class AiObjectsInArea {file = "Functions\Tally\objectDetection\fn_AiObjectsInArea.sqf"};
		}

		class misc
		{
			
			class straightPosArr {file="Functions\Tally\misc\fn_straightPosArr.sqf"};
			class midArrayIndex {file="Functions\Tally\misc\fn_midArrayIndex.sqf"};
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
			class dotsOnPosArr {file = "Functions\Tally\markers\fn_dotsOnPosArr.sqf"};
			class battleZoneSideMarkers {file = "Functions\Tally\markers\fn_battleZoneSideMarkers.sqf"};
		}
	};
#include "TallyCore.hpp"