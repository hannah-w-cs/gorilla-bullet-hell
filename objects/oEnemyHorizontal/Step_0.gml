
// vertical movement if it is their turn
if (myTurn)
{
	// if we are about to move off the map we flip around
	if (gridX + xMove < 0 || gridX + xMove >= mapWidth)
	{
		xDirection = -xDirection;
		xMove = xDirection * xSpeed;
	}
	
	// now we flip around if it is not passable node.
	// we do this here so it flips at edge of map first. The edge of map will not have a node in the ds_grid that can return as passable or not
	if(!map[# gridX + xMove, gridY].passable)
	{
		xDirection = -xDirection;
		xMove = xDirection * xSpeed;
	}
	
	if (gridX + xMove >= 0 && gridX + xMove < mapWidth)
	{
		if (map[# gridX + xMove, gridY].occupant == noone && map[# gridX + xMove, gridY].passable)
		{
			//first clear node player is leaving
			map[# gridX, gridY].occupant = noone;
		
			//update player's position and information
			gridX += xMove;
			x = map[# gridX, gridY].x;
			y = map[# gridX, gridY].y;
		
			//update the new node's occupant
			map[# gridX, gridY].occupant = id;
		}
	}
	
	//projectile firing
	if (firingTimer >= firingDelay)
	{
		if(gridY
	}
	
	//tick up the firing timer
	firingTimer++;
	
	//mark that it is no longer the object's turn
	myTurn = false;
}