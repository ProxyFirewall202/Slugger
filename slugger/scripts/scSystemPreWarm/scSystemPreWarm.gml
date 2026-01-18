function scSystemPreWarm(){
	//Spawn bullet
	var _bullet = instance_create_layer(0, 0, "Instances", oBasicGunBullet);
	ds_map_add(global._bullets, 0, _bullet);
	
	//Bullet properties
	_bullet._bullet_id = 0;
	_bullet.direction = 315;
	_bullet.image_angle = 315;
}