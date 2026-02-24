if !surface_exists(surf) {
	surf = surface_create(display_get_width(), display_get_height())
}

surface_set_target(surf)
draw_clear_alpha(c_black, 1)

draw_set_color(c_black)
draw_rectangle(0,0,display_get_width(),display_get_height(),false)

gpu_set_blendmode(bm_subtract)
draw_circle(
	obj_player.x - camera_get_view_x(view_camera[0]),
	obj_player.y - camera_get_view_y(view_camera[0]),
	raio,
	false
)
gpu_set_blendmode(bm_normal)

surface_reset_target()

draw_surface(surf,0,0)