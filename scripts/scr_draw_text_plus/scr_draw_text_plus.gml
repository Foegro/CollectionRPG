// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
enum param_type {
	color,
	sprite,
	font,
	alpha,
}
function eval_text_param(param) {
	switch(string_char_at(param,3)) {
		case "C":
			return {
				type: param_type.color,
				color: real("0x"+string_copy(param,4,6))
			}
		case "S":
			var spr = ""
			for (var i = 4; string_copy(param,i,2)!="}}"; i++) {
				spr += string_char_at(param,i)
			}
			return {
				type: param_type.sprite,
				sprite: asset_get_index(spr)
			}
		case "F":
			var fnt = ""
			for (var i = 4; string_copy(param,i,2)!="}}"; i++) {
				fnt += string_char_at(param,i)
			}
			return {
				type: param_type.font,
				font: asset_get_index(fnt)
			}
		case "A":
			var a = ""
			for (var i = 4; string_copy(param,i,2)!="}}"; i++) {
				a += string_char_at(param,i)
			}
			return {
				type: param_type.alpha,
				alpha: real(a)
			}
	}
}
function draw_text_plus(_x, _y, _string) {
	draw_text_plus_ext(_x, _y, _string, -1, infinity)
}
function draw_text_plus_ext(_x, _y, _string, sep, w){
	if (sep == -1) sep = string_height("W")*1.5
	var d_col = draw_get_color()
	var d_fnt = draw_get_font()
	var d_alpha = draw_get_alpha()
	var tw = 0
	var th = 0
	var spr_height = 0
	for (var i = 1; i <= string_length(_string)+1; i++) {
		if (string_char_at(_string,i) == "{" && string_char_at(_string,i+1) == "{") {
			var param = ""
			for (;string_copy(_string,i-2,2) != "}}";i++) {
				if (i != 0)
					param += string_char_at(_string,i)
			}
			var ps = eval_text_param(param)
			switch (ps.type) {
				case param_type.color:
					draw_set_color(ps.color)
					break
				case param_type.font:
					draw_set_font(ps.font)
					if (sep == -1) sep = string_height("W")*1.5
					break
				case param_type.alpha:
					draw_set_alpha(ps.alpha)
					break
				case param_type.sprite:
					if (tw + sprite_get_width(ps.sprite) > w) {
						tw = 0
						th += max(sep,spr_height)
						spr_height = 0
					}
					draw_sprite(ps.sprite,0,_x+tw+sprite_get_xoffset(ps.sprite),_y+th+sprite_get_yoffset(ps.sprite))
					tw += sprite_get_width(ps.sprite)
					spr_height = max(spr_height,sprite_get_height(ps.sprite))
					break
			}
		}
		var wrd = ""
		for (; string_char_at(_string,i) != " " && string_char_at(_string,i) != "{" && i < string_length(_string)+1; i++) {
			wrd += string_char_at(_string,i)
		}
		if (tw + string_width(wrd) > w) {
			tw = 0
			th += max(sep,spr_height)
			spr_height = 0
		}
		draw_text(_x+tw,_y+th,wrd)
		tw += string_width(wrd+" ")
	}
	draw_set_color(d_col)
	draw_set_font(d_fnt)
	draw_set_alpha(d_alpha)
}