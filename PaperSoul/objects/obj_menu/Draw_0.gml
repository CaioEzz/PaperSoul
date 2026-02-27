if alarm[0] <= 0{
	blackScreenAlpha -= 0.01
}

draw_sprite_ext(spr_blackScreen,0,0,0,1,1,0,c_black,blackScreenAlpha)
draw_sprite_ext(spr_logo,0,xx,yy,logoScale,logoScale,logoRot,c_white,logoDraw)

logoScale = lerp(logoScale,1,0.2)
logoRot = lerp(logoRot,0,0.3)

xx = lerp(xx,logoX,0.2)
yy = lerp(yy,logoY,0.2)

draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_set_font(fnt_mainSmall)
draw_set_color(c_black)
draw_text(room_width/2,room_height-20,"Shin Studios (2026) - Todos os direitos reservados.")
draw_set_color(c_white)


if alarm[2] <= 0 and alarm[1] <= 0 and ZPressed = false and logoDraw = true{
	draw_set_font(fnt_main)
	draw_text_color(room_width/2,room_height/2+180,"Pressione [ Z ] para iniciar.",c_black,c_black,c_black,c_black,blinkTime)
	blinkTime += blinkTimeAdd
	if blinkTime >= 1 or blinkTime = 0{
		blinkTimeAdd *= -1
	}
}

