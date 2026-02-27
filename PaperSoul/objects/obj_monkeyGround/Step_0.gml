if world = "life"{
	if obj_player.alive = false{image_alpha = 0 exit}else{image_alpha = 1}
}
else if world = "death"{
	if obj_player.alive = true{image_alpha = 0 exit}else{image_alpha = 1}
}

ySpd += grav

if ySpd > maxFall {
    ySpd = maxFall
}

if place_meeting(x, y + ySpd, obj_barrier) and attached = false{
    while (!place_meeting(x, y + sign(ySpd), obj_barrier)) {
        y += sign(ySpd)
    }
    ySpd = 0
}
y += ySpd


if obj_player.alive = true{
	if sprite_index = spr_skullStand{
		sprite_index = spr_monkeStand
	}
	image_blend = make_colour_rgb(166, 103, 245)
}
else{
	sprite_index = spr_skullStand
	image_blend = c_white
}

if attached = true{
	x = lerp(x,obj_player.x,0.3)
	y = lerp(y,obj_player.y,0.3)
	alarm[1] = 30
}

image_xscale = lerp(image_xscale,1*-sign(x-obj_player.x),0.3)
