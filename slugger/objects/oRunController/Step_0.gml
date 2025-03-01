if global._run_state == 1 {
	//Enemies
	if irandom(60) == 0 {
		if global._current_enemy_id > -1 {
			//Spawn Enemy
			array_push(global._entity_spawns, 1);
		}
	}
	
	//Combo
	if global._tick >= global._last_enemy_killed + 60 global._combo = 0;
	
	//Background Particles
	if (irandom(10) == 0) part_emitter_burst(global.p_system, global.W1ParticleEmitter, global.W1ParticleType, 1);
    
    //Damage display
    if array_length(global._dmg_dis_queue) > 0 {
        var _info;
		var _my_info;
        repeat (array_length(global._dmg_dis_queue)) {
            _info = global._dmg_dis_queue[0];
            show_debug_message(string(_info));
			
			
			var _colour = 0;
			var _scale = 0;
			
			// Calculate the lowest and highest possible damage values
			if _info.damage_type = 0 {
				var _min_damage = _info.basedamage / 1.33333333333333333;
				var _max_damage = _info.basedamage * 1.91;
				var _range = _max_damage - _min_damage;
				var _relative_damage = _info.damage - _min_damage;
				var _dmg_percent = _relative_damage / _range;
				
				// Calculate the color
				var _r = lerp(0, 230, _dmg_percent);
				var _g = lerp(183, 0, _dmg_percent);
				var _b = lerp(18, 0, _dmg_percent);
				_colour = make_color_rgb(_r, _g, _b);
				
				_scale = lerp(1.2, 2, _dmg_percent);
			} else if (_info.damage_type == 1) {
				var _r = lerp(0, 10, _info.damage_percent);
				var _g = lerp(60, 120, _info.damage_percent);
				var _b = lerp(160, 220, _info.damage_percent);
				_colour = make_color_rgb(_r, _g, _b);
				
				_scale = lerp(1.2, 2, _info.damage_percent);
			} else {
				var _percent = global._combo / 10;
				var _r = lerp(76, 191, _percent);
				var _g = lerp(0, 0, _percent);
				var _b = lerp(191, 152, _percent);
				_colour = make_color_rgb(_r, _g, _b);
				
				_scale = lerp(1.2, 2, _percent);
			}
			
			var _i = 0;
			var _info2 = 0;
			var _lockcoord_dif = infinity;
			var _lockx = 0;
			var _locky = 0;
			var _locki = 0;
			var _up_i = "NA";
			repeat (array_length(_current_dmg)) {
				if (_current_dmg[_i] != undefined) {
					_info2 = _current_dmg[_i];
					if point_distance(_info.xpos, _info.ypos, _info2.xpos, _info2.ypos) < _lockcoord_dif {
						_lockcoord_dif = point_distance(_info.xpos, _info.ypos, _info2.xpos, _info2.ypos);
						_lockx = _info2.xpos;
						_locky = _info2.ypos;
						_locki = _i;
					}
				}
				_i ++;
			}
			if _lockcoord_dif < 110 {
				_info.xpos = _lockx;
				_info.ypos = _locky;
				_up_i = real(_locki);
				var _stored_i = _locki;
				while (_stored_i != "NA") {
					_info2 = _current_dmg[_stored_i];
					if (_info2 != undefined) {
						_info2.ypos -= 40;
						_stored_i = _info2.ontopindex;
					} else {
						_stored_i = "NA";
					}
				}
				
			}
			
			_my_info = {
				damage : _info.damage,
				xpos : _info.xpos,
				ypos : _info.ypos,
				realx : _info.xpos,
				realy : _info.ypos,
				alpha : 0,
				colour : _colour,
				scale : _scale,
				glow : 1,
				lifetime : 0,
				glowstate : -0.02,
				ontopindex : _up_i,
				damagetype : _info.damage_type
			};
			
			array_push(_current_dmg, _my_info);
			
            array_delete(global._dmg_dis_queue, 0, 1);
        }
    }
}