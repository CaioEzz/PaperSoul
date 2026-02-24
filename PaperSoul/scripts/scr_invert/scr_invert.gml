function invert_colors()
{
    gpu_set_blendmode_ext(bm_inv_dest_colour, bm_zero);
    draw_rectangle_colour(0, 0, room_width, room_height, c_white, c_white, c_white, c_white, false);
    gpu_set_blendmode(bm_normal);
}