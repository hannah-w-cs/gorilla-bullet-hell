event_inherited();

//set the movement rules for this enemy
ySpeed = 1;

yDirection = choose(-1, 1);

yMove = yDirection * ySpeed;


//set the projectile firing rules for this enemy
firingTimer = irandom(2);
firingDelay = 2; // how many turns until it can fire again
bulletSpeed = 1;
bulletXDirection = 0;
bulletYDirection = 0;

//determine which way the enemy is facing
myFacing = choose("left", "right");

//adjust sprite accordingly AND which way the projectile is fired
if (myFacing == "right")
{
	//add sprite index changes here
	bulletXDirection = 1;
	bulletAngle = 0;
}
else
{
	//sprite index goes here
	bulletXDirection = -1;
	bulletAngle = 180;
}

// set enemy type for interaction with other objects
type = "enemy";
