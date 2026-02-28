raio = max(room_width, room_height)
raioAlvo = 0

vel = 0.1

state = "closing"

surf = -1

global.pause = true

if instance_exists(obj_player){
	alvoX = obj_player.x 
	alvoY = obj_player.y
}

else{
	alvoX = room_width/2
	alvoY = room_height/2
}

audioPlayed = false
