var mx = mouse_x-camera_get_view_x(view_camera[0])
var my = mouse_y-camera_get_view_y(view_camera[0])
if (menu_open) {
	if (abs(mx-640/4)<64*2-20 && abs(my-480/2)<64*3-20) {
		selected = min(floor((my-480/2+64*2+20+menu_offset_inv+16)/64),array_length(global.player_stats.inv)-1)
	}
}