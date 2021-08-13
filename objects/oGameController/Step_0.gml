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
							passable = false;
			
							break;
			
						case "tree" :
							type = "tree";
							passable = false;
			
							break;
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
				if (instance_exists(oPlayer))
				{
					oPlayer.myTurn = true;
					gameTurn = TURN_STATE.waitPlayer;
				}
				else
				{
					game_end();
				}
				
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
					//run projectile collision code here so that it runs collisions for all projectiles before they move.
					// this will avoid having instances where a bullet would collide with another, but the other runs its movement code first
					with (oProjectileParent)
					{
						var me = id;
						if (gridY + yMove < 0 || gridY + yMove >= mapHeight || gridX + xMove < 0 || gridX + xMove >= mapWidth)
							{		
								instance_destroy();
							}
						if (instance_exists(me))
							{
							var nextGrid = map[# gridX + xMove, gridY + yMove];
						
							if(!nextGrid.passable)
								{
									instance_destroy();
									instance_create_layer(gridX * GRID_SIZE, gridY * GRID_SIZE, "CharacterLayer", oExplosion);
								}
				
							if(nextGrid.occupant != noone)
							{
								switch nextGrid.occupant.type
								{
									case "projectile" :
										with (nextGrid.occupant)
										{
											instance_destroy();
											instance_create_layer(gridX * GRID_SIZE, gridY * GRID_SIZE, "CharacterLayer", oExplosion);
										}
										instance_destroy();
										break;
				
									case "enemy" :
										with (nextGrid.occupant)
										{
											instance_destroy();
											instance_create_layer(gridX * GRID_SIZE, gridY * GRID_SIZE, "CharacterLayer", oExplosion);
										}
										instance_destroy();
										break;
				
									case "player" :
										with (nextGrid.occupant)
										{
											instance_destroy();
										}
										instance_destroy();
										break;
										
									case "mine" :
										with (nextGrid.occupant)
										{
											instance_destroy();
											instance_create_layer(gridX * GRID_SIZE, gridY * GRID_SIZE, "CharacterLayer", oExplosion);
										}
										instance_destroy();
										break;
				
									default :
										instance_destroy();
										break;
								}
							}
						}
						// keep this in the check to make sure there are projectile objects
						oProjectileParent.myTurn = true;
					}
					
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
				else if (alarmSet == false)
				{
					alarm[1] = turnWaitTime * room_speed;
					alarmSet = true;
				}
			
				break;
				
			case TURN_STATE.enemy :
			
				if (instance_exists(oEnemyParent))
				{
					oEnemyParent.myTurn = true;
					gameTurn = TURN_STATE.waitEnemy;
					//sound effect if something happens on screen by making a box with it's points and checking for collision within it
					var cam = view_camera[0];
					var x1 = camera_get_view_x(cam);
					var y1 = camera_get_view_y(cam);
					var x2 = x1 + camera_get_view_width(cam);
					var y2 = y1 + camera_get_view_height(cam);
					if (collision_rectangle(x1,y1,x2,y2,oSoldierParent,false,true))
					{
						var stepSound = choose(soldierStepsGrass_001,soldierStepsGrass_002,soldierStepsGrass_003,soldierStepsGrass_004,soldierStepsGrass_005,soldierStepsGrass_006);
						audio_play_sound(stepSound,1,false);
					}
					
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
				else if (alarmSet == false)
				{
					alarm[2] = turnWaitTime * room_speed;
					alarmSet = true;
				}
				
				break;	
		}
}