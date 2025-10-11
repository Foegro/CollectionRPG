var mx = mouse_x-camera_get_view_x(view_camera[0])
var my = mouse_y-camera_get_view_y(view_camera[0])
if (menu_open) {
	#region menu_old
	/*
	draw_sprite_ext(spr_gui,0,640/4,480/2,4,6,0,c_white,1)
	if (selected != -1) draw_sprite_ext(spr_gui,0,640*3/4,480/2,4,6,0,c_white,1)
	
	var surf_inv = surface_create(64*4-40,64*6-40)
	var surf_desc = surface_create(64*4-40,64*6-40)
	
	surface_set_target(surf_inv)
	array_foreach(global.player_stats.inv,function(e,i) {
		if (other.selected == i) {
			draw_set_color(c_gray)
			draw_rectangle(0,32-other.menu_offset_inv+i*64-32,640,32-other.menu_offset_inv+i*64+32,false)
			draw_set_color(c_black)
		}
		var itm = get_item(e.key)
		draw_sprite_ext(itm.image,0,16+16,32-other.menu_offset_inv+i*64,0.25,0.25,0,c_white,1)
		draw_set_valign(fa_middle)
		draw_text(16+32+8,32-other.menu_offset_inv+i*64,e.identified ? variable_struct_get(lang_read("items"),e.key).name : lang_read("items").unidentified)
		draw_set_valign(fa_top)
		draw_set_color(c_white)
	})
	
	surface_reset_target()
	draw_surface(surf_inv,640/4-64*2+20,480/2-64*3+20)
	
	if (selected != -1) {
		var itm = get_item(global.player_stats.inv[selected].key)
		surface_set_target(surf_desc)
		draw_sprite(itm.image,0,64*2-20,96-menu_offset_desc)
		surface_reset_target()
		draw_surface(surf_desc,640*3/4-64*2+20,480/2-64*3+20)
	}
	
	surface_free(surf_inv)
	surface_free(surf_desc)
	
	if (64*array_length(global.player_stats.inv) > 64*6) {
		var length = 64
		draw_rectangle(640/4+64*2-20,480/2-64*3+20+(64*6-40-length)*menu_offset_inv/(64*array_length(global.player_stats.inv)-64*6+40),640/4+64*2-24,480/2-64*3+20+length+(64*6-40-length)*menu_offset_inv/(64*array_length(global.player_stats.inv)-64*6+40),false)
	}
	*/
	#endregion
	draw_sprite_ext(spr_gui,0,320,240,8,6,0,c_white,1)
	var surf = surface_create(64*8-40,64*6-40)
	
	surface_set_target(surf)
	array_foreach(global.player_stats.inv,function(e,i) {
		var mx = mouse_x-camera_get_view_x(view_camera[0])-(320-64*4+20)
		var my = mouse_y-camera_get_view_y(view_camera[0])-(240-64*3+20)
		var hovering = abs(mx-(64+96*(i%5)-20)) < 32 && abs(my-(64+96*floor(i/5)-offset-20)) < 32
		draw_sprite(spr_gui,hovering,64+96*(i%5)-20,64+96*floor(i/5)-offset-20)
		var itm = get_item(e.key)
		itm.draw(64+96*(i%5)-20,64+96*floor(i/5)-offset-20,0.25,0.25,1)
		if (hovering) {
			other.t_tip = e.key
		}
	})
	surface_reset_target()
	
	draw_surface(surf,320-64*4+20,240-64*3+20)
	surface_free(surf)
	if (64+96*floor(array_length(global.player_stats.inv)/5) > 64*6) {
		var length = 64
		draw_rectangle(640/2+64*4-20,480/2-64*3+20+(64*6-40-length)*offset/(64+96*floor(array_length(global.player_stats.inv)/5)-64*6),640/2+64*4-24,480/2-64*3+20+length+(64*6-40-length)*offset/(64+96*floor(array_length(global.player_stats.inv)/5)-64*6),false)
	}
	if (t_tip != "") {
		draw_item_page(mx > 640-336/2 ? mx-336/2 : mx,my > 240 ? my-240 : my,t_tip,0.5,0.5)
		t_tip = ""
	}
}