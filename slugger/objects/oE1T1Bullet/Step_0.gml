_tick += delta;
x += lengthdir_x(_vel, direction) * delta;
y += lengthdir_y(_vel, direction) * delta;
if (_vel < _max_speed) _vel ++;
if (_vel > _max_speed) _vel = _max_speed;

if place_meeting(x, y, oSlug) {
	var _dmg = _my_damage + random_range(-(_my_damage / 5), _my_damage / 5);
	global._slug_health -= _dmg;
	global._scrshake.mag += 3.5;
	global._scrshake.spd += 3.5;
	
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
	
	instance_destroy();
}

if (x < 0 || x > room_width || y < 0 || y > room_height) {
    instance_destroy();
}