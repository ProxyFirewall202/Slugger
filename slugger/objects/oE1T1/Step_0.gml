_step += delta;
_gun_index += round(delta);

function bulletCalculation() {
	//Bullet calculation
	var _total_frames = sprite_get_number(sE1Gun1);
	var _shoot_frame = 80;
	var _converted_frame = _gun_index % 120;
	
	if (_converted_frame == 80 && _gun_index > 0 && !_has_shot) {
		var _bullet_data = 
		{
			_vel : 1,
			_max_speed : 16,
			_dir : direction,
			_my_damage : _my_damage
		};
		var _bullet = instance_create_layer(x, y, "Instances", oE1T1Bullet, _bullet_data);
		_has_shot = true;
	}
	
	if (_gun_index != _shoot_frame) _has_shot = false;
}


if _state == 1 {
    event_inherited();
	image_index += round(delta);

	bulletCalculation();
	
    if _my_health < 1 {
        _state = 2;
        _death_step = int64(_step);
    }
} else if _state == 0 {
	_spawn_index += round(delta);
	if (follow) direction = point_direction(x, y, global._slug_instance.x, global._slug_instance.y);
    x += lengthdir_x(distance, direction) * delta;
    y += lengthdir_y(distance, direction) * delta;
	image_index += round(delta);
	
	if (_step >= shoottime) bulletCalculation();
	
    if _spawn_index > 200 {
        _state = 1;
        _spawn_step = _step;
        image_index = 0;
    }
} else {
    image_index += round(delta);
	if (_step >= _death_step + 10 && fps > 58) scDistortion(x, y, random(0.2));
	image_xscale += 0.05 * delta;
	image_yscale += 0.05 * delta;
	if _step >= _death_step + 25 {
        instance_destroy();
    }
}