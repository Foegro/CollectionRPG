function status_effect(type, potency, duration, apply_time, degrade_time, cooldown = 0) constructor {
	self.type = type
	self.potency = potency
	effect = 0
	start_effect = 0
	self.duration = duration
	self.apply_time = apply_time
	self.degrade_time = degrade_time
	degrading = false
	self.cooldown = cooldown
}

function get_status_mod(type, target = self) {
	var status = target.object_index == obj_player ? global.player_stats.status_effects : target.status_effects
	var idx = array_find_index(status,method({type},function(e,i){
		return type == e.type
	}))
	return idx == -1 ? 1 : 1+status[idx].effect
}

function status_tick(status) {
	for (var i = 0; i < array_length(status); i++) {
		if (status[i].cooldown > 0) {
			status[i].cooldown--
		} else if (status[i].effect != status[i].potency && !status[i].degrading) {
			status[i].effect += (status[i].potency-status[i].start_effect)/status[i].apply_time
		} else if (status[i].duration > 0 && status[i].effect != 0) {
			status[i].effect = status[i].potency
			status[i].duration--
		} else if (status[i].effect != 0) {
			status[i].degrading = true
			status[i].effect -= status[i].potency/status[i].degrade_time
		} else {
			array_delete(status,i,1)
			i--
		}
	}
	return status
}

function status_add(status,target = self) {
	var arr = target.object_index == obj_player ? global.player_stats.status_effects : target.status_effects
	var idx = array_find_index(arr, method({status},function(e,i) {
		return e.type == status.type
	}))
	if (idx == -1) {
		array_push(arr,status)
	} else {
		arr[idx].degrading = false
		var big_status = arr[idx].potency > status.potency ? arr[idx] : status
		var small_status = arr[idx].potency > status.potency ? status : arr[idx]
		arr[idx].apply_time = max(big_status.apply_time,small_status.apply_time)
		arr[idx].duration = big_status.duration+round(small_status.duration*small_status.potency/big_status.potency)
		arr[idx].degrade_time = max(big_status.degrade_time,small_status.degrade_time)
		arr[idx].potency = big_status.potency
	}
}