if id == global.botaoSelecionado and !instance_exists(obj_transition){
	audio_play_sound(snd_menuConfirm,1,0)
	if string_starts_with(text,"\"1-"){
		var _roomname = "rm_level0" + string_char_at(text,4)
		transition(asset_get_index(_roomname))
	}
    switch text {
        case "Novo jogo":
            transition(rm_level01)
        break;

        case "Continuar":
		    load_game()
			if color = c_red{break}
		    var found = false
		    for (var ind = 0; ind < array_length(global.fases); ind++) {
		        if (global.fases[ind] == 0) {
		            var room_name = "rm_level0" + string(ind + 1)
		            var last_fase = asset_get_index(room_name)
		            transition(last_fase)
		            found = true
		            break
		        }
		    }

		    if !found {
		        transition(rm_level01)
		    }

		break;
		
		case "Seleção de nível":
			if color = c_red{break;}
			obj_menu.alarm[5] = 2
			instance_destroy(obj_button)
		break;

		case "Fechar jogo":
			game_end()
		break;

		case "Voltar":
			obj_menu.alarm[3] = 2
			instance_destroy(obj_button)
		break;

	    }

}