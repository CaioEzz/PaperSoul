function screen_freeze(time) {
        var _t = current_time + time;
        while (current_time < _t) {
    }
}

function screenshake(amount,duration){
	with obj_camera{
		shakeLen = duration
		shakeAmount = amount
	}
}