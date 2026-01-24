_tick ++;

image_index += round(delta);

x += lengthdir_x(_vel, direction) * delta;
y += lengthdir_y(_vel, direction) * delta;
_vel += delta;
if (x < 0 || x > room_width || y < 100 || y > room_height) {
    instance_destroy();
}

if (place_meeting(x, y, oEnemyManager)) {
	var _instance = instance_nearest(x, y, oEnemyManager);
	if (_instance._state != 2) {
		scDealDamage(_instance, 0, x, y, undefined);
    }
	instance_destroy();
}