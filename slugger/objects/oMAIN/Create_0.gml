run_only = 0;
global._screen_width = display_get_width();
global._screen_height = display_get_height() - 50;

window_set_size(1920, 1080);
surface_resize(application_surface, 1920, 1080);
window_center();

game_set_speed(60, gamespeed_fps);

display_reset(0, false);

global._tick = -1;

global._distort_count = 0;

global._run_state = 0;
global._weapon_cooldown = 10;
global._single_instances = ds_map_create();

global._wave = 0;

global._current_weapon = "NA";


global._scrshake = {
	mag: 0,
	spd: 0
};
global._screenshake_info = fx_create("_filter_screenshake");
fx_set_parameter(global._screenshake_info, "g_Magnitude", 0);
fx_set_parameter(global._screenshake_info, "g_ShakeSpeed", 0);
layer_set_fx("ScreenShake", global._screenshake_info);



global.EnemyWS = ds_map_create();
ds_map_add(global.EnemyWS, oE1T1, 2);