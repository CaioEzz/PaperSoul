x = lerp(x, room_width/2, 0.3)

if global.botaoSelecionado == id {

    if text == "Continuar" || text == "Seleção de nível" {

        if global.fases[0] == 0
        && global.fases[1] == 0
        && global.fases[2] == 0
        && global.fases[3] == 0
        && global.fases[4] == 0
        && global.fases[5] == 0
        && global.fases[6] == 0
        {
            color = c_red
            escalaXAlvo = 1.3
        }
        else {
            color = c_blue
            escalaXAlvo = 1.3
        }

    }
    else {
        color = c_blue
        escalaXAlvo = 1.3
    }

}
else {
    color = c_black
    escalaXAlvo = 1
}