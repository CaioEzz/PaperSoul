function transition(_room){
	if !instance_exists(obj_transition){
		var t = instance_create_layer(0,0,"Instances",obj_transition)
		t.nextRoom = _room
	}
}