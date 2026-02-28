draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_set_font(fnt_main)
draw_text_colour(room_width/2, room_height/2, texts[index],c_white,c_white,c_white,c_white,alpha);

draw_set_alpha(1);

draw_set_colour(c_white)
draw_set_font(fnt_mainSmall)
draw_text(room_width/2,room_height-30,"Pressione [ Z ] para avançar.\nPressione [ ESC ] para pular. (Poxa, que custa ler?)")