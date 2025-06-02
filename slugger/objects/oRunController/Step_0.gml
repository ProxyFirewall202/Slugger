_tick += delta;
if global._run_state == 1 {
	//Wave control
	global._wave_time = clamp(global._wave_time + delta, 0, global._wave_length);
	global._wave_complete = global._wave_time / global._wave_length;
	/*if global._wave_complete == 1 {
		global._run_state = 0;
		with (all) {
			if (run_only == 1) {
				instance_destroy();
			}
		}
	}*/
	
	//Combo
	audio_sound_pitch(snComboRiser, delta);
	if (global._tick >= global._last_enemy_killed + 60) {
		global._combo = 0;
		audio_stop_sound(snComboRiser);
		audio_stop_sound(snComboRiser2);
	}
	if (global._combo > 4 && !audio_is_playing(snComboRiser)) {
		audio_play_sound(snComboRiser, 1, false);
		audio_play_sound(snComboRiser2, 1, false);
	}
	
	//Spawn Enemies
	var _spawn_rate;
	if global._wave_complete < 0.7 {
		_spawn_rate = delta / 81;
	} else {
		_spawn_rate = delta / 6;
	}
	if ((random(1) < _spawn_rate) && (global._wave_complete < 1)) {
		var _edge = irandom(3);
		var _x = (_edge == 1) ? room_width : ((_edge == 3) ? 0 : (irandom(room_width)));
		var _y = (_edge == 0) ? 0 : ((_edge == 2) ? room_height : (irandom(room_height)));
		var _data = {
			etype : 1,
			xpos : _x,
			ypos : _y
		}
		array_push(global._entity_spawns, _data);
		audio_sound_pitch(snEnemySpawn, random_range(0.9, 1.1) * delta);
		audio_play_sound(snEnemySpawn, 1, false);
	};

	
	//Element check
	if (_tick > _element_last_change_frame && _element_key_unpressed == false) {
		if (!keyboard_check(ord("C")) && !keyboard_check(ord("Z"))) _element_key_unpressed = true
	}
	
	if (((_tick - _element_last_change_frame) > (180 * delta)) && (_eswitch)) {
		_eswitch = false;
	}
	
	if (!_eswitch) {
			var _percent = (global._time_scale + 60) / 60;
			global._time_scale = lerp(-60, 0, clamp(_percent + 0.01, 0, 1));
		} else {
			var _percent = 1 - (global._time_scale + 60) / 60;
			global._time_scale = lerp(0, -60, _percent + 0.07);
			if (global._time_scale < -55) global._time_scale = -55;
		}
	
	if (((keyboard_check(ord("C"))) || (keyboard_check(ord("Z")))) && (_element_key_unpressed == true)) {
		if (keyboard_check(ord("C")) && _element_key_unpressed == true) {
			if (global._current_element < array_length(global._elements)) {
				global._current_element ++;
			} else {
				global._current_element = 0;
			}
		_element_last_change_frame = _tick;
		_element_key_unpressed = false;
		}
	
		if (keyboard_check(ord("Z")) && _element_key_unpressed == true) {
			if (global._current_element > 0) {
				global._current_element --;
			} else {
				global._current_element = array_length(global._elements);
			}
		_element_last_change_frame = _tick;
		_element_key_unpressed = false;
		}
		
		//Element change particles
		var _element;
		var _sound;
		if (global._current_element == 1 || global._current_element == 2 || global._current_element == 0) {
			_element = "e" + string(global._current_element);
			_sound = asset_get_index("snES" + string(global._current_element));
		} else {
			_element = "e" + string(0);
			_sound = asset_get_index("snES1");
		}
		
		audio_play_sound(_sound, 1, false);
		
		var _etypes = {
			t1 : global.ELSwitch[$ _element].types.s1,
			t2 : global.ELSwitch[$ _element].types.s2,
			t3 : global.ELSwitch[$ _element].types.s3
		};
	
		var _eemitters = {
			t1 : global.ELSwitch[$ _element].emitters.s1,
			t2 : global.ELSwitch[$ _element].emitters.s2,
			t3 : global.ELSwitch[$ _element].emitters.s3
		};
		
		_eswitch = true;
		
		part_emitter_region(global.p_system, _eemitters.t1, oSlug.bbox_left, oSlug.bbox_right, oSlug.bbox_top, oSlug.bbox_bottom, ps_shape_ellipse, ps_distr_linear);
		part_emitter_region(global.p_system, _eemitters.t2, oSlug.bbox_left, oSlug.bbox_right, oSlug.bbox_top, oSlug.bbox_bottom, ps_shape_ellipse, ps_distr_linear);
		part_emitter_region(global.p_system, _eemitters.t3, oSlug.bbox_left, oSlug.bbox_right, oSlug.bbox_top, oSlug.bbox_bottom, ps_shape_ellipse, ps_distr_linear);
		part_emitter_burst(global.p_system, _eemitters.t1, _etypes.t1, 100);
		part_emitter_burst(global.p_system, _eemitters.t2, _etypes.t2, 100);
		part_emitter_burst(global.p_system, _eemitters.t3, _etypes.t3, 100);
		
		show_debug_message("etypes = " + string(_etypes));
		show_debug_message("eemitters = " + string(_eemitters));
		
	}
	
	//Background Particles
	var _spawn_rate = delta / 11;
	if (random(1) < _spawn_rate) part_emitter_burst(global.p_system, global.W1ParticleEmitter, global.W1ParticleType, 1);
    
	
	//Health increase check
	if (global._slug_health != _last_health) {
		if (global._slug_health > _last_health) {
			part_emitter_region(global.p_system, global.HealthPartEmitter, oSlug.x - 20, oSlug.x + 20, oSlug.y - 20, oSlug.y + 20, ps_shape_rectangle, ps_distr_linear);
			part_emitter_burst(global.p_system, global.HealthPartEmitter, global.HealthPartType, global._slug_health - _last_health);
		}
		_last_health = global._slug_health;
	}
	
	//Create powerup
	_spawn_rate = delta / 1001;
	if (random(1) < _spawn_rate) {
		
		var _id_struct = {
			_id : 1
		};
		
		instance_create_layer(random(room_width), random(room_height), "Collectables", oDmgT1, _id_struct);
	}
	
	_spawn_rate = delta / 1001;
	if ((random(1) < _spawn_rate) && global._slug_health < global._slug_max_health) {
		
		var _id_struct = {
			_id : 2
		};
		
		instance_create_layer(random(room_width), random(room_height), "Collectables", oHealthP, _id_struct);
	}
	
	
	//Damage boost particles
	if (ds_map_exists(global._powerups, 1) && _tick mod 5 < 1) {
		part_emitter_region(global.p_system, global.DamagePartEmitter, oSlug.x - 20, oSlug.x + 20, oSlug.y - 20, oSlug.y + 20, ps_shape_rectangle, ps_distr_linear);
		part_emitter_burst(global.p_system, global.DamagePartEmitter, global.DamagePartType, ds_map_find_value(global._powerups, 1));
	}
	
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