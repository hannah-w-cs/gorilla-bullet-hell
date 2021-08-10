// vertical movement if it is their turn
if (myTurn)
{
	// if we are about to move off the map we flip around
	if (gridY + yMove < 0 || gridY + yMove >= mapHeight)
	{
		yDirection = -yDirection;
		yMove = yDirection * ySpeed;
	}
	
	// now we flip around if it is not passable node.
	// we do this here so it flips at edge of map first. The edge of map will not have a node in the ds_grid that can return as passable or not
	if(!map[# gridX, gridY + yMove].passable || map[# gridX, gridY + yMove].occupant != noone)
	{
		yDirection = -yDirection;
		yMove = yDirection * ySpeed;
	}
	
	if (gridY + yMove >= 0 && gridY + yMove < mapHeight)
	{
		if (map[# gridX, gridY + yMove].occupant == noone && map[# gridX, gridY + yMove].passable)
		{
			//first clear node player is leaving
			map[# gridX, gridY].occupant = noone;
		
			//update player's position and information
			gridY += yMove;
			x = map[# gridX, gridY].x;
			y = map[# gridX, gridY].y;
		
			//update the new node's occupant
			map[# gridX, gridY].occupant = id;
		}
	}
	
		if (firingTimer >= firingDelay)
	{
		//this is the grid that this object will spawn/fire a bullet into
		var firingGridX = gridX + bulletXDirection;
		var firingGridY = gridY + bulletYDirection;
		if(firingGridX >= 0 && firingGridX < mapHeight)
		{
			if (map[# firingGridX, gridY].passable)
			{
				var bullet = instance_create_layer((firingGridX * GRID_SIZE) + sprite_width/2 , (firingGridY * GRID_SIZE) + sprite_height/2, "CharacterLayer", oSingleMoveBullet);
				bullet.xSpeed = 1;
				bullet.xDirection = bulletXDirection;
				bullet.xMove = bullet.xDirection * bullet.xSpeed;
				bullet.image_angle = bulletAngle;
				bullet.gridX = firingGridX;
				bullet.gridY = firingGridY;
			}
		}
		
		//reset firing timer
		firingTimer = 0;
	}
	
	//tick up the firing timer
	firingTimer++;
	//mark that it is no longer the object's turn
	myTurn = false;
}