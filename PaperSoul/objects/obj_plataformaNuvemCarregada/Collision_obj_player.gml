if keyboard_check_pressed(ord("X")) and other.sprite_index = spr_playerSoul{
	image_xscale = 1.6
	attached = !attached
}

if other.sprite_index = spr_playerJump and sign(other.ySpd) != 1{
	image_xscale = 1.6
}

if other.sprite_index != spr_playerSoul{
	global.pause = true
	screenshake(25,60)
	if alarm[0] <= 0{
		alarm[0] = 50
	}
	other.sprite_index = spr_playerDischarge
}