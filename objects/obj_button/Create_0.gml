txt = lang_read(key)
if (!variable_instance_exists(self,"func")) {
	func = function() {
		show_debug_message("Button with no set function pressed")
	}
}