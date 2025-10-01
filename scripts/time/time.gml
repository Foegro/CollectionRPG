#macro hour 60
#macro day 1440
#macro year 525960
global.summer_influence = 1
global.influence_direction = -1
function tick(amount = 1){
	repeat (amount) {
		with (all) event_perform(ev_other,ev_user0)
		global.time++
		global.summer_influence += global.influence_direction*1/(year/2)
		if ((global.summer_influence == 1 && global.influence_direction == 1) || (global.summer_influence == 0 && global.influence_direction == -1)) global.influence_direction *= -1
	}
}

function get_time(_time = global.time) {
	var minutes = _time%60
	_time= floor(_time/60)
	var hours = _time%24
	_time = floor(_time/24)
	var days = 21
	var months = 6
	var years = 1345
	while (_time > 0) {
		days++
		switch (months) {
			case 2:
				if ((years % 4 == 0 && days == 30) || (years % 4 != 0 && days == 29)) {
					days = 1
					months++
				}
			case 4: case 6: case 9: case 11:
				if (days == 31) {
					days = 1
					months++
				}
				break
			default:
				if (days == 32) {
					days = 1
					months++
				}
				break
		}
		if (months == 13) {
			months = 1
			years++
		}
		_time--
	}
	return {
		minutes: minutes,
		hours: hours,
		days: days,
		months: months,
		years: years
	}
}