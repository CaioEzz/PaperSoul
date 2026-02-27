if keyboard_check_pressed(ord("X")) and other.sprite_index = spr_playerSoul{
	image_xscale = 1.6
	audio_play_sound(snd_jump,0,0,,,0.4)
	attached = !attached
}

if other.sprite_index = spr_playerJump and sign(other.ySpd) != 1{
	image_xscale = 1.6
}

