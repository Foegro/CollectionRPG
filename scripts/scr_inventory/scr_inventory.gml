// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function get_inventory_fullness(){
	return array_reduce(global.player_stats.inv,function(p,c,i) {
		return p+c.size
	})
}

function get_inventory_weigth(){
	return array_reduce(global.player_stats.inv,function(p,c,i) {
		return p+c.weight
	})
}