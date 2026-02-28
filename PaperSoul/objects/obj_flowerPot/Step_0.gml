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

	if alarm[0] > 0{
		image_index = 5
	}
	else{
		image_index = stage
	}

var currentInt = floor(stage);
if currentInt > lastStageInt {
	scr_explosaoParticula(x, y - sprite_height/2, depth+1, 360, 13, spr_particulaPontoPequeno, 10, 0.03, 0.1)
    scr_explosaoParticula(x, y - sprite_height/2, depth+1, 360, 13, spr_particulaBrilho, 10, 0.03, 0.1)
    image_xscale = 2; 
	var vol = 0.80 + (lastStageInt > 0 ? 1/lastStageInt : 0);
	audio_play_sound(snd_flower, 10, false, vol);
}
lastStageInt = currentInt;
image_xscale = lerp(image_xscale, 1, 0.1);

if obj_player.alive = true{
	image_blend = make_colour_rgb(166, 103, 245)
}
else{
	image_blend = c_white
}

if attached = true{
	alarm[1] = 90
	x = lerp(x,obj_player.x,0.3)
	y = lerp(y,obj_player.y,0.3)
}

if image_index = 4{
	if irandom_range(1,1) = 2{
		scr_criarParticula(random_range(x-sprite_width/2,x+sprite_width/2),random_range(y-sprite_height/2,y+sprite_height/2),depth-1,spr_particulaBrilho,0,0,0.01)
	}
}
