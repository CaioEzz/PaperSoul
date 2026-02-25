if attached = true{
	x = lerp(x,obj_player.x,0.3)
	y = lerp(y,obj_player.y,0.3)
}

if obj_player.alive = false{
	sprite_index = spr_plataformaNuvem
	image_blend = make_colour_rgb(166, 103, 245)
	
	if choose(1,2) = 2{
		scr_criarParticula(x + random_range(-sprite_width/2,sprite_width/2),(y+sprite_height/2)-20,depth+1,spr_waterDrop,270,3.5,0.01)
	}
}
else{
	sprite_index = spr_plataformaNuvemCarregada
	image_blend = c_white
}

if obj_player.life_transition = true{
	attached = false
}

image_xscale = lerp(image_xscale,1,0.1)

