movementSpd = 0
xSpd = 0
ySpd = 0
gravForce = 0.6
maxMoveSpd = 12
maxFallSpd = 24
coyoteTime = 10
maxJumpHeight = -15
alive = true
state = "idle"
sprite_dir = 1

global.pause = false

global.respawnX = x 
global.respawnY = y

spinInd = 0
life_transition = false

if !instance_exists(obj_camera){
	instance_create_depth(-500,0,depth,obj_camera)
}
if !instance_exists(obj_controller){
	instance_create_depth(-500,0,depth,obj_controller)
}