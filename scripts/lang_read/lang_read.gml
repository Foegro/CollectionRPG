// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function lang_read(key,file = "lang/"+global.lang+".lang"){
	var lang = json_parse(json_read(file))
	if (variable_struct_exists(lang,key)) {
		return variable_struct_get(lang,key)
	} else {
		return "If you read this, there was some kind of unexpected Error"
	}
}