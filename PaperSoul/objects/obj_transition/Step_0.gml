if state == "closing" {
	raio = lerp(raio, raioAlvo, vel)
	
	if raio < 2 {
		room_goto(nextRoom)
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