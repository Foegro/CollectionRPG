if (32*array_length(controls) > sprite_height-40) {
	target_offset = clamp(target_offset,0,32*array_length(controls)-sprite_height+40)
	offset = lerp(offset,target_offset,0.1)
}