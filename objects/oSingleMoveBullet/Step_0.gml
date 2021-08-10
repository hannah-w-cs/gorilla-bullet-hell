if (myTurn)
{

	//if (gridY + yMove < 0 || gridY + yMove >= mapHeight || gridX + xMove < 0 || gridX + xMove >= mapWidth)
	//	{		
	//		instance_destroy();
	//		exit;
	//	}
		

	var nextGrid = map[#gridX + xMove, gridY + yMove];	
	
	//	if(!nextGrid.passable)
	//{
	//	instance_destroy();
	//	exit;
	//}
	
	if (gridY + yMove >= 0 && gridY + yMove < mapHeight && gridX + xMove >=0 && gridX + xMove < mapWidth)
	{
		if (nextGrid.occupant == noone && nextGrid.passable)
		{
			//first clear node player is leaving
			map[# gridX, gridY].occupant = noone;
		
			//update player's position and information
			gridY += yMove;
			gridX += xMove;
			x = map[# gridX, gridY].x + sprite_width/2;
			y = map[# gridX, gridY].y + sprite_height/2;
		
			//update the new node's occupant
			map[# gridX, gridY].occupant = id;
		}
	}
	
	//end turn
	myTurn = false;
}