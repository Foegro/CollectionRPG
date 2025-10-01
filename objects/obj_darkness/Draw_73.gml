var surf = surface_create(640,480)
surface_set_target(surf)
draw_clear_alpha(c_black,alpha)
with (obj_light) {
	gpu_set_blendmode(bm_subtract)
	draw_sprite_ext(spr_light,0,x-camera_get_view_x(view_camera[0]),y-camera_get_view_y(view_camera[0]),radius/640,radius/640,0,c_white,intensity)
	gpu_set_blendmode(bm_normal)
}
surface_reset_target()
draw_surface(surf,camera_get_view_x(view_camera[0]),camera_get_view_y(view_camera[0]))
surface_free(surf)