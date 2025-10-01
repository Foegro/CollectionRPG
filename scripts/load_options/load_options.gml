// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function load_options(){
	var save = json_parse(json_read("options.json"))
	global.controls = save.controls
	global.lang = save.lang
	global.volume = save.volume
}