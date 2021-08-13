// Inherit the parent event
event_inherited();

//set the movement rules for this enemy
mvSpeed = 1;
type = "enemy";

//this enemy will go a random orthogonal direction each turn. this determines the first one.
dir = choose("right", "left", "up", "down");

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


//set the projectile firing rules for this enemy
mineTimer = irandom(2);
firingDelay = 3; // how many turns until it can fire again

//variable for checking if mine was dropped so we dont empty the node we are leaving
mineDropped = false;