if world = "life"{
	if obj_player.alive = false{image_alpha = 0 exit}else{image_alpha = 1}
}
else if world = "death"{
	if obj_player.alive = true{image_alpha = 0 exit}else{image_alpha = 1}
}

if point_distance(obj_player.x,obj_player.y,x,y) < 120{
	textAlpha = 1
	textTimer++
	if textTimer >= textSpeed {
		textTimer = 0
		if charId <= string_length(text){
			textFinal = string_copy(text,1,charId)
			textScale = random_range(1,1.2)
			charId += 1
		}
	}
}
else{
	textAlpha -= 0.05
}
if textAlpha < 0.05{
	textFinal = ""
	charId = 0
	textTimer = 0
}
if obj_player.alive = true{
	var _color = c_black
}
else{
	var _color = c_white
}
draw_text_ext_transformed_colour(x,y - 120,$"{textFinal}",20,250,textScale,textScale,0,_color,_color,_color,_color,textAlpha)

textScale = lerp(textScale,1,0.2)
