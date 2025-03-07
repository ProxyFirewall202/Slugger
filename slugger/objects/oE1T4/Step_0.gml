_step ++;

if (_spawning) {
	image_angle = point_direction(room_width / 2, room_height / 2, _data.xpos, _data.ypos) - 90;
	
	if (image_index > 88 && _state3_pushed == false) {
		array_push(global._entity_spawns, _data);
		
		
		/*repeat(irandom(5)) {
			var _data_ignore = {
				etype : 1,
				xpos : irandom(room_width),
				ypos : irandom(room_height)
			};
			array_push(global._entity_spawns, _data_ignore);
		}*/
		_state3_pushed = true;
	}
		if (image_index > 119) {
			_spawning = false;
			image_index = 0;
		}
}

if _state == 1 {
    event_inherited();
    if irandom(10) == 0 {
		if (global._current_enemy_id > -1 && _spawning == false) {
			_spawning = true;
			image_index = 60
			_state3_pushed = false
			_data = {
				etype : 1,
				xpos : irandom(room_width),
				ypos : irandom(room_height)
			};
		}
	}
	
	if (image_index > 59 && _spawning == false) image_index = 0;
	
    if _my_health < 1 {
        _state = 2;
		_spawning = false;
		image_index = 180;
        _death_step = real(_step);
    }
} else if _state == 0 {
    if image_index > 179 {
        _state = 1;
        _spawn_step = _step;
        image_index = 0;
    }
} else if _state == 2{
    //if (_step == _death_step + 10 && fps > 58) scDistortion(x, y, random(0.5));
	if _step == _death_step + 25 {
        instance_destroy();
    }
}