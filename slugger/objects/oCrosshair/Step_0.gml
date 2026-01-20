window_set_cursor(cr_none);
x = lerp(x, mouse_x, 0.125);
y = lerp(y, mouse_y, 0.125);
var _frame_lock = false;
if (global._lock_on == false && keyboard_check_pressed(vk_lalt) && global._enemy_count > 0) {
	global._lock_on = true;
	_frame_lock = true;
	_locked = instance_nearest(x, y, oEnemyManager);
}

if (global._lock_on) {
	if instance_exists(_locked) {
		x = lerp(x, _locked.x, 0.7);
		y = lerp(y, _locked.y, 0.7);
	} else {
		global._lock_on = false;
	}
	if (keyboard_check_pressed(vk_lalt) && !_frame_lock) {
		global._lock_on = false;
	}
}