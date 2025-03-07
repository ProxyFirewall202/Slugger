function scInitRun(){
    
    //Set wave
    global._wave = 1;
    
    //Reset
	global._slug_health = 100;
	if variable_global_exists("_enemies") ds_map_clear(global._enemies);
	
    //Manage weapons
    global._current_weapon = oBasicGun;
    global._weapon_info = {
        basicgun : {
            damage : 5, 
            crit : 0.13
        }
    };
    
	global._warped_souls = 0;
	global._bonus_warp = 0;
	global._last_enemy_killed = 0;
	global._combo = 0;
    
    //Initialise damage display queue
    global._dmg_dis_queue = [];
    
    
    
    //Create all instances
    // Create W1BG
    if (ds_map_exists(global._single_instances, "w1bg")) {
        ds_map_replace(global._single_instances, "w1bg", instance_create_layer(x, y, "Background", oW1BG));
    } else {
        ds_map_add(global._single_instances, "w1bg", instance_create_layer(x, y, "Background", oW1BG));
    }
            
    // Create slug instance
    if (ds_map_exists(global._single_instances, "slug")) {
        ds_map_replace(global._single_instances, "slug", instance_create_layer(x, y, "Instances", oSlug));
    } else {
        ds_map_add(global._single_instances, "slug", instance_create_layer(x, y, "Instances", oSlug));
    }
    global._slug_instance = ds_map_find_value(global._single_instances, "slug");
    
    // Create basic gun
    if (ds_map_exists(global._single_instances, "basicgun")) {
            ds_map_replace(global._single_instances, "basicgun", instance_create_layer(x, y, "Instances", global._current_weapon));
    } else {
        ds_map_add(global._single_instances, "basicgun", instance_create_layer(x, y, "Instances", global._current_weapon));
    }
    
    // Create entity manager
    if (ds_map_exists(global._single_instances, "entitymanager")) {
        ds_map_replace(global._single_instances, "entitymanager", instance_create_layer(x, y, "Instances", oEntityManager));
    } else {
        ds_map_add(global._single_instances, "entitymanager", instance_create_layer(x, y, "Instances", oEntityManager));
    }
            
    // Create weapon manager
    if (ds_map_exists(global._single_instances, "weaponmanager")) {
        ds_map_replace(global._single_instances, "weaponmanager", instance_create_layer(x, y, "Instances", oWeaponManager));
    } else {
        ds_map_add(global._single_instances, "weaponmanager", instance_create_layer(x, y, "Instances", oWeaponManager));
    }
            
    // Create run controller
    if (ds_map_exists(global._single_instances, "runcontroller")) {
        ds_map_replace(global._single_instances, "runcontroller", instance_create_layer(x, y, "HUD", oRunController));
    } else {
        ds_map_add(global._single_instances, "runcontroller", instance_create_layer(x, y, "HUD", oRunController));
    }
	
	//Spawn Hivox
	var _data = {
		etype : 4,
		xpos : room_width / 2,
		ypos : room_height / 2
	};
	array_push(global._entity_spawns, _data);
}