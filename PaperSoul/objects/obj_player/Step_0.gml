#region Movimento
    // Input
    inputX = keyboard_check(vk_right) - keyboard_check(vk_left)

    // Cálculo da velocidade
    if inputX != 0{
        movementSpd = maxMoveSpd
        xSpd = movementSpd * inputX
		image_xscale = inputX
    }

    // Colisão
    if place_meeting(x + xSpd, y, obj_barrier){
        while (!place_meeting(x + sign(xSpd), y, obj_barrier)){
            x += sign(xSpd)
        }
        xSpd = 0
    }

    // Movendo
    xSpd = lerp(xSpd,0,0.5)
    x += xSpd

#endregion

#region Pulando
    // Definindo velocidade ao pular
    if keyboard_check_pressed(ord("Z")) and coyoteTime > 0{
		state = "jump"
        ySpd = maxJumpHeight
        coyoteTime = 0
		if !place_meeting(x+30,y,obj_barrier) and !place_meeting(x-30,y,obj_barrier){
		image_xscale = 2*sign(image_xscale)
		alarm[0] = 1
		}
		image_yscale = 1      
    }

    if place_meeting(x, y+1, obj_barrier){
         coyoteTime = 10
    }
    else{
         ySpd += gravForce
		 coyoteTime--
    }
	
	if keyboard_check_released(ord("Z")) and ySpd < 0{
		coyoteTime = 0
		ySpd *= 0.4
	}

    // Colisão
    if place_meeting(x, y+ySpd, obj_barrier){
        while (!place_meeting(x, y + sign(ySpd), obj_barrier)){
            y += sign(ySpd)
        }
		
		if ySpd > 0{
			scr_explosaoParticula(x,y+sprite_height/2,depth+1,180,ySpd,spr_particulaPontoPequeno,10,0.03,0.1)
			scr_explosaoParticula(x,y+sprite_height/2,depth+1,180,ySpd,spr_particulaPonto,10,0.03,0.1)
		}
		 
		 ySpd = 0
    }

    // Movendo
    y += ySpd
	
	
	// Limitando a velocidade de queda
	if ySpd > maxFallSpd{
		ySpd = maxFallSpd
	}
	

#endregion


#region Sprites
// State machine
if ySpd != 0 and !place_meeting(x,y+1,obj_barrier){
	state = "jump"
}

else if inputX != 0{
	state = "walk"
}

else{
	state = "idle"
}

//Troca de sprite
switch (state){
	case "jump":
		sprite_index = spr_playerJump
		break;
		
	case "walk":
		sprite_index = spr_playerWalk
		break;
	
	case "idle":
		sprite_index = spr_playerIdle
		break;
}

#endregion

#region Efeitos visuais

image_xscale = lerp(image_xscale,sign(image_xscale),0.5)
image_yscale = lerp(image_yscale,1,0.5)

#endregion