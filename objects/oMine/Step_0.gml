if (myTurn)
{
	if (instance_position((x * GRID_SIZE) + sprite_width/2, (y * GRID_SIZE) + sprite_height/2, oPlayer))
	{
		with (oPlayer)
		{
			instance_destroy();
		}
		instance_destroy();
		instance_create_layer(gridX * GRID_SIZE, gridY * GRID_SIZE, "CharacterLayer", oExplosion);
	}
	myTurn = false;
}