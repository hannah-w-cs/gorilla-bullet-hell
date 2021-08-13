//@description
neighbors = ds_list_create(); //this will hold the instance ID of every node that touches it

occupant = noone; // tracks who is standing here
passable = true; // tracks if it is able to be moved through/stood on or not

gridX = 0;
gridY = 0;

type = "node"; //node will stand for basic open square

image_speed = 0;