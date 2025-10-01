for (var i = 0; i < array_length(global.player_stats.status_effects); i++) {
	if (global.player_stats.status_effects[i].cooldown > 0) {
		global.player_stats.status_effects[i].cooldown--
	} else if (global.player_stats.status_effects[i].effect != global.player_stats.status_effects[i].potency && !global.player_stats.status_effects[i].degrading) {
		global.player_stats.status_effects[i].effect += global.player_stats.status_effects[i].potency/global.player_stats.status_effects[i].apply_time
	} else if (global.player_stats.status_effects[i].duration > 0) {
		global.player_stats.status_effects[i].effect = global.player_stats.status_effects[i].potency
		global.player_stats.status_effects[i].duration--
	} else if (global.player_stats.status_effects[i].effect != 0) {
		global.player_stats.status_effects[i].degrading = true
		global.player_stats.status_effects[i].effect -= global.player_stats.status_effects[i].potency/global.player_stats.status_effects[i].degrade_time
	} else {
		array_delete(global.player_stats.status_effects,i,1)
		i--
	}
}