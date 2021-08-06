/// @description
//set game controller variables
randomize();
state = "initializing";
globalvar map, mapWidth, mapHeight; // this will hold all of our node ids

mapWidth = 16; //lets us know how many tiles wide room is
mapHeight = 16; //how many tiles high room is

map = ds_grid_create(mapWidth,mapHeight);

//set the game turn
gameTurn = TURN_STATE.player;
alarmSet = false;
turnWaitTime = 0.5; //this is how long in seconds after a turn occurs that another turn happens

//create nodes
for (var xx = 0; xx < mapWidth; xx++)
{
	for (var yy = 0; yy < mapHeight; yy++)
	{
		//this creates our node object at the correct pixel and stores its instance ID in our ds_grid for access
	ds_grid_add(map,xx,yy,instance_create_layer(xx * GRID_SIZE, yy * GRID_SIZE,"NodeLayer", oNode));
	map[# xx, yy].gridX = xx;
	map[# xx, yy].gridY = yy;
	}
}

//populate neighbor lists on nodes
for(var xx = 0; xx < mapWidth; xx++)
{
	for (var yy = 0; yy < mapHeight; yy++)
	{
		var node = map[# xx, yy];
		// we are adding neighbors based on the knowledge that they will have neighbors in directions the room exists in
		//add left neighbor
		if (xx > 0) 
		{
			ds_list_add(node.neighbors, map[# xx - 1, yy]);
		}
		
		//add right neighbor
		if (xx < mapWidth - 1)
		{
			ds_list_add(node.neighbors, map[# xx + 1, yy]);
		}
		
		//add top neighbor
		if(yy > 0)
		{
			ds_list_add(node.neighbors, map[# xx, yy - 1]);
		}
		
		//add bottom neighbor
		if (yy < mapHeight - 1)
		{
			ds_list_add(node.neighbors, map[# xx, yy + 1]);
		}
		
		//add top left neighbor
		if (xx > 0 && yy > 0)
		{
			ds_list_add(node.neighbors, map[# xx + 1, yy  - 1]);
		}
		
		//add top right neighbor
		if (xx < mapWidth - 1 && yy > 0)
		{
			ds_list_add(node.neighbors, map[# xx + 1, yy - 1])
		}
		
		//add bottom left neighbor
		if (xx > 0 && yy < mapHeight - 1)
		{
			ds_list_add(node.neighbors, map[# xx - 1, yy + 1]);
		}
		
		// add bottom right neighbor
		if (xx < mapWidth - 1 && yy < mapHeight - 1)
		{
			ds_list_add(node.neighbors, map[# xx + 1, yy + 1]);
		}
	}
}