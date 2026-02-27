if keyboard_check_pressed(ord("X")) and other.sprite_index != spr_playerSoul{
	if attached = false{
		audio_play_sound(snd_monkeyHold,0,0)
	}else{
		audio_play_sound(snd_monkeyRelease,0,0)
	}
	image_xscale = 1.6
	attached = !attached
}

if other.sprite_index = spr_playerSoul{
	attached = false
}

if attached = false and other.sprite_index = spr_playerJump and alarm[1] <= 0{
	sprite_index = spr_monkeHappy
	image_xscale = 2*-sign(x-obj_player.x)
	alarm[0] = 70
	audio_play_sound(snd_monkeyJump,0,0,,,random_range(1,1.3))
	scr_explosaoParticula(x, y - sprite_height/2, depth+1, 360, 13, spr_particulaPontoPequeno, 10, 0.03, 0.1)
    scr_explosaoParticula(x, y - sprite_height/2, depth+1, 360, 13, spr_particulaBrilho, 10, 0.03, 0.1)
	other.ySpd = other.maxJumpHeight * 1.5
    other.coyoteTime = 0
}