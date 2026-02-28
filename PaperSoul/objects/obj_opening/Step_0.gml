// Detecta apertar Z (apenas uma vez)
if alpha < 0.3 and index = 7{
	instance_destroy()
}

if keyboard_check_pressed(ord("Z")) {
    pressed = true;
}


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
	            exit;
	        } else {
	            state = "fadein";
	        }
	    }
	break;

}

show_debug_message(index)