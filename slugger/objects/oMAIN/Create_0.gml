//Misc
run_only = 0;
scGameInit();
global._tick = -1;
global._run_state = 0;
global._wave = -1;
global._crates = ds_map_create();
global._distortion_enabled = false;

//Screenshake init
global._screenshake_info = fx_create("_filter_screenshake");
fx_set_parameter(global._screenshake_info, "g_Magnitude", 0);
fx_set_parameter(global._screenshake_info, "g_ShakeSpeed", 0);
layer_set_fx("ScreenShake", global._screenshake_info);

//Static data
global._slug_max_health = 100;

global._weapon_info = {
	w0 : {
		damage : 2, 
		crit : 0.13,
		name : "basicgun",
		obj : oBasicGun
    }
};

global._elements = ["sl", "f", "i", "v", "s", "sm"];
global._element_colours = {
	"c0" : [255, 255, 255],
	"c1" : [255, 0, 0],
	"c2" : [255, 100, 100],
	"c3" : [255, 100, 100],
	"c4" : [255, 100, 100],
	"c5" : [255, 100, 100],
	"c6" : [255, 100, 100]
}

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

global.WaveColour = ds_map_create();
ds_map_add(global.WaveColour, -1, [0, 0.1, 0, 1.0]);
ds_map_add(global.WaveColour, 1, [0.06, 0, 0, 1.0]);

global.WaveTimes = ds_map_create()
var _time = {
	minutes : 2,
	seconds : 45
};
ds_map_add(global.WaveTimes, 1, _time);

//W1 Scheduler
global.W1Schedule = ds_map_create();
scW1Schedule();
show_debug_message("↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓    W1 SCHEDULE    ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓");
var current_key = ds_map_find_first(global.W1Schedule);
repeat (ds_map_size(global.W1Schedule)) {
    var current_value = ds_map_find_value(global.W1Schedule, current_key);
    show_debug_message("Key: " + string(current_key) + ", Value: " + string(current_value));
    current_key = ds_map_find_next(global.W1Schedule, current_key);
}

//BG init
global._bg_info = fx_create("_filter_fractal_noise" );
fx_set_parameter(global._bg_info, "g_FractalNoiseTintColour", ds_map_find_value(global.WaveColour, global._wave));
fx_set_parameter(global._bg_info, "g_FractalNoiseSpeed", 1);
layer_set_fx("Noise", global._bg_info);