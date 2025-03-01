_tick ++;

//Manage gun
x = global._slug_instance.x;
y = global._slug_instance.y;
image_angle = global._slug_instance.image_angle;
direction = global._slug_instance.image_angle + 90;
x += lengthdir_x(15, direction);
y += lengthdir_y(15, direction);
direction += 90;
x += lengthdir_x(10 + 5 * _shooting, direction);
y += lengthdir_y(10 + 5 * _shooting, direction);

if (mouse_check_button(mb_left)) && (global._current_weapon_cooldown == 0) {
	//Animate
	_shooting = 1;
	_shoot_tick = _tick;
	
	//Screen shake
	_scrshake_vals.mag += (0.5 - _scrshake_vals.mag) * 0.05;
	_scrshake_vals.spd += (0.5 - _scrshake_vals.spd) * 0.05;
	
	//Sound effects
	audio_sound_pitch(snBasicGunShoot, random_range(0.98, 1.02));
	audio_play_sound(snBasicGunShoot, 1, false);
	
	//Bullet spawn point
    var _spawn_x = x + lengthdir_x(20, image_angle) + lengthdir_x(5, image_angle + 90);
    var _spawn_y = y + lengthdir_y(20, image_angle) + lengthdir_y(5, image_angle + 90);
	
	//Spawn bullet
	var _bullet = instance_create_layer(_spawn_x, _spawn_y, "Instances", oBasicGunBullet);
	ds_map_add(global._bullets, _bullet_next_id, _bullet);
	
	//Bullet properties
	_bullet._bullet_id = _bullet_next_id;
	_bullet.direction = image_angle;
	_bullet.image_angle = image_angle;
	
	//Clean up
	_bullet_next_id++;
	global._current_weapon_cooldown = global._weapon_cooldown
} else {
	if global._current_weapon_cooldown > 0 {
		global._current_weapon_cooldown --;
	}
}

if (_shooting == 1 && _tick > _shoot_tick + global._weapon_cooldown - 4) {
	_shooting = 0;
}

if !(_scrshake_vals.mag == 0 && _scrshake_vals.spd == 0) {
	_scrshake_vals.mag -= _scrshake_vals.mag / 20;
	_scrshake_vals.spd -= _scrshake_vals.spd / 20;
}

global._scrshake.mag += _scrshake_vals.mag;
global._scrshake.spd += _scrshake_vals.spd;