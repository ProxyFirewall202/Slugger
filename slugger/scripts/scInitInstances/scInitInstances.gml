function scInitInstances(){
	//Create all instances
    // Create W1BG
	instance_create_layer(x, y, "Background", oW1BG);
            
    // Create slug instance
    global._slug_instance = instance_create_layer(room_width / 2, room_height / 2, "Instances", oSlug);
    
    // Create basic gun
	var _tmp0 = "w" + string(global._current_weapon);
	var _name = global._weapon_info[$ _tmp0].name;
	var _obj = global._weapon_info[$ _tmp0].obj;
	instance_create_layer(x, y, "Instances", _obj);
    
    // Create entity manager
	instance_create_layer(x, y, "Instances", oEntityManager);
            
    // Create weapon manager
    instance_create_layer(x, y, "Instances", oWeaponManager);
    
    // Create run controller
    instance_create_layer(x, y, "HUD", oRunController);
	
	// Create crosshair
    instance_create_layer(x, y, "HUD", oCrosshair);
}