// grab movement inputs
up = keyboard_check_pressed(vk_up);
down = keyboard_check_pressed(vk_down);
left = keyboard_check_pressed(vk_left);
right = keyboard_check_pressed(vk_right);

//obtain movement direction
hsp = right - left; // negative will mean left, 0 means nothing
vsp = down - up; // negative will mean up, 0 means nothing

//horizontal movement
// make sure you have pressed to move AND that you cannot move out of bounds of the room
if(hsp != 0 && gridX + hsp >= 0 && gridX + hsp < mapWidth && myTurn)
{
	if (map[# gridX + hsp, gridY].occupant == noone && map[# gridX + hsp, gridY].passable)
	{
		//first clear node player is leaving
		map[# gridX, gridY].occupant = noone;
		
		//update player's position and information
		gridX += hsp;
		x = map[# gridX, gridY].x;
		y = map[# gridX, gridY].y;
		
		//update the new node's occupant
		map[# gridX, gridY].occupant = id;
		
		//mark that it is no longer the player's turn
		myTurn = false;
	}
}

//vertical movement
if(vsp != 0 && gridY + vsp >= 0 && gridY + vsp < mapHeight && myTurn)
{
	if (map[# gridX, gridY + vsp].occupant == noone && map[# gridX, gridY + vsp].passable)
	{
		//first clear node player is leaving
		map[# gridX, gridY].occupant = noone;
		
		//update player's position and information
		gridY += vsp;
		x = map[# gridX, gridY].x;
		y = map[# gridX, gridY].y;
		
		//update the new node's occupant
		map[# gridX, gridY].occupant = id;
		
		//mark that it is no longer the player's turn
		myTurn = false;
	}
}