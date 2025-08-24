_step += delta;


if _state == 1 {
    event_inherited();
    //direction = point_direction(x, y, global._slug_instance.x, global._slug_instance.y);
    //x += lengthdir_x(1, direction) * delta;
    //y += lengthdir_y(1, direction) * delta;

	image_index += round(delta);
	_gun_index += round(delta);

    if _my_health < 1 {
        _state = 2;
        _death_step = int64(_step);
    }
} else if _state == 0 {
	_spawn_index += round(delta);
	direction = point_direction(x, y, global._slug_instance.x, global._slug_instance.y);
    x += lengthdir_x(1, direction) * delta;
    y += lengthdir_y(1, direction) * delta;
	
	image_index += round(delta);
	
    if _spawn_index > 200 {
        _state = 1;
        _spawn_step = _step;
        image_index = 0;
    }
} else {
    image_index += round(delta);
	//if (_step >= _death_step + 10 && fps > 58) scDistortion(x, y, random(0.5));
	image_xscale += 0.05 * delta;
	image_yscale += 0.05 * delta;
	if _step >= _death_step + 25 {
        instance_destroy();
    }
}