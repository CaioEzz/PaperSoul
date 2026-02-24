// PAUSE GLOBAL
if global.pause {
    xSpd = 0
    ySpd = 0
    exit;
}

if alive {

    #region Movimento
    inputX = keyboard_check(vk_right) - keyboard_check(vk_left)

    var targetX = inputX * maxMoveSpd
    xSpd = lerp(xSpd, targetX, 0.3)

    if inputX != 0{
        sprite_dir = sign(inputX)
    }
	#endregion


	#region Pulando

	    if keyboard_check_pressed(ord("Z")) and coyoteTime > 0{
	        state = "jump"
	        ySpd = maxJumpHeight
	        coyoteTime = 0
	        alarm[0] = 1   
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

	#endregion

	if place_meeting(x, y + ySpd, obj_barrier){
	    while (!place_meeting(x, y + sign(ySpd), obj_barrier)){
	        y += sign(ySpd)
	    }

	    if ySpd > 0{
	        scr_explosaoParticula(x,y+sprite_height/2,depth+1,180,ySpd,spr_particulaPontoPequeno,10,0.03,0.1)
	        scr_explosaoParticula(x,y+sprite_height/2,depth+1,180,ySpd,spr_particulaPonto,10,0.03,0.1)
	    }

	    ySpd = 0
	}

	y += ySpd

	if ySpd > maxFallSpd{
	    ySpd = maxFallSpd
	}

	if place_meeting(x + xSpd, y, obj_barrier){
	    while (!place_meeting(x + sign(xSpd), y, obj_barrier)){
	        x += sign(xSpd)
	    }
	    xSpd = 0
	}

	x += xSpd


    #region Sprites

        if ySpd != 0 and !place_meeting(x,y+1,obj_barrier){
            state = "jump"
        }
        else if inputX != 0{
            state = "walk"
        }
        else{
            state = "idle"
        }

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
}

else{
	if alarm[2] <= 0{
		sprite_index = spr_playerSoul
	}else{
		sprite_index = spr_playerRespawn
	}

    inputX = keyboard_check(vk_right) - keyboard_check(vk_left)
    inputY = keyboard_check(vk_down) - keyboard_check(vk_up)

    var targetX = inputX * maxMoveSpd
    var targetY = inputY * maxMoveSpd

    xSpd = lerp(xSpd, targetX, 0.3)
    ySpd = lerp(ySpd, targetY, 0.3)

    // COLISÃO HORIZONTAL
    if place_meeting(x + xSpd, y, obj_barriermaster){
        while (!place_meeting(x + sign(xSpd), y, obj_barriermaster)){
            x += sign(xSpd)
        }
        xSpd = 0
    }

    x += xSpd

    // COLISÃO VERTICAL
    if place_meeting(x, y + ySpd, obj_barriermaster){
        while (!place_meeting(x, y + sign(ySpd), obj_barriermaster)){
            y += sign(ySpd)
        }
        ySpd = 0
    }

    y += ySpd

    if inputX != 0 {
        sprite_dir = sign(inputX)
    }
	
	if keyboard_check_pressed(ord("Z")){
		life_transition = true
	}
	if life_transition = true{
		x = lerp(x,global.respawnX,0.1)
		y = lerp(y,global.respawnY,0.1)
		spinInd += 1
		if spinInd > 90{
			switch_world()
		}
	}
}

#region Efeitos visuais

image_angle += spinInd
image_xscale = sprite_dir

#endregion


show_debug_message($"{xSpd} // {ySpd}")