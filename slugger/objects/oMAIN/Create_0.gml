run_only = 0;
global._screen_width = display_get_width();
global._screen_height = display_get_height() - 50;

window_set_size(1920, 1080);
surface_resize(application_surface, 1920, 1080);
window_center();

audio_channel_num(128);

game_set_speed(60, gamespeed_fps);

global._delta_factor = 1;
global._sound_pitch_scale = 1;
#macro pitchscale global._sound_pitch_scale
#macro delta global._delta_factor

global._time_scale = 0;

display_reset(0, false);

global._tick = -1;

global._distort_count = 0;

global._run_state = 0;
global._wave_complete = undefined;

var _minutes = 2;
var _seconds = 45;
global._wave_length = (_minutes * 60 + _seconds) * game_get_speed(gamespeed_fps);

global._wave_time = undefined;
global._weapon_cooldown = 30;
global._single_instances = ds_map_create();

global._wave = 0;

global._current_weapon = undefined;
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

global.EnemyHBarOffset = ds_map_create();
ds_map_add(global.EnemyHBarOffset, "oE1T1", 0);

global._slug_max_health = 100;

_started = false

//W1 Scheduler
global.W1Schedule = ds_map_create();
global.w1_schedule_num = 1;
scW1Schedule();
show_debug_message("↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓    W1 SCHEDULE    ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓");
var current_key = ds_map_find_first(global.W1Schedule);
repeat (ds_map_size(global.W1Schedule)) {
    var current_value = ds_map_find_value(global.W1Schedule, current_key);
    show_debug_message("Key: " + string(current_key) + ", Value: " + string(current_value));
    current_key = ds_map_find_next(global.W1Schedule, current_key);
}

global._dev_skip_wave = false;
global._dev_kill = false;