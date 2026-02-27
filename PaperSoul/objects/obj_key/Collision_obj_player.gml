if world = "life"{
	if obj_player.alive = false{image_alpha = 0 exit}else{image_alpha = 1}
}
else if world = "death"{
	if obj_player.alive = true{image_alpha = 0 exit}else{image_alpha = 1}
}

if state = "idle"{
	audio_play_sound(snd_plim,0,0)
	image_xscale = 2
	image_yscale = 2
	scr_explosaoParticula(x,y+sprite_height/2,depth+1,360,12,spr_particulaPonto,10,0.03,0.1)
	state = "follow"
}
world = "neutral"
