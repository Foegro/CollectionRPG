if (mus != noone && !audio_is_playing(mus)) {
	audio_stop_all()
	c_mus = audio_play_sound(mus,100,true)
}