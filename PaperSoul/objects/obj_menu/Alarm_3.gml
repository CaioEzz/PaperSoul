logoY = (room_height/2)-200

global.botaoLista = [
	instance_create_depth(-100,(room_height/2),depth-1,obj_button,{text:"Novo jogo"}),
	instance_create_depth(-100,(room_height/2)+50,depth-1,obj_button,{text:"Continuar"}),
	instance_create_depth(-100,(room_height/2)+100,depth-1,obj_button,{text:"Seleção de nível"}),
	instance_create_depth(-100,(room_height/2)+150,depth-1,obj_button,{text:"Opções"}),
	instance_create_depth(-100,(room_height/2)+200,depth-1,obj_button,{text:"Fechar jogo"}),
]

global.botaoIndex = 0
global.botaoSelecionado = global.botaoLista[0]

alarm[4] = 5