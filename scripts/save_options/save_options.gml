// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function save_options(lang = global.lang, controls = global.controls, volume = global.volume){
	var save = {
		lang: lang,
		controls: controls,
		volume: volume
	}
	var ssave = json_stringify(save,true)
	var file = file_text_open_write("options.json")
	file_text_write_string(file,ssave)
	file_text_close(file)
}