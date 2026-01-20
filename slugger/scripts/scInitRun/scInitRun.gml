function scInitRun(){
    //Misc
	show_debug_message("BEGINNING RUN INIT SCRIPT!");
	global._run_state = 1;
	scGenericInit();
	global._time_scale = 0;
	global._distort_count = 0;
	global._entity_spawns = [];
	global._enemies = ds_map_create();

    //Set wave
    global._wave = 1;
	global._wave_complete = 0;
	global._wave_time = 0;
	global._wave_length = (ds_map_find_value(global.WaveTimes, global._wave).minutes * 60 + ds_map_find_value(global.WaveTimes, global._wave).seconds) * game_get_speed(gamespeed_fps);
    show_debug_message("wave length: " + string(global._wave_length));
	var _music = asset_get_index("snW" + string(global._wave) + "Music");
	audio_play_sound(_music, 10, false);
	global.w1_schedule_num = 1;
	global._wave_finish = 0;
    
	//Reset
	global._max_slug_health = 100;
	global._slug_health = global._max_slug_health;
	
    //Manage weapons
    global._current_weapon = 0;
	global._weapon_cooldown = 30;
	global._current_weapon_cooldown = global._weapon_cooldown
	global._bullets = ds_map_create();
	global._lock_on = false;
    
	//stats
	global._warped_souls = 0;
	global._bonus_warp = 0;
	global._last_enemy_killed = 0;
	global._combo = 0;
	
	//Dev tools
	global._dev_skip_wave = false;
	global._dev_kill = false;
	
	//Manage elements
	
    //Initialise damage display queue
    global._dmg_dis_queue = [];
    
    
	//Initialise powerup counters
	global._powerups = ds_map_create();
	global._powerup_names = ds_map_create();
	ds_map_add(global._powerup_names, 1, "DmgT1");
	ds_map_add(global._powerup_names, 2, "HealthP");
	
	//Initialise instances
	scInitInstances();
}