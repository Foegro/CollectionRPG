var mx = mouse_x-camera_get_view_x(view_camera[0])
var my = mouse_y-camera_get_view_y(view_camera[0])
if (abs(mx-640/4)<64*2-20 && abs(my-480/2)<64*3-20) {
	target_offset_inv = clamp(target_offset_inv-offset_spd,0,32+array_length(global.player_stats.inv)*64-64*6)
}