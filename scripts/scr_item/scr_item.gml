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

function item_instance(key,data = {},age_funcs = {}) constructor{
	self.key = key
	self.data = data
	age = 0
	self.age_funcs = age_funcs
}

function item(key, weight = 1, size = 1, image = spr_placeholder) constructor {
	self.key = key
	self.weight = weight
	self.size = size
	if (typeof(image) == "ref") {
		self.image = image
		draw = function(_x,_y,xscale = 1, yscale = 1, alpha = 1) {
			draw_sprite_ext(image,0,_x,_y,xscale,yscale,0,c_white,alpha)
		}
	} else {
		draw = image
	}
}

function consumable(key, weight = 1, size = 1, effects = [], image = spr_placeholder, use_up = true) : item(key, weight, size, image) constructor {
	self.effects = effects
	self.use_up = use_up
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

function draw_item_page(_x,_y,key,xscale,yscale) {
	var surf = surface_create(336,480)
	var itm = get_item(key)
	var o_fnt = draw_get_font()
	var o_col = draw_get_color()
	surface_set_target(surf)
	draw_sprite(spr_notebook_page,0,0,0)
	itm.draw(64,64,0.5,0.5,1)
	draw_set_font(fnt_notebook)
	draw_set_color(c_black)
	var item_notes = variable_struct_get(global.item_notes,key) ?? { name: "????????", desc: "" }
	draw_text_plus(120,48,item_notes.name)
	draw_text_plus_ext(24,112,item_notes.desc,48,288)
	draw_set_font(o_fnt)
	draw_set_color(o_col)
	surface_reset_target()
	draw_surface_ext(surf,_x,_y,xscale,yscale,0,c_white,1)
	surface_free(surf)
}