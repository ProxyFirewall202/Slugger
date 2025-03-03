_step ++;

if _state == 1 {
    event_inherited();

	//AI\
	

    if _my_health < 1 {
        _state = 2;
        _death_step = int64(_step);
        image_speed = 1;
    }
} else if _state == 0 {
    if image_index > 61 {
        _state = 1;
        _spawn_step = _step;
    }
} else {
    //if (_step == _death_step + 10 && fps > 58) scDistortion(x, y, random(0.5));
	if _step == _death_step + 25 {
        instance_destroy();
    }
}