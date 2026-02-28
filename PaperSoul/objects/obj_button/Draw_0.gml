draw_set_font(fnt_main)
escalaX = lerp(escalaX,escalaXAlvo,0.3)
if text = "Volume SFX: "{
	draw_text_transformed_colour(x,y,"< " + text + $"{round(global.volumesfx * 100)} >",escalaX,escalaX,0,color,color,color,color,1)
}
else if text = "Volume música: "{
	draw_text_transformed_colour(x,y,"< " + text + $"{round(global.volumemusic * 100)} >",escalaX,escalaX,0,color,color,color,color,1)
}
else{	
	draw_text_transformed_colour(x,y,text,escalaX,escalaX,0,color,color,color,color,1)
}
