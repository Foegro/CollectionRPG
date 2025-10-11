var mx = mouse_x-camera_get_view_x(view_camera[0])
var my = mouse_y-camera_get_view_y(view_camera[0])
if (menu_open) {
	for (var i = 0; i < array_length(global.player_stats.inv); i++) {
		if (abs(mx-(64+96*(i%5)-20)) < 32 && abs(my-(64+96*floor(i/5)-offset-20))) {
			
		}
	}
}