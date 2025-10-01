draw_set_font(fnt_default)
if (file_exists("options.json")){
	load_options()
} else {
	global.controls = {
		up: ord("W"),
		left: ord("A"),
		down: ord("S"),
		right: ord("D"),
		sprint: vk_shift,
		sneak: ord("C"),
		interact: vk_space
	}
	if (file_find_first("lang/"+os_get_language()+".lang",fa_none) != "") global.lang = os_get_language()
	else global.lang = "en"
	global.volume = {
		master: 1,
		music: 1,
		sound: 1
	}
}
update_volume()