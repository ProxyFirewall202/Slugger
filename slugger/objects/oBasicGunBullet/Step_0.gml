_tick ++;
x += lengthdir_x(_vel, direction);
y += lengthdir_y(_vel, direction);
_vel ++;
if (x < 0 || x > room_width || y < 0 || y > room_height) {
    instance_destroy();
}

if place_meeting(x, y, oE1T1) {
	var _instance = instance_nearest(x, y, oE1T1);
	if _instance._state == 1 {
        
		//Screen shake
		global._scrshake.mag += 2;
		global._scrshake.spd += 2;
		
		_instance._last_hit = _instance._step;
		_instance._hit = 1;
		
		var _my_damage = global._weapon_info.basicgun.damage;
        var _dmg;
        var _crit;
        if random(1) < global._weapon_info.basicgun.crit {
            _dmg = (_my_damage + _my_damage / 1.5) + random_range(-(_my_damage / 4), _my_damage / 4);
            _crit = 1;
        } else {
            _dmg = _my_damage + random_range(-(_my_damage / 4), _my_damage / 4);
            _crit = 0;
        }
        var _dmg_dis_data = {
            xpos : x,
            ypos : y,
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
		audio_sound_pitch(snHit, lerp(0.98, 1.02, _dmg_percent));
		audio_play_sound(snHit, 1, false);
        _instance._my_health -= _dmg;
    }
	instance_destroy();
}