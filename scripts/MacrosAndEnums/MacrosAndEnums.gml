// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Macros(){
	#macro GRID_SIZE 8 // width and height of our node object
	
	enum TURN_STATE
	{
		player,
		waitPlayer,
		projectile,
		waitProjectile,
		enemy,
		waitEnemy
	}
}