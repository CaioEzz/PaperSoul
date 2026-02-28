if id == global.botaoSelecionado and !instance_exists(obj_transition){
    switch text {
		case "Volume SFX: ":
			global.volumesfx -= 0.01
			global.volumesfx = clamp(global.volumesfx,0,1)
		break
	
		
		case "Volume música: ":
			global.volumemusic -= 0.01
			global.volumemusic = clamp(global.volumemusic,0,1)
		break
	}
	
	salvar_volume()
}