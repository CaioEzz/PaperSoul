if (shakeLen >= 1) {
    var xShake = targetX + irandom_range(-shakeAmount, +shakeAmount);
    var yShake = targetY + irandom_range(-shakeAmount, +shakeAmount);
    camera_set_view_pos(cam, xShake, yShake);
    shakeLen -= 1;
}
else{
	camera_set_view_pos(cam,targetX,targetY)
}
