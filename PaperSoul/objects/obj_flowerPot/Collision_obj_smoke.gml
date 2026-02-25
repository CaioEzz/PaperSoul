if world = "life"{
	if obj_player.alive = false{image_alpha = 0 exit}else{image_alpha = 1}
}
else if world = "death"{
	if obj_player.alive = true{image_alpha = 0 exit}else{image_alpha = 1}
}

if other.sprite_index = spr_waterDrop{
	if stage < 4.3
	stage += 0.01
}

