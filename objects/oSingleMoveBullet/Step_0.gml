if (myTurn)
{
	// if we are about to move off the map we flip around
	if (gridY + yMove < 0 || gridY + yMove >= mapHeight)
	{
		yDirection = -yDirection;
		yMove = yDirection * ySpeed;
		// I DO NOT KNOW WHY but it will not actually destroy the instance here UNLESS i have the code in above
		instance_destroy();
	}
	
	// now we flip around if it is not passable node.
	// we do this here so it flips at edge of map first. The edge of map will not have a node in the ds_grid that can return as passable or not
	if(!map[# gridX, gridY + yMove].passable || map[# gridX, gridY + yMove].occupant != noone)
	{
		yDirection = -yDirection;
		yMove = yDirection * ySpeed;
		instance_destroy();
	}
	
	if (gridY + yMove >= 0 && gridY + yMove < mapHeight)
	{
		if (map[# gridX, gridY + yMove].occupant == noone && map[# gridX, gridY + yMove].passable)
		{
			//first clear node player is leaving
			map[# gridX, gridY].occupant = noone;
		
			//update player's position and information
			gridY += yMove;
			x = map[# gridX, gridY].x + sprite_width/2;
			y = map[# gridX, gridY].y + sprite_height/2;
		
			//update the new node's occupant
			map[# gridX, gridY].occupant = id;
		}
	}
	
	//end turn
	myTurn = false;
}