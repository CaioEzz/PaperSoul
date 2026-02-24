draw_set_font(fnt_main)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
if obj_player.alive = true{
	draw_set_colour(c_black)
}
else{
	draw_set_colour(c_white)
}

draw_text(room_width/2,55,$"Nível {global.levelId[0]}")
draw_set_font(fnt_mainSmall)
draw_text(room_width/2,90,$"\"{global.levelId[1]}\"")