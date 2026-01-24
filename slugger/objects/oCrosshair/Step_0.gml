window_set_cursor(cr_none);
x = clamp(lerp(x, mouse_x, 0.125), 0, room_width);
y = clamp(lerp(y, mouse_y, 0.125), 100, room_height);
var _frame_lock = false;
if (global._lock_on == false && keyboard_check_pressed(vk_lalt) && global._enemy_count > 0) {
	global._lock_on = true;
	audio_sound_pitch(snLock, pitchscale);
	audio_play_sound(snLock, 0, false);
	_frame_lock = true;
	_locked = instance_nearest(x, y, oEnemyManager);
}

if (keyboard_check_released(vk_lalt) && global._lock_on) {
	global._lock_on = false;
	audio_sound_pitch(snUnlock, pitchscale);
	audio_play_sound(snUnlock, 0, false);
}

if (global._lock_on) {
	if instance_exists(_locked) {
		x = lerp(x, _locked.x, 0.7);
		y = lerp(y, _locked.y, 0.7);
	} else {
		global._lock_on = false;
		audio_sound_pitch(snUnlock, pitchscale);
		audio_play_sound(snUnlock, 0, false);
	}
}