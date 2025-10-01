var r = keyboard_check(global.controls.right)
var u = keyboard_check(global.controls.up)
var l = keyboard_check(global.controls.left)
var d = keyboard_check(global.controls.down)
var sp = keyboard_check(global.controls.sprint)
var sn = keyboard_check(global.controls.sneak)
var m = keyboard_check_pressed(global.controls.menu)

if (m) menu_open = !menu_open

if (menu_open) {
	speed = 0
	if (64*array_length(global.player_stats.inv) > 64*6) {
		target_offset_inv = clamp(target_offset_inv,0,32+array_length(global.player_stats.inv)*64-64*6)
		menu_offset_inv = lerp(menu_offset_inv,target_offset_inv,0.1)
	}
} else {
	var real_spd = global.player_stats.spd
	if (sp) real_spd *= global.player_stats.sprint_mod
	else if (sn) real_spd *= global.player_stats.sneak_mod

	var spd_mods = ds_list_create()
	instance_place_list(x,y,obj_speed_mod,spd_mods,false)

	for (var i = 0; i < ds_list_size(spd_mods); i++) {
		real_spd *= ds_list_find_value(spd_mods,i).speed_mod
	}

	ds_list_destroy(spd_mods)

	for (var i = 0; i < array_length(global.player_stats.status_effects); i++) {
		if (global.player_stats.status_effects[i].type == status_types.movement_mod) real_spd *= 1+global.player_stats.status_effects[i].effect
	}

	if (r) hspeed = real_spd
	else if (l) hspeed = -real_spd
	else hspeed = 0
	if (u) vspeed = -real_spd
	else if (d) vspeed = real_spd
	else vspeed = 0

	if (place_meeting(x+hspeed,y,obj_col)) {
		while (!place_meeting(x+sign(hspeed),y,obj_col)) x += sign(hspeed)
		hspeed = 0
	}
	if (place_meeting(x,y+vspeed,obj_col)) {
		while (!place_meeting(x,y+sign(vspeed),obj_col)) y += sign(vspeed)
		vspeed = 0
	}

	speed = min(speed,real_spd)
}