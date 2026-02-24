if attached = true{
	x = lerp(x,obj_player.x,0.3)
	y = lerp(y,obj_player.y,0.3)
}

if obj_player.alive = false{
	image_blend = make_colour_rgb(166, 103, 245)
}
else{
	image_blend = c_white
}

if obj_player.life_transition = true{
	attached = false
}

if irandom_range(1,10) = 2{
	scr_criarParticula(random_range(x-sprite_width/2,x+sprite_width/2),random_range(y-sprite_height/2,y+sprite_height/2),depth-1,spr_particleCloud,270,2,0.01)
}

image_xscale = lerp(image_xscale,1,0.1)