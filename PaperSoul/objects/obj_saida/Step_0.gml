if distance_to_object(obj_player) > 20 or obj_player.alive = false or global.portaTrancada = true{
	image_index = 0
}

else if global.portaTrancada = false{
	obj_player.sprite_index = spr_playerIdle
	if image_index > image_number -2{
		image_index = image_number -1
	}
}

if global.portaTrancada{
	if distance_to_object(obj_key) < 50{
		if obj_key.state != "unlock"{
			audio_play_sound(snd_slotIn,0,0)
		}
		obj_key.state = "unlock"
	}
}