if !place_meeting(x,y,target){
	move_towards_point(target.x,target.y,12)
	y -= 4
}
else{
	scr_explosaoParticula(x, y + sprite_height/2, depth+1, 360, 15, spr_particulaPonto, 10, 0.03, 0.1)
	scr_explosaoParticula(x, y + sprite_height/2, depth+1, 360, 15, spr_particulaPontoPequeno, 10, 0.03, 0.1)
	target.image_index = 0
	var monkesound = choose(snd_monkey1,snd_monkey2)
	audio_play_sound(monkesound,0,0,,,random_range(1,1.3))
	target.sprite_index = spr_monkeHandsUp
	if target = monkeyA{target = monkeyB}
	else if target = monkeyB{target = monkeyA}
}

image_angle += speed * sign(x - target.x)

var pot = instance_nearest(x, y, obj_flowerPot);
if pot != noone {
    var dir = point_direction(x, y, pot.x, pot.y - 150);
    if pot.image_index == 5 {
        pot.alarm[0] = 120;
        pot.image_xscale = 2;
        instance_destroy();
    }
}