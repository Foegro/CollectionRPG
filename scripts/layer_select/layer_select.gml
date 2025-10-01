// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function layer_select(lyr){
	instance_deactivate_all(false)
	if (typeof(lyr) == "string") instance_activate_layer(layer_get_id(lyr))
	else instance_activate_layer(lyr)
	instance_activate_object(obj_utility)
}