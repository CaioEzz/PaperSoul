if obj_player.alive == false || global.portaTrancada { exit }
var roomName = room_get_name(room)
var faseNum = real(string_copy(roomName, string_length(roomName)-1, 2))
global.fases[faseNum - 1] = 1
save_game()

if audioPlayed = false{
	audio_play_sound(snd_menuConfirm,0,0)
	audio_play_sound(snd_door,0,0)
	audioPlayed = true
}
transition(rm_nextroom)