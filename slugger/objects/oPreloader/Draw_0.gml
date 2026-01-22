draw_set_font(fDLEComicLowercase);
draw_text_transformed_colour(
	300,
	room_height / 2,
	"Preloading game textures into GPU VRAM - " + string(round(global._preload_percent)) + "% complete",
	3,
	3,
	0,
	c_green,
	c_green,
	c_aqua,
	c_aqua,
	1
);
draw_text_transformed_colour(
	400,
	800,
	"This game is in pre-alpha and is nowhere near finished!",
	3,
	3,
	0,
	c_green,
	c_green,
	c_aqua,
	c_aqua,
	1
);
draw_text_transformed_colour(
	100,
	900,
	"Controls: Left ALT to lock to target, WASD to move, left click to shoot, Z for previous element and C for next element.",
	2,
	2,
	0,
	c_green,
	c_green,
	c_aqua,
	c_aqua,
	1
);





if (keyboard_check_pressed(vk_enter)) _sprite_index = array_length(_sprites_list);

if (_thumbnail_tick < 180) {
	_thumbnail_tick ++;
	if (_thumbnail_tick > 60) _alpha -= 0.01;
	draw_sprite_ext(sThumbnail, 0, 0, 0, 1, 1, 0, c_white, _alpha);
}

if (_sprite_index < array_length(_sprites_list)) {
	var _spr = _sprites_list[_sprite_index];
	draw_sprite(_spr, _subimg_index, -100000, -100000);
	_subimg_index ++;
	_completed_steps ++;
	
	global._preload_percent = clamp((_completed_steps / _total_steps) * 100, 0, 100);
	
	if (_subimg_index >= sprite_get_number(_spr)) {
		_subimg_index = 0;
		_sprite_index ++;
	}
} else {
	global._preload_done = true;
	scInitRun();
	instance_destroy();
}

show_debug_message(string(global._preload_percent));