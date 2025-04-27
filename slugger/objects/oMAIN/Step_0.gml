global._tick += delta;

if keyboard_check_pressed(ord("L")) {
	global._run_state = (!global._run_state);
	show_debug_message(global._run_state);
	if global._run_state == 1 {
		scInitRun();
	} else {
		with (all) {
			if (run_only == 1) {
				instance_destroy();
			}
		}
	}
}

fx_set_parameter(global._screenshake_info, "g_Magnitude", global._scrshake.mag);
fx_set_parameter(global._screenshake_info, "g_ShakeSpeed", global._scrshake.spd);
global._scrshake.mag -= global._scrshake.mag / 20 * delta;
global._scrshake.spd -= global._scrshake.spd / 20 * delta;

if keyboard_check_pressed(ord("0")) game_set_speed(5, gamespeed_fps);
if keyboard_check_pressed(ord("1")) game_set_speed(30, gamespeed_fps);
if keyboard_check_pressed(ord("2")) game_set_speed(60, gamespeed_fps);
if keyboard_check_pressed(ord("3")) game_set_speed(120, gamespeed_fps);
if keyboard_check_pressed(ord("4")) game_set_speed(250, gamespeed_fps);

if keyboard_check_pressed(ord("9")) global._time_scale += 5;
if keyboard_check_pressed(ord("8")) global._time_scale -= 5;

show_debug_message(global._time_scale);