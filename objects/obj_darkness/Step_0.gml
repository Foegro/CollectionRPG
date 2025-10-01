if (daylight) {
	var cs = animcurve_get(ac_daylight)
	var sc = animcurve_get_channel(cs,"summer")
	var wc = animcurve_get_channel(cs,"winter")
	var t = get_time()
	var si = animcurve_channel_evaluate(sc,(t.hours*60+t.minutes)/day)
	var wi = animcurve_channel_evaluate(wc,(t.hours*60+t.minutes)/day)
	var intensity = 1-lerp(wi,si,global.summer_influence)
} else var intensity = 1

alpha = intensity*level
with (all) {
	other.depth = min(other.depth,depth-1)
}