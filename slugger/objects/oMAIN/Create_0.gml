run_only = 0;
global._screen_width = display_get_width();
global._screen_height = display_get_height() - 50;

window_set_size(1920, 1080);
surface_resize(application_surface, 1920, 1080);
window_center();

audio_channel_num(128);

game_set_speed(250, gamespeed_fps);

global._delta_factor = 1;
#macro delta global._delta_factor

display_reset(0, false);

global._tick = -1;

global._distort_count = 0;

global._run_state = 0;
global._weapon_cooldown = 10;
global._single_instances = ds_map_create();

global._wave = 0;

global._current_weapon = "NA";
global._current_element = 0;
global._elements = [];
global._element_colours = {
	"c0" : [255, 255, 255],
	"c1" : [255, 0, 0],
	"c2" : [255, 100, 100],
	"c3" : [255, 100, 100],
	"c4" : [255, 100, 100],
	"c5" : [255, 100, 100],
	"c6" : [255, 100, 100]
}


global._scrshake = {
	mag: 0,
	spd: 0
};
global._screenshake_info = fx_create("_filter_screenshake");
fx_set_parameter(global._screenshake_info, "g_Magnitude", 0);
fx_set_parameter(global._screenshake_info, "g_ShakeSpeed", 0);
layer_set_fx("ScreenShake", global._screenshake_info);



global.EnemyWS = ds_map_create();
ds_map_add(global.EnemyWS, "oE1T1", 2);
ds_map_add(global.EnemyWS, "oE1T4", 10);

global.EnemyH = ds_map_create();
ds_map_add(global.EnemyH, "oE1T1", 10);
ds_map_add(global.EnemyH, "oE1T4", 100);

global.EnemyD = ds_map_create();
ds_map_add(global.EnemyD, "oE1T1", 10);
ds_map_add(global.EnemyD, "oE1T4", 40);

global._slug_max_health = 100;