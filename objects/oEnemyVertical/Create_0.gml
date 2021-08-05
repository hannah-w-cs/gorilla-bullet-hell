event_inherited();

//set the movement rules for this enemy
ySpeed = 1;

yDirection = choose(-1, 1);

yMove = yDirection * ySpeed;

//set the projectile firing rules for this enemy
firingTimer = 0;
firingDelay = 1; // how many turns until it can fire again

// set enemy type for interaction with other objects
type = "enemy";
