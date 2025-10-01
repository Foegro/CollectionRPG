var touching = instance_place(x,y,target)
if (touching != noone && (touch || keyboard_check_pressed(global.controls.interact))) func(touching)