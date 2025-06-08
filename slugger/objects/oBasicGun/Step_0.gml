event_inherited();
_tick ++;

//Manage gun
x = global._slug_instance.x;
y = global._slug_instance.y;
image_index = global._current_element;
image_angle = global._slug_instance.image_angle;
direction = global._slug_instance.image_angle + 90;
x += lengthdir_x(15, direction);
y += lengthdir_y(15, direction);
direction += 90;
x += lengthdir_x(10 + 5 * _shooting, direction);
y += lengthdir_y(10 + 5 * _shooting, direction);

if (_using) {
	//Animate
	_shooting = 1;
	_shoot_tick = _tick;
	
	//Sound effects
	audio_sound_pitch(snBasicGunShoot, random_range(0.98, 1.02) * delta);
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
	
	global._current_weapon_cooldown = global._weapon_cooldown;
}

if (_shooting == 1 && _tick > _shoot_tick + global._weapon_cooldown - 4) {
	_shooting = 0;
}