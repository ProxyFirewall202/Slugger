function scInitRun(){
    //Misc
	scGenericInit();
	global._time_scale = 0;
	global._distort_count = 0;
	global._entity_spawns = [];

    //Set wave
    global._wave = 1;
	global._wave_complete = 0;
	global._wave_time = 0;
	global._wave_length = (ds_map_find_value(global.WaveTimes, global._wave).minutes * 60 + ds_map_find_value(global.WaveTimes, global._wave).seconds) * game_get_speed(gamespeed_fps);
    show_debug_message("wave length: " + string(global._wave_length));
	
    //Reset
	global._max_slug_health = 100;
	global._slug_health = global._max_slug_health;
	if variable_global_exists("_enemies") ds_map_clear(global._enemies);
	
    //Manage weapons
    global._current_weapon = 0;
	global._weapon_cooldown = 30;
	global._current_weapon_cooldown = global._weapon_cooldown
	
	global._weapon_info = {
        w0 : {
            damage : 5, 
            crit : 0.13,
			name : "basicgun",
			obj : oBasicGun
        }
    };
	global._bullets = ds_map_create();
    
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