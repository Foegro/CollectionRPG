enum effect_types {
	custom,
	status,
}
enum status_types {
	movement_mod,
}
global.items = [
	new item("test_item1",1,1),
]
function item(_key, _weight, _size, _image = spr_placeholder) constructor {
	key = _key
	weight = _weight
	size = _size
	image = _image
}

function consumable(_key, _size, _weight, _effects, _image = spr_placeholder, _use_up = true) : item(_key, _size, _weight, _image) constructor {
	effects = _effects
	use_up = _use_up
	static consume = function() {
		array_foreach(effects,function(e,i) {
			switch (e.type) {
				case effect_types.custom:
					e.func()
					break
				case effect_types.status:
					array_push(global.player_stats.status_effects,e.status)
					break
			}
		})
	}
}

function status_effect(_type, _potency, _duration, _apply_time, _degrade_time, _cooldown = 0) constructor {
	type = _type
	potency = _potency
	effect = 0
	duration = _duration
	apply_time = _apply_time
	degrade_time = _degrade_time
	degrading = false
	cooldown = _cooldown
}

function get_item(key) {
	return global.items[array_find_index(global.items,method({key},function(e,i) {
		return e.key == key
	}))]
}

function add_item(key) {
	var itm = get_item(key)
	if (get_inventory_fullness() + itm <= global.player_stats.inv_space) {
		array_push(global.player_stats.inv,key)
		return true
	}
	return false
}