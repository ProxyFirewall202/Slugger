if array_length(global._entity_spawns) > 0 {
	global._enemy_spawning = true;
	global._current_enemy_id ++;
	var _data = global._entity_spawns[0];
	var _enemy_type = _data.etype;
	array_delete(global._entity_spawns, 0, 1);
	var _enemy_name = "oE" + string(global._wave) + "T" + string(_enemy_type);
	var _enemy_object = asset_get_index(_enemy_name);
	var _tmp = {
        nhealth : ds_map_find_value(global.EnemyH, _enemy_name),
        mhealth : ds_map_find_value(global.EnemyH, _enemy_name),
		damage : ds_map_find_value(global.EnemyD, _enemy_name)
    };
	
	var _spawn = {
		xpos : _data.xpos,
		ypos : _data.ypos
	};
	
    var _enemy_instance = instance_create_layer(_spawn.xpos, _spawn.ypos, "Instances", _enemy_object, _tmp);
	var _enemy_data = {
        instance : _enemy_instance,
        health : _tmp.nhealth,
        maxhealth : _tmp.mhealth
    };
        
	// Check if the object exists before creating an instance
	if (_enemy_object != -1) {
		ds_map_add(global._enemies, real(global._current_enemy_id), _enemy_data);
	} else {
		show_debug_message("WARNING: Enemy asset cannot be accessed/found and an enemy could not be spawned. " + "Enemy object '" + _enemy_name + "' not found!");
	}
	global._enemy_spawning = false;
}


global._enemy_count = ds_map_size(global._enemies);