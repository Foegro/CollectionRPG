variable_struct_set(global.volume,key,clamp(variable_struct_get(global.volume,key)+sign((mouse_x-x))/20,0,1))
update_volume()