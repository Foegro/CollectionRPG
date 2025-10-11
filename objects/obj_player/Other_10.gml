global.player_stats.status_effects = status_tick(global.player_stats.status_effects)
for (var i = 0; i < array_length(global.player_stats.inv); i++) {
	global.player_stats.inv[i].age++
	array_foreach(struct_get_names(global.player_stats.inv[i].age_funcs),method({itm: global.player_stats.inv[i]},function(e,i) {
		if (int64(e) == itm.age) {
			variable_struct_get(itm.age_funcs,e)()
		}
	}))
}