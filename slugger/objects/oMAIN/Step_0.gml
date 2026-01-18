global._tick += delta;

//show_debug_message(delta);

if (mouse_check_button(mb_left) && !_started && !global.prewarm) {
	global._run_state = (!global._run_state);
	audio_play_sound(snW1Music, 10, false);
	if global._run_state == 1 {
		scInitRun();
	} else {
		with (all) {
			if (run_only == 1) {
				instance_destroy();
			}
		}
	}
	_started = true;
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

if (keyboard_check_pressed(ord("6"))) {
    global._dev_skip_wave = true;
    show_debug_message("DEV SKIP ACTIVATED - spawning next enemy instantly!");
}

if (keyboard_check_pressed(ord("K"))) global._dev_kill = true;

if (global._dev_kill) {
	show_debug_message("DEV KILL EXECUTED - enemy nearest to the coordinates 0,0 has been killed!")
	var _instance = instance_find(oEnemyManager, irandom(instance_number(oEnemyManager) - 1));
	if (_instance._state != 2) {
        
		//Screen shake
		global._scrshake.mag += 2;
		global._scrshake.spd += 2;
		
		scDealDamage(_instance, 0, 0, 0, 999);
    }
	global._dev_kill = false;
}