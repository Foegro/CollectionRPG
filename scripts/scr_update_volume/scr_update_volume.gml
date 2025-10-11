// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function update_volume(){
	audio_group_set_gain(ag_music,global.volume.master*global.volume.music,0)
	audio_group_set_gain(ag_sfx,global.volume.master*global.volume.sound,0)
}