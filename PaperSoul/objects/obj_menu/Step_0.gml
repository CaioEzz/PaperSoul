if menuReady = true and !instance_exists(obj_transition){
    var maxx = array_length(global.botaoLista)
    if keyboard_check_pressed(vk_up){
        global.botaoIndex--
		audio_stop_sound(snd_menuPassover)
		audio_play_sound(snd_menuPassover,0,0)
        if global.botaoIndex < 0 {
            global.botaoIndex = maxx-1
        }
    }
    if keyboard_check_pressed(vk_down){
        global.botaoIndex++
		audio_stop_sound(snd_menuPassover)
		audio_play_sound(snd_menuPassover,0,0)
        if global.botaoIndex >= maxx {
            global.botaoIndex = 0
        }
    }

    global.botaoSelecionado = global.botaoLista[global.botaoIndex]
}