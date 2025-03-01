run_only = 1;
global._bullets = ds_map_create();
_bullet_next_id = 0;
_shooting = 0;
_tick = 0;
_shoot_tick = 0;
_scrshake_vals = {
	mag: 0,
	spd: 0
};