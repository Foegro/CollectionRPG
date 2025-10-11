// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function json_read(file){
	var lang = file_text_open_read(file)	
	var json = ""
	while (true) {
		json += file_text_read_string(lang)
		file_text_readln(lang)
		if (file_text_eof(lang)) break
	}
	file_text_close(lang)
	return json
}