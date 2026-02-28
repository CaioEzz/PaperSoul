if world = "life"{
	if obj_player.alive = false{image_alpha = 0 exit}else{image_alpha = 1}
}
else if world = "death"{
	if obj_player.alive = true{image_alpha = 0 exit}else{image_alpha = 1}
}

if other.sprite_index = spr_waterDrop{
	if point_direction(x,y,other.x,other.y) <= 40{
	scr_explosaoParticula(other.x, other.y, depth+1, 360, 20, spr_particulaPontoPequeno, 10, 0.03, 0.1)
	if stage < 4.3{
		stage += 0.4
	}
	instance_destroy(other)
	}
}

