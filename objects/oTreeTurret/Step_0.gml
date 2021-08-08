if (myTurn)
	{
		if (firingTimer >= firingDelay && instance_exists(oPlayer))
		{
			//determine where the player is
			var dir = point_direction(x + GRID_SIZE/2, y + GRID_SIZE/2, oPlayer.x + GRID_SIZE/2, oPlayer.y + GRID_SIZE/2);
			
			//parse the angle the player is at onto our grid
			//the goal here is to turn the angle into one of the 8 possible directions we will launch in
			// the first part catches stuff that is going to the right before we use div to determine everything else
			if (dir > 337.5)
			{
				dir = 0;
			}
			else
			{
				dir = dir div 45;
			}
			// now this switch statement will take that direction and parse it into the correct grid (xDirection and yDirection for the banana)
			// we will first use the switch statement to set those relevant variables.
			switch (dir)
			{
				//right
				case 0 :
					bananaxDirection = 1;
					bananayDirection = 0;
					
					break;
					
				//up right
				case 1 : 
					bananaxDirection = 1;
					bananayDirection = -1;
					
					break;
					
				//up
				case 2 :
					bananaxDirection = 0;
					bananayDirection = -1;
					
					break;
					
				//up left
				case 3 :
					bananaxDirection = -1;
					bananayDirection = -1;
					
					break;
					
				//left
				case 4 :
					bananaxDirection = -1;
					bananayDirection = 0;
					
					break;
					
				//down left
				case 5 :
					bananaxDirection = -1;
					bananayDirection = 1;
					
					break;
					
				//down
				case 6 :
					bananaxDirection = 0;
					bananayDirection = 1;
					
					break;
					
				//down right
				case 7 :
					bananaxDirection = 1;
					bananayDirection = 1;
					
					break;
			}
			// determine grid location we are launching into
			var firingGridX = gridX + bananaxDirection;
			var firingGridY = gridY + bananayDirection;
			
			// check if where we are launching is passable
			if (map[# firingGridX, firingGridY].passable)
			{
				//launch the banana
				var banana = instance_create_layer(firingGridX * GRID_SIZE, firingGridY * GRID_SIZE, "CharacterLayer", oBanana);
				banana.xSpeed = bananaXSpeed;
				banana.ySpeed = bananaYSpeed;
				banana.xDirection = bananaxDirection;
				banana.yDirection = bananayDirection;
				banana.xMove = banana.xDirection * banana.xSpeed;
				banana.yMove = banana.yDirection * banana.ySpeed;
				banana.gridX = firingGridX;
				banana.gridY = firingGridY;
			}
			
			if (map[# firingGridX, firingGridY].occupant != noone)
			{
				with (map[# firingGridX, firingGridY].occupant)
				{
					instance_destroy();
					exit;
				}
			}
			
			//reset timer
			firingTimer = 0;
		}
		
		firingTimer++;
		
		//end the object's turn
		myTurn = false;
	}