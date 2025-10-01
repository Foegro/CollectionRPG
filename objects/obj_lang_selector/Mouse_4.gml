if (abs(mouse_x-x)<sprite_width/2-20 && abs(mouse_y-y)<sprite_height/2-20) {
	var index = floor((mouse_y+offset-bbox_top-20)/32)
	if (index < array_length(langs)) {
		selected = langs[index].short
	}
}