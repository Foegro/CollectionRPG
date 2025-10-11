// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function keybind_translate(key){
	if ((key >= ord("A") && key <= ord("Z")) || (key >= ord("0") && key <= ord("9"))) {
		return chr(key)
	}
	if (key >= vk_f1 && key <= vk_f12) {
		return string(lang_read("keybinds").f,key-vk_f1+1)
	}
	switch (key) {
		case vk_space:
			return lang_read("keybinds").space
		case vk_shift:
			return lang_read("keybinds").shift
		case 162:
			return lang_read("keybinds").ctrl
		case vk_tab:
			return lang_read("keybinds").tab
		case vk_alt:
			return lang_read("keybinds").alt
		case vk_enter:
			return lang_read("keybinds").enter
		case vk_up:
			return lang_read("keybinds").up
		case vk_down:
			return lang_read("keybinds").down
		case vk_left:
			return lang_read("keybinds").left
		case vk_right:
			return lang_read("keybinds").right
		case vk_backspace:
			return lang_read("keybinds").backspace
		case vk_escape:
			return lang_read("keybinds").esc
		case vk_delete:
			return lang_read("keybinds").del
		case vk_end:
			return lang_read("keybinds")._end
		case vk_pageup:
			return lang_read("keybinds").page_up
		case vk_pagedown:
			return lang_read("keybinds").page_down
		default:
			return string(lang_read("keybinds").no_key,key)
	}
}