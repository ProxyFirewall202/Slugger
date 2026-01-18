function scInitInstances(){
	global._single_instances = ds_map_create();
	
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
	var _tmp0 = "w" + string(global._current_weapon);
	var _name = global._weapon_info[$ _tmp0].name
	var _obj = global._weapon_info[$ _tmp0].obj
	
    if (ds_map_exists(global._single_instances, string(_name))) {
            ds_map_replace(global._single_instances, string(_name), instance_create_layer(x, y, "Instances", _obj));
    } else {
        ds_map_add(global._single_instances, string(_name), instance_create_layer(x, y, "Instances", _obj));
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
}