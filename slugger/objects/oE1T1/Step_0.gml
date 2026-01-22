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

event_inherited();
image_index += round(delta);
if (_step >= shoottime) bulletCalculation();
if (_my_health < 1 && _state != 2) {
	_state = 2;
	_death_step = round(_step);
}
if (follow) direction = point_direction(x, y, global._slug_instance.x, global._slug_instance.y);

if (_state == 0) {
	_spawn_index += round(delta);
    x += lengthdir_x(spd * delta, direction) * delta;
    y += lengthdir_y(spd * delta, direction) * delta;
    if (_spawn_index > distance) {
        _state = 1;
        _spawn_step = _step;
        image_index = 0;
    }
} else  if (_state == 2) {
	if (_step >= _death_step + 10 && fps > 58 && global._distortion_enabled) scDistortion(x, y, random(0.2));
	image_xscale += 0.05 * delta;
	image_yscale += 0.05 * delta;
	if (_step >= _death_step + 25) {
        instance_destroy();
    }
}

/*if (_my_id == 1) {
	show_debug_message("state: " + string(_state) + ", _step: " + string(_step) + ", death step: " + string(_death_step));
}*/