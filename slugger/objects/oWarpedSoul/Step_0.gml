_tick += delta;
image_index += round(delta);

if (_tick < 60 && _vel > 0 && !(x < 10 || x > room_width - 10 || y < 10 || y > room_height - 10)) {
	x += lengthdir_x(_vel, direction) * delta;
	y += lengthdir_y(_vel, direction) * delta;
	_vel -= 0.5 * delta;
} else {
	if (distance_to_object(oSlug) < 500 && _state == 0) {
		_state = 1;
		_start_distance = distance_to_object(oSlug);
		direction = point_direction(x, y, oSlug.x, oSlug.y);
		x += lengthdir_x((_start_distance - distance_to_object(oSlug)) * 0.01, direction) * delta;
		y += lengthdir_y((_start_distance - distance_to_object(oSlug)) * 0.01, direction) * delta;
	} else {
		if (_state == 1) {
			direction = point_direction(x, y, oSlug.x, oSlug.y);
			if (!(_start_distance - distance_to_object(oSlug) < 0)) {
				x += lengthdir_x((_start_distance - distance_to_object(oSlug)) * 0.01, direction) * delta;
				y += lengthdir_y((_start_distance - distance_to_object(oSlug)) * 0.01, direction) * delta;
			} else {
				_state = 0;
			}
		}
	}
}

if place_meeting(x, y, oSlug) {
	global._warped_souls ++;
	audio_sound_pitch(snWarpedSoul, random_range(0.8, 1.2) * delta);
	audio_play_sound(snWarpedSoul, 1, false);
	instance_destroy();
}