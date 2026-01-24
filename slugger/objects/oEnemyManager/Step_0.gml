   _tick += delta;

if _setup = false and global._enemy_spawning = false {
	_setup = true
	_my_health = ds_map_find_value(global._enemies, _my_id).health;
}  

if _dmg_cooldown > 0 {
	_dmg_cooldown -= delta;
}

if place_meeting(x, y, oSlug) && (_dmg_cooldown < 1) {
	var _dmg = _my_damage + random_range(-(_my_damage / 5), _my_damage / 5);
	global._slug_health -= _dmg;
	global._scrshake.mag += 3.5;
	global._scrshake.spd += 3.5;
	_dmg_cooldown = 40;
	
	var _min_damage = _my_damage - _my_damage / 5;
	var _max_damage = _my_damage + _my_damage / 5;
	var _range = _max_damage - _min_damage;
	var _relative_damage = _dmg - _min_damage;
	var _dmg_percent = _relative_damage / _range;
	
	part_emitter_region(global.p_system, global.SlugDamageEmitter, x - 20, x + 20, y - 20, y + 20, ps_shape_ellipse, ps_distr_linear);
	part_emitter_burst(global.p_system, global.SlugDamageEmitter, global.SlugDamageType, 10);
	
	audio_sound_pitch(snSlugDamage, lerp(0.8, 1.2, _dmg_percent) * pitchscale);
	audio_play_sound(snSlugDamage, 1, false);
	
	var _dmg_dis_data = {
        xpos : x,
        ypos : y,
		damage : _dmg,
        basedamage : _my_damage,
        crit : 0,
		damage_type : 1,
		damage_percent : _dmg_percent
    };
    array_push(global._dmg_dis_queue, _dmg_dis_data);
	
	//Enemy being damaged
	
	_last_hit = _tick;
	_hit = 1;
		
	var _my_rdamage = 2;
    _dmg = 0;
    var _crit;
    _dmg = _my_rdamage + random_range(-(_my_rdamage / 4), _my_rdamage / 4);
    _crit = 0;
    _dmg_dis_data = {
        xpos : x,
        ypos : y,
        damage : _dmg,
        basedamage : _my_rdamage,
        crit : _crit,
		damage_type : 0
    };
        
		
	_min_damage = 1.5;
	_max_damage = 2.5;
	_range = _max_damage - _min_damage;
	_relative_damage = _dmg - _min_damage;
	_dmg_percent = _relative_damage / _range;
		
		
	array_push(global._dmg_dis_queue, _dmg_dis_data);
	audio_sound_pitch(snHit2, lerp(0.98, 1.02, _dmg_percent) * pitchscale);
	audio_play_sound(snHit2, 1, false);
    _my_health -= _dmg;
}

var _data = ds_map_find_value(global._enemies, _my_id);
_data.health = _my_health;
ds_map_replace(global._enemies, _my_id, _data);