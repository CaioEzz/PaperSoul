function outline(xscale = image_xscale, yscale = 1, outtam){
    var outline_color = c_black; 
    var outline_size = outtam;
    if(sprite_index >= 0){
        for (var xx = -outline_size; xx <= outline_size; xx += outline_size) {
            for (var yy = -outline_size; yy <= outline_size; yy += outline_size) {
                if (xx != 0 || yy != 0) { 
                    draw_sprite_ext(sprite_index, image_index, x + xx, y + yy, xscale, yscale, image_angle, outline_color, image_alpha);
                }
            }
        }
    }

}