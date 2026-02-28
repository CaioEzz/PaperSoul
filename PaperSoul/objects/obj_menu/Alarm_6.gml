global.botaoLista = []

var nomes = [
"Volume Música",
"Volume SFX",
"Tela cheia"
]

var yy = room_height/2
var count = 0

global.botaoLista[count] = instance_create_depth(
    -100,
    yy + (count * 50),
    depth-1,
    obj_button,
    { text : "Volume música: " }
)
count++

global.botaoLista[count] = instance_create_depth(
    -100,
    yy + (count * 50),
    depth-1,
    obj_button,
    { text : "Volume SFX: " }
)
count++

global.botaoLista[count] = instance_create_depth(
    -100,
    yy + (count * 50),
    depth-1,
    obj_button,
    { text : "Tela cheia" }
)
count++

global.botaoLista[count] = instance_create_depth(
    -100,
    yy + (count * 50),
    depth-1,
    obj_button,
    { text : "Voltar" }
)

global.botaoIndex = 0
global.botaoSelecionado = global.botaoLista[0]