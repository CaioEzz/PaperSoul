// Detecta apertar Z (apenas uma vez)
if keyboard_check_pressed(ord("Z")) {
    pressed = true;
}

// Máquina de estados
switch(state){

    case "fadein":
        alpha += fadeSpd;
        if alpha >= 1 {
            alpha = 1;
            state = "wait";
        }
    break;


    case "wait":
        if pressed {
            pressed = false;
            state = "fadeout";
        }
    break;


    case "fadeout":
        alpha -= fadeSpd;
        if alpha <= 0 {
            alpha = 0;
            index++;

            if index >= array_length(texts) {
                transition(rm_level01);
            }

            state = "fadein";
        }
    break;

}