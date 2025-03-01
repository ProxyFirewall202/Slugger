_tick ++;

if (_tick < 60 && _vel > 0 && !(x < 10 || x > room_width - 10 || y < 10 || y > room_height - 10)) {
	x += lengthdir_x(_vel, direction);
	y += lengthdir_y(_vel, direction);
	_vel -= 0.5;
} else {
	if (distance_to_object(oSlug) < 500 && _state == 0) {
		_state = 1;
		_start_distance = distance_to_object(oSlug);
		direction = point_direction(x, y, oSlug.x, oSlug.y);
		x += lengthdir_x((_start_distance - distance_to_object(oSlug)) * 0.01, direction);
		y += lengthdir_y((_start_distance - distance_to_object(oSlug)) * 0.01, direction);
	} else {
		if (_state == 1) {
			direction = point_direction(x, y, oSlug.x, oSlug.y);
			if (!(_start_distance - distance_to_object(oSlug) < 0)) {
				x += lengthdir_x((_start_distance - distance_to_object(oSlug)) * 0.01, direction);
				y += lengthdir_y((_start_distance - distance_to_object(oSlug)) * 0.01, direction);
			} else {
				_state = 0;
			}
		}
	}
}

if place_meeting(x, y, oSlug) {
	global._warped_souls ++;
	instance_destroy();
}