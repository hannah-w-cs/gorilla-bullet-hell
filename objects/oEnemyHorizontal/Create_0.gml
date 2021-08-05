
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
	//add sprite index changes here
	bulletYDirection = -1;
	bulletAngle = 90;
}
else
{
	//sprite index goes here
	bulletYDirection = 1;
	bulletAngle = 270;
}



// set type for interaction with other objects
type = "enemy";