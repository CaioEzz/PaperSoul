function switch_world(){
	if obj_player.alive = true{
		audio_play_sound(snd_death,0,0)
	}
	else{
		audio_stop_sound(snd_respawnStart)
		audio_play_sound(snd_respawnEnd,0,0)
	}
	obj_controller.alarm[0] = 4
	scr_explosaoParticula(obj_player.x,obj_player.y,depth+1,360,18,spr_particulaPonto,8,0.01,0.05)
	scr_explosaoParticula(obj_player.x,obj_player.y,depth+1,360,18,spr_particulaPapel,8,0.01,0.05)
	obj_player.image_angle = 0
	obj_player.spinInd = 0
	obj_player.life_transition = false
	screenshake(9,12)
	obj_player.alive = !obj_player.alive
}