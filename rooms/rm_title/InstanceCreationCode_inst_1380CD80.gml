func = function() {
	if (obj_lang_selector.selected != global.lang) {
		global.lang = obj_lang_selector.selected
		save_options()
		game_restart()
	} else {
		layer_select("Options")
	}
}