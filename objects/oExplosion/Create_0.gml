image_speed = 10/room_speed;

//make sound when happen if on camera
//sound effect if something happens on screen by making a box with it's points and checking for collision within it
var cam = view_camera[0];
var x1 = camera_get_view_x(cam);
var y1 = camera_get_view_y(cam);
var x2 = x1 + camera_get_view_width(cam);
var y2 = y1 + camera_get_view_height(cam);
if (collision_rectangle(x1,y1,x2,y2,oSoldierParent,false,true))
{
	audio_play_sound(explosion,1,false);
}