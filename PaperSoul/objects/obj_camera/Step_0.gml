if (shakeLen >= 1) {
    var xShake = targetX + irandom_range(-shakeAmount, +shakeAmount);
    var yShake = targetY + irandom_range(-shakeAmount, +shakeAmount);
    camera_set_view_pos(cam, xShake, yShake);
    shakeLen -= 1;
}
else{
	camera_set_view_pos(cam,targetX,targetY)
}


audio_group_set_gain(audiogroup_default,global.volumesfx,1)
audio_sound_gain(snd_soundtrack,global.volumemusic,1)

show_debug_message(global.volumemusic)