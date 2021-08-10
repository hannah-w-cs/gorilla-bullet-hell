
// Inherit the parent event
event_inherited();

//set the movement rules for this enemy
xSpeed = 1;

xDirection = choose(-1, 1);

xMove = xDirection * xSpeed;

//set the projectile firing rules for this enemy
firingTimer = irandom(2);
firingDelay = 2; // how many turns until it can fire again
bulletSpeed = 1;
bulletXDirection = 0;
bulletYDirection = 0;

//determine which way the enemy is facing
myFacing = choose("up", "down");

//adjust sprite accordingly AND which way the projectile is fired
if (myFacing == "up")
{
	sprite_index = sEnemyHorizontal1Up;
	bulletYDirection = -1;
	bulletAngle = 90;
}
else
{
	sprite_index = sEnemyHorizontal1Down;
	bulletYDirection = 1;
	bulletAngle = 270;
}
image_speed = 5/room_speed;



// set type for interaction with other objects
type = "enemy";