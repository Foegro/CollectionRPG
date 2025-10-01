#macro hour 60
#macro day 1440
#macro year 525960
function tick(amount = 1){
	repeat (amount) {
		with (all) event_perform(ev_other,ev_user0)
		global.time++
	}
	show_debug_message(get_time(global.time))
}

function get_summer_winter_ratio(_time = global.time) {
	if (_time % year < year/2) return 1-(_time % year)/(year/2)
	else return ((_time % year)-year/2)/(year/2)
}

function get_time(_time = global.time) {
	var minutes = _time%60
	_time= floor(_time/60)
	var hours = _time%24
	_time = floor(_time/24)
	var days = 21+_time
	var months = 6
	var years = 1345
	var stop = false
	while (!stop) {
		switch (months) {
			case 2:
				if (years % 4 == 0 && days > 29) {
					days -= 29
					months++
				} else if (years % 4 != 0 && days > 28) {
					days -= 28
					months++
				} else stop = true
				break
			case 4: case 6: case 9: case 11:
				if (days > 30) {
					days -= 30
					months++
				} else stop = true
				break
			default:
				if (days > 31) {
					days -= 31
					months++
				} else stop = true
				break
		}
		if (months == 13) {
			months = 1
			years++
		}
	}
	return {
		minutes: minutes,
		hours: hours,
		days: days,
		months: months,
		years: years
	}
}