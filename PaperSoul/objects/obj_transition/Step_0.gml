if state == "closing" {
	raio = lerp(raio, raioAlvo, vel)
	
	if raio < 2 {
		room_goto(nextRoom)
		if audioPlayed = false{
			audio_play_sound(snd_transitionOut,0,0)
		}
		audioPlayed = true
		state = "opening"
		raio = 0
		raioAlvo = max(room_width, room_height)
	}
}
else if state == "opening" {
	raio = lerp(raio, raioAlvo, vel)
	
	if raio > raioAlvo - 2 {
		instance_destroy()
	}
}