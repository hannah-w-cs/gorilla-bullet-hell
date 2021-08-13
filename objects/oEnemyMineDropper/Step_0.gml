// show which way this enemy is going next by using the appropriate sprite

if (myTurn)
{
	
	//set movement variables based on direction
	switch(dir)
	{
		case "right" :
			xMove = mvSpeed;
			yMove = 0;
			break;
		
		case "left" :
			xMove = -mvSpeed;
			yMove = 0;
			break;
		
		case "up" :
			xMove = 0;
			yMove = -mvSpeed;
			break;
		
		case "down" :
			xMove = 0;
			yMove = mvSpeed;
			break;	
	}
	
	//check if new spot is doable, if not don't move this turn. Get new direction for next turn.
	if (gridY + yMove < 0 || gridY + yMove >= mapHeight || gridX + xMove < 0 || gridX + xMove >= mapWidth)
	{
		var nextGrid = map[# gridX + xMove, gridY + yMove];
		
		if (nextGrid.passable && nextGrid.occupant != noone)
		{
			//if move is doable, drop mine if it is time to drop mine
			if (firingTimer >= mineTimer)
			{
				var mine = instance_create_layer(gridX * GRID_SIZE, gridY * GRID_SIZE, "CharacterLayer", oMine);
				with (mine)
				{
					//set the grid location
					gridX = other.gridX;
					gridY = other.gridY;
					mineDropped = true;
				}
				firingTimer = 0;
			}
	
			//do the move
			if (gridY + yMove >= 0 && gridY + yMove < mapHeight && gridX + xMove >=0 && gridX + xMove < mapWidth)
			{
				if (nextGrid.occupant == noone && nextGrid.passable)
				{
					//first clear node player is leaving if we haven't dropped a mine
					if (!mineDropped)
					{
						map[# gridX, gridY].occupant = noone;
					}
					else
					{
						mineDropped = false;
					}
		
					//update player's position and information
					gridY += yMove;
					gridX += xMove;
					x = map[# gridX, gridY].x;
					y = map[# gridX, gridY].y;
		
					//update the new node's occupant
					map[# gridX, gridY].occupant = id;
				}
			}
			
			//get next turn's move
			dir = choose("right", "left", "up", "down");

			//set up sprite to indicate next move
			switch (dir)
			{
				case "right" :
					sprite_index = sEnemyMineDropperRight;
					image_speed = 5/room_speed;
					break;
		
				case "left" :
					sprite_index = sEnemyMineDropperLeft;
					image_speed = 5/room_speed;
					break;
		
				case "up" :
					sprite_index = sEnemyMineDropperUp;
					image_speed = 5/room_speed;
					break;
		
				case "down" :
					sprite_index = sEnemyMineDropperDown;
					image_speed = 5/room_speed;
					break;
			}
		}
	}
	
	myTurn = false;
}