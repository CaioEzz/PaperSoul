global.botaoLista = []

var nomes = [
"\"1-1 Primeiros passos\"",
"\"1-2 Descanse em paz\"",
"\"1-3 O céu é o limite\"",
"\"1-4 Volta e meia vamos dar\"",
"\"1-5 Olha o macaco!\"",
"\"1-6 Choque do trovão\"",
"\"1-7 Raiz da Esperança\""
]

var yy = room_height/2
var count = 0

for (var i = 0; i < 7; i++) {

    if global.fases[i] == 1 {

        global.botaoLista[count] = instance_create_depth(
            -100,
            yy + (count * 50)-50,
            depth-1,
            obj_button,
            { text : nomes[i] }
        )

        count++
    }
}

// Botão Voltar sempre existe
global.botaoLista[count] = instance_create_depth(
    -100,
    yy + (count * 50)-50,
    depth-1,
    obj_button,
    { text : "Voltar" }
)

// Seleção inicial
global.botaoIndex = 0
global.botaoSelecionado = global.botaoLista[0]