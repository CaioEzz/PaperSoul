if ZPressed = false and alarm[1] <= 0{
	logoScale = 1.5
	logoRot = 15
	
	scr_explosaoParticula(room_width/2 - 30,room_height/2, depth+1, 360, 64, spr_particulaPontoPequeno, 20, 0.01, 0.1)
    scr_explosaoParticula(room_width/2 - 30,room_height/2, depth+1, 360, 64, spr_particulaPonto, 20, 0.01, 0.1)
	scr_explosaoParticula(room_width/2 + 30,room_height/2, depth+1, 360, 64, spr_particulaPontoPequeno, 20, 0.01, 0.1)
    scr_explosaoParticula(room_width/2 + 30,room_height/2, depth+1, 360, 64, spr_particulaPonto, 20, 0.01, 0.1)
	
	alarm[3] = 60
	if !instance_exists(obj_transition){
		audio_play_sound(snd_plim,0,0)
	}
	ZPressed = true
}

