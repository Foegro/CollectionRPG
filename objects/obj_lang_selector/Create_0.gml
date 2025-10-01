langs = []
var file = "lang/"+file_find_first("lang/*.lang",fa_none)
array_push(langs,{
	name: lang_read("lang",file),
	short: string_copy(file,6,2)
})
while (true) {
	var file = "lang/"+file_find_next()
	if (file != "lang/") {
		array_push(langs,{
			name: lang_read("lang",file),
			short: string_copy(file,6,2)
		})		
	} else {
		file_find_close()
		break
	}
}
array_sort(langs,function(e1,e2) {
	var arr = [e1,e2]
	array_sort(arr,true)
	return e1 == arr[0]
})
selected = global.lang
offset = 0
target_offset = 0
offset_spd = 16