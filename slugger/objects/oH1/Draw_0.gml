if (_hit == 1) gpu_set_fog(true,c_white,0,0);
draw_self();
if _state == 1 && _step > _spawn_step {
    event_inherited();
}

if (_hit == 1) {
	gpu_set_fog(false,c_white,0,0);
	if (_step > _last_hit + 5) _hit = !_hit;
}