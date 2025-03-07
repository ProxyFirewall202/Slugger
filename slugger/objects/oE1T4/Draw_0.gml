if (_hit == 1) gpu_set_fog(true,c_white,0,0);
draw_self();
if ((_state == 1) && (_step > _spawn_step)) {
    event_inherited();
}

if (_hit == 1) {
	gpu_set_fog(false,c_white,0,0);
	if (_step > _last_hit + 5) _hit = !_hit;
}

if (_spawning && _state3_pushed) {
	draw_sprite_ext(sEnemySpawnEffect, _spawn_effect_idx, room_width / 2, room_height / 2, 1, point_distance(room_width / 2, room_height / 2, _data.xpos, _data.ypos) / sprite_get_height(sEnemySpawnEffect), point_direction(room_width / 2, room_height / 2, _data.xpos, _data.ypos) - 270, c_white, 1);
	_spawn_effect_idx ++;
	if (_spawn_effect_idx == 30) _spawn_effect_idx = 0;
}