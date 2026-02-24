draw_self(); 
if alarm[0] > 0{
	draw_rectangle_colour(0,0,room_width,room_height,c_white,c_white,c_white,c_white,0)
}

if obj_player.alive = false{
invert_colors(); 
}