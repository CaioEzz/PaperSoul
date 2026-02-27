if world = "life"{
	if obj_player.alive = false{image_alpha = 0 exit}else{image_alpha = 1}
}
else if world = "death"{
	if obj_player.alive = true{image_alpha = 0 exit}else{image_alpha = 1}
}

if state = "follow"{
	x = lerp(x,obj_player.x + (50*obj_player.image_xscale*-1),0.3)
	y = lerp(y,obj_player.y,0.3)
}

image_xscale = lerp(image_xscale,1,0.3)
image_yscale = lerp(image_yscale,1,0.3)

if state = "idle" or state = "unlock"{
levitate_timer += levitate_speed;
y = base_y + sin(levitate_timer) * levitate_amplitude;
scr_explosaoParticula(x,y,depth+1,360,random_range(1,3),spr_particulaPontoPequeno,8,0.01,0.1)
}

if state = "unlock"{
	if alarm[0] <= 0{
		alarm[0] = 120
	}
	scr_explosaoParticula(x,y,depth+1,360,1,spr_particulaPapel,8,0.01,0.1)
	x = obj_saida.x
	base_y = obj_saida.y
	image_angle += spinInd
	spinInd += 1
	
	if !audio_is_playing(snd_menuCancel){
		pitchvar += 0.2
		audio_play_sound(snd_menuCancel,0,0,,,1+pitchvar)
	}
}