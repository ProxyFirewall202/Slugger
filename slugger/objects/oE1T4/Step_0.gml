_step ++;

if _state == 1 {
    event_inherited();
    if irandom(100) == 0 {
		if global._current_enemy_id > -1 {
			_state = 3;
			image_index = 60
			_state3_pushed = false
		}
	}
	
	if image_index > 59 image_index = 0;
	
    if _my_health < 1 {
        _state = 2;
		image_index = 180;
        _death_step = real(_step);
    }
} else if _state == 0 {
    if image_index > 179 {
        _state = 1;
        _spawn_step = _step;
        image_index = 0;
    }
} else if _state == 2 {
    //if (_step == _death_step + 10 && fps > 58) scDistortion(x, y, random(0.5));
	if _step == _death_step + 25 {
        instance_destroy();
    }
} else {
	if (image_index > 88 && !_state3_pushed) {
		repeat(irandom(5) + 1) {
			array_push(global._entity_spawns, 1);
		}
		_state3_pushed = true;
	}
	if (image_index > 119) {
		_state = 1;
		image_index = 0;
	}
}