if _tick mod 100 < 1 {
	_last_health = _my_health;
	_last_update = _tick;
}

var _health_bar_data = {
	xpos : x,
	ypos : y,
	enemies_list : global._enemies,
	my_id : _my_id,
	my_health : _my_health,
	spr_height : sprite_height,
	spr_width : sprite_width,
	last_health : _last_health,
	tick : _tick,
	last_update : _last_update
};

instance_create_layer(x, y, "HUD", oHealthBar, _health_bar_data);

if (oCrosshair._locked == id && global._lock_on) {
	_select_phase += 0.08;
	_select_idx = sin(_select_phase) * 20;
	draw_sprite_ext(sSelectionArrow, 0, x, y + (120 - _select_idx), 0.07, 0.07, 0, c_white, 1);
	draw_sprite_ext(sSelectionArrow, 0, x, y - (120 - _select_idx), 0.07, 0.07, 180, c_white, 1);
	draw_sprite_ext(sSelectionArrow, 0, x + (120 - _select_idx), y, 0.07, 0.07, 90, c_white, 1);
	draw_sprite_ext(sSelectionArrow, 0, x - (120 - _select_idx), y, 0.07, 0.07, 270, c_white, 1);
}