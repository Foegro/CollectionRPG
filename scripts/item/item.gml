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
function item_instance(_key) constructor{
	key = _key
	identified = false
	static identify = function() {
		var itm = get_item(key)
		tick(itm.identification_time*power(itm.knowledge_identification_influence,itm.knowledge))
		itm.add_knowledge()
	}
}

function item(_key, _weight = 1, _size = 1, _knowledge_rate = 0.5, _identification_time = 10, _knowledge_identification_influence = 0.9, _image = spr_placeholder) constructor {
	key = _key
	weight = _weight
	size = _size
	image = _image
	knowledge_rate = _knowledge_rate
	knowledge = 0
	identification_time = _identification_time
	knowledge_identification_influence = _knowledge_identification_influence
	static add_knowledge = function(_knowledge = knowledge_rate) {
		global.items[array_find_index(global.items,method({key},function(e,i) {
			return e.key = key
		}))].knowledge += _knowledge
	}
}

function consumable(_key, _weight = 1, _size = 1, _knowledge_rate = 0.5, _identification_time = 10, _knowledge_identification_influence = 0.9, _effects = [], _image = spr_placeholder, _use_up = true) : item(_key, _weight, _size, _knowledge_rate, _identification_time, _knowledge_identification_influence, _image) constructor {
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