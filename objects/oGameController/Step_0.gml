//begginings of our state machine
switch (state)
{
	case "map generation" :
	
		break;
	case "initializing" :
	// Doing all of this here so that this is done with each of the nodes after the terrain objects are created
		with (oNode)
		{
				if (instance_position(x + sprite_width/2, y + sprite_height/2, oTerrainParent))
			{
				var tempTerrain = instance_position(x + sprite_width/2, y + sprite_height/2, oTerrainParent);
	
					switch (tempTerrain.type)
					{
						case "wall" : 
							type = "wall";
							sprite_index = sWall;
							passable = false;
			
							break;
			
						case "tree" :
							type = "tree";
							sprite_index = sTree;
							passable = false;
			
							break;
					}
	
					with (tempTerrain)
					{
						instance_destroy();
					}
			}
			
			if (instance_position(x + sprite_width/2, y + sprite_height/2, oMovingParent))
			{
				//set this node's occupant
				occupant = instance_position(x + sprite_width/2, y + sprite_height/2, oMovingParent);
				//set the occupant's grid location
				occupant.gridX = gridX;
				occupant.gridY = gridY;
			}
			
		}
		state = "PlayingGame";
		break;
		
	
	// This is where the bulk of game management is at
	case "PlayingGame" :
		switch (gameTurn)
		{
			
			case TURN_STATE.player :
				oPlayer.myTurn = true;
				gameTurn = TURN_STATE.waitPlayer;
				
				break;
			
			// these wait states are so its not constantly making it one objects turn 
			case TURN_STATE.waitPlayer :
			
				if (!oPlayer.myTurn && !alarmSet)
				{
					// this will give a satisfying half second delay bfore next action happens
					alarm[0] = turnWaitTime * room_speed;
					alarmSet = true;
				}
				
				break;
			
			case TURN_STATE.projectile :
			
				if (instance_exists(oProjectileParent))
				{
					oProjectileParent.myTurn = true;
					gameTurn = TURN_STATE.waitProjectile;
				}
				else
				{
					gameTurn = TURN_STATE.waitProjectile;
				}
			
				break;
				
			case TURN_STATE.waitProjectile :
			
				if (instance_exists(oProjectileParent))
				{
					if (!oProjectileParent.myTurn && !alarmSet)
					{
						alarm[1] = turnWaitTime * room_speed;
						alarmSet = true;
					}
				}
				else
				{
					gameTurn = TURN_STATE.enemy;
				}
			
				break;
				
			case TURN_STATE.enemy :
			
				if (instance_exists(oEnemyParent))
				{
					oEnemyParent.myTurn = true;
					gameTurn = TURN_STATE.waitEnemy;
				}
				else
				{
					gameTurn = TURN_STATE.waitEnemy;
				}
			
			
				break;
				
			case TURN_STATE.waitEnemy :
			
				if (instance_exists(oEnemyParent))
				{
					if(!oEnemyParent.myTurn && !alarmSet)
					{
						alarm[2] = turnWaitTime * room_speed;
						alarmSet = true;
					}
				}
				else
				{
					gameTurn = TURN_STATE.player;
				}
				
				break;	
		}
}