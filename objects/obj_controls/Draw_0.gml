var surf = surface_create(sprite_width-40,sprite_height-40)
draw_self()
surface_set_target(surf)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
for (var i = 0; i < array_length(controls); i++) {
	if (controls[i] == selected) {
		draw_set_color(c_gray)
		draw_rectangle(0,32*i-offset,sprite_width-40,32+32*i-offset,false)
		draw_set_color(c_black)
	}
	draw_text(sprite_width/2-20,16+32*i-offset,variable_struct_get(lang_read("control_options"),controls[i])+": "+keybind_translate(variable_struct_get(temp_controls,controls[i])))
	draw_set_color(c_white)
}
draw_set_halign(fa_left)
draw_set_valign(fa_top)
surface_reset_target()
draw_surface(surf,bbox_left+20,bbox_top+20)
surface_free(surf)
if (32*array_length(controls) > sprite_height-40) {
	var length = 64
	draw_rectangle(bbox_right-20,bbox_top+20+(sprite_height-40-length)*offset/(32*array_length(controls)-sprite_height+40),bbox_right-24,bbox_top+20+length+(sprite_height-40-length)*offset/(32*array_length(controls)-sprite_height+40),false)
}