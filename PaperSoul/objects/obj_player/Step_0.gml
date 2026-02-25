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

    var onGround = place_meeting(x, y + 1, obj_barrier)
    var touchingWall = place_meeting(x + sign(inputX), y, obj_barrier)

    // COYOTE TIME válido apenas no chão e não encostado em parede
    if (onGround && ySpd >= 0 && !touchingWall){
        coyoteTime = 10
    } else {
        ySpd += gravForce
        coyoteTime--
    }

    // PULO
    if keyboard_check_pressed(ord("Z")) && coyoteTime > 0 && !touchingWall{
        state = "jump"
        ySpd = maxJumpHeight
        coyoteTime = 0
        alarm[0] = 1
    }

    // CORTE DE PULO
    if keyboard_check_released(ord("Z")) && ySpd < 0{
        ySpd *= 0.4
        coyoteTime = 0
    }

    #endregion


    // COLISÃO VERTICAL
    if place_meeting(x, y + ySpd, obj_barrier){
        while (!place_meeting(x, y + sign(ySpd), obj_barrier)){
            y += sign(ySpd)
        }

        if ySpd > 0{
            if place_meeting(x, y + 1, obj_plataformaNuvem){
                scr_explosaoParticula(x, y + sprite_height/2, depth+1, 180, ySpd, spr_particleCloud, 10, 0.03, 0.1)
            } else {
                scr_explosaoParticula(x, y + sprite_height/2, depth+1, 180, ySpd, spr_particulaPontoPequeno, 10, 0.03, 0.1)
                scr_explosaoParticula(x, y + sprite_height/2, depth+1, 180, ySpd, spr_particulaPonto, 10, 0.03, 0.1)
            }
        }

        ySpd = 0
    }

    y += ySpd

    if ySpd > maxFallSpd{
        ySpd = maxFallSpd
    }

    // COLISÃO HORIZONTAL
   if abs(xSpd) > 0.1 {
	    if place_meeting(x + xSpd, y, obj_barrier){
	        while (!place_meeting(x + sign(xSpd), y, obj_barrier)){
	            x += sign(xSpd)
        }
        xSpd = 0
	    }
	}

    x += xSpd


    #region Sprites

    if ySpd != 0 && !place_meeting(x, y+1, obj_barrier){
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
        break

        case "walk":
            sprite_index = spr_playerWalk
        break

        case "idle":
            sprite_index = spr_playerIdle
        break
    }

    #endregion
}

else{

    if alarm[2] <= 0{
        sprite_index = spr_playerSoul
    } else {
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

    if life_transition { // corrigido
        x = lerp(x, global.respawnX, 0.1)
        y = lerp(y, global.respawnY, 0.1)
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

