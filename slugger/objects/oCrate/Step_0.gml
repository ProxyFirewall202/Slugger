_tick += round(delta);
if (_tick % 2 == 0) _animation_idx += round(delta);
if (_animation_idx > _total_idx) _animation_idx = 0;

if (place_meeting(x, y, oSlug)) {
	ds_map_add(global._crates, global._wave, false);
	instance_destroy();
}