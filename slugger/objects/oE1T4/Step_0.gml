_step += delta;

if (_spawning) {
	image_angle = point_direction(room_width / 2, room_height / 2, _data.xpos, _data.ypos) - 90;
	
	if (image_index > 88 && _state3_pushed == false) {
		array_push(global._entity_spawns, _data);
		audio_sound_pitch(snEnemySpawn, random_range(0.9, 1.1) * delta);
		audio_play_sound(snEnemySpawn, 1, false);
		
		
		repeat(irandom(10)) {
			var _data_ignore = {
				etype : 1,
				xpos : irandom(room_width),
				ypos : irandom(room_height)
			};
			array_push(global._entity_spawns, _data_ignore);
		}
		_state3_pushed = true;
	}
		if (image_index > 119) {
			_spawning = false;
			image_index = 0;
			image_angle = 0;
		}
}

if _state == 1 {
    image_index += round(delta);
	event_inherited();
    var _spawn_rate = delta / 201;
	if (random(1) < _spawn_rate) {
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
        _death_step = _step;
		_start_time = global._time_scale;
    }
} else if _state == 0 {
    image_index += round(delta);
	if image_index > 179 {
        _state = 1;
        _spawn_step = _step;
		
		_spawning = true;
			image_index = 60
			_state3_pushed = false
			_data = {
				etype : 1,
				xpos : irandom(room_width),
				ypos : irandom(room_height)
			};
    }
} else if _state == 2 {
	global._time_scale -= (global._time_scale + 55) * 0.2;
	image_index += round(delta);
    //if (_step >= _death_step + 10 && fps > 58) scDistortion(x, y, random(0.5));
	if _step >= _death_step + 25 {
        instance_destroy();
    }
}