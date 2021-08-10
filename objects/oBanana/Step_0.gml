if (myTurn)
{
	// if we are about to move off the map we flip around
	//if (gridY + yMove < 0 || gridY + yMove >= mapHeight || gridX + xMove < 0 || gridX + xMove >= mapWidth)
	//{		
	//	instance_destroy();
	//	exit;
	//}
	
	var nextGrid = map[#gridX + xMove, gridY + yMove];
	
	//if(!nextGrid.passable)
	//{
	//	instance_destroy();
	//	exit;
	//}
	
	////if(nextGrid.occupant != noone)
	//{
	//	switch nextGrid.occupant.type
	//	{
	//		case "projectile" :
	//			with (nextGrid.occupant)
	//			{
	//				instance_destroy();
	//				exit;
	//				break;
	//			}
	//			instance_destroy();
	//			exit;
	//			break;
				
	//		case "enemy" :
	//			with (nextGrid.occupant)
	//			{
	//				instance_destroy();
	//				exit;
	//				break;
	//			}
	//			instance_destroy();
	//			exit;
	//			break;
				
	//		case "player" :
	//			with (nextGrid.occupant)
	//			{
	//				instance_destroy();
	//				exit;
	//				break;
	//			}
	//			instance_destroy();
	//			exit;
	//			break;
				
	//		default :
	//			instance_destroy();
	//			exit;
	//			break;
	//	}
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
			x = map[# gridX, gridY].x;
			y = map[# gridX, gridY].y;
		
			//update the new node's occupant
			map[# gridX, gridY].occupant = id;
		}
	}
	
	//end turn
	myTurn = false;
}