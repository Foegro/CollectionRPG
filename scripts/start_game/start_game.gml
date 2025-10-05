

function start_game(){
	global.time = 8*hour
	room_goto(rm_foresttest)
	global.player_stats = {
		spd: 5,
		sprint_mod: 1.5,
		sneak_mod: 0.5,
		inv: array_create(10,new item_instance("test_item1")),
		inv_space: 10,
		status_effects: [],
	}
}