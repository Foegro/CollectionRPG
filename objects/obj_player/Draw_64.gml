var mx = mouse_x-camera_get_view_x(view_camera[0])
var my = mouse_y-camera_get_view_y(view_camera[0])
if (menu_open) {
	draw_sprite_ext(spr_gui,0,640/4,480/2,4,6,0,c_white,1)
	draw_sprite_ext(spr_gui,0,640*3/4,480/2,4,6,0,c_white,1)
	
	var surf_inv = surface_create(64*4-40,64*6-40)
	var surf_desc = surface_create(64*4-40,64*6-40)
	
	surface_set_target(surf_inv)
	array_foreach(global.player_stats.inv,function(e,i) {
		if (other.selected == i) {
			draw_set_color(c_gray)
			draw_rectangle(0,32-other.menu_offset_inv+i*64-32,640,32-other.menu_offset_inv+i*64+32,false)
			draw_set_color(c_black)
		}
		var itm = get_item(e)
		draw_sprite_ext(itm.image,0,16+16,32-other.menu_offset_inv+i*64,0.25,0.25,0,c_white,1)
		draw_set_valign(fa_middle)
		draw_text(16+32+8,32-other.menu_offset_inv+i*64,variable_struct_get(lang_read("items"),e).name)
		draw_set_valign(fa_top)
		draw_set_color(c_white)
	})
	
	surface_reset_target()
	draw_surface(surf_inv,640/4-64*2+20,480/2-64*3+20)
	surface_free(surf_inv)
	surface_free(surf_desc)
	
	if (64*array_length(global.player_stats.inv) > 64*6) {
		var length = 64
		draw_rectangle(640/4+64*2-20,480/2-64*3+20+(64*6-40-length)*menu_offset_inv/(64*array_length(global.player_stats.inv)-64*6+40),640/4+64*2-24,480/2-64*3+20+length+(64*6-40-length)*menu_offset_inv/(64*array_length(global.player_stats.inv)-64*6+40),false)
	}
}