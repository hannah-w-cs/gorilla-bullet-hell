
// Inherit the parent event
event_inherited();

image_speed = 5/room_speed;
//set type for collision purposes
type = "tree";

//set up variables for firing
firingTimer = irandom(2);
firingDelay = 3; // how many turns until it can fire again
bananaXSpeed = 1;
bananaYSpeed = 1;
bananaxDirection = 0;
bananayDirection = 0;

//This tree will track where the player is and shoot a banana at them in their direction