function scDealDamage(instance, weapon, xposit, yposit, ){
	instance._last_hit = instance._step;
	instance._hit = 1;
	
	var _weapon_ext = "w" + string(weapon);
	var _my_damage = global._weapon_info[$ _weapon_ext].damage;
    var _dmg;
    var _crit;
    if random(1) < global._weapon_info[$ _weapon_ext].crit {
        _dmg = (_my_damage + _my_damage / 1.5) + random_range(-(_my_damage / 4), _my_damage / 4);
        _crit = 1;
    } else {
        _dmg = _my_damage + random_range(-(_my_damage / 4), _my_damage / 4);
        _crit = 0;
    }
	if (ds_map_exists(global._powerups, 1)) _dmg = _dmg + ((_dmg / 4) * ds_map_find_value(global._powerups, 1));
    var _dmg_dis_data = {
        xpos : xposit,
        ypos : yposit,
        damage : _dmg,
        basedamage : _my_damage,
        crit : _crit,
		damage_type : 0
    };
        
		
	var _min_damage = _my_damage / 1.33333333333333333;
	var _max_damage = _my_damage * 1.91;
	var _range = _max_damage - _min_damage;
	var _relative_damage = _dmg - _min_damage;
	var _dmg_percent = _relative_damage / _range;
		
		
	array_push(global._dmg_dis_queue, _dmg_dis_data);
	audio_sound_pitch(snHit, lerp(0.9, 2.0, global._combo / 10) * pitchscale);
	audio_play_sound(snHit, 1, false);
    instance._my_health -= _dmg;
}