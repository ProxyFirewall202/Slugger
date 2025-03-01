if _tick mod 100 == 0 {
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