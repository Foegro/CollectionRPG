if (abs(mouse_x-x) < sprite_width/2 && abs(mouse_y-y) < sprite_height/2) {
	variable_struct_set(global.volume,key,clamp(variable_struct_get(global.volume,key)-.01,0,1))
	update_volume()
}