var mx = mouse_x-camera_get_view_x(view_camera[0])
var my = mouse_y-camera_get_view_y(view_camera[0])
if (abs(mx-640/2)<64*4-20 && abs(my-480/2)<64*3-20) {
	target_offset = clamp(target_offset+offset_spd,0,64+96*floor(array_length(global.player_stats.inv)/5)-64*6)
}