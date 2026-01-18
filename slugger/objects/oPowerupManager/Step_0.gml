_tick += delta;
image_index += round(delta);
if (_despawning) {
	image_alpha -= delta / 100;
	if image_alpha < 0.03 instance_destroy();
	if (image_index > 60) {
		image_index = 0;
	}
} else if (visible == true) {
	if (image_index < 62) {
		if (place_meeting(x, y, oSlug)) {
			_collect_tick = _tick;
			visible = false;
			if (_id == 1) {
				if ds_map_exists(global._powerups, _id) {
					ds_map_replace(global._powerups, _id, ds_map_find_value(global._powerups, _id) + 1);
					audio_sound_pitch(snPowerupCollect, (1 + (ds_map_find_value(global._powerups, _id) / 50)) * pitchscale);
				} else {
					ds_map_add(global._powerups, _id, 1);
					audio_sound_pitch(snPowerupCollect, 1 * pitchscale);
				}
			}
			audio_play_sound(snPowerupCollect, 1, false);
			
			//Particles
			var _sprite = asset_get_index("s" + ds_map_find_value(global._powerup_names, _id));
			part_type_sprite(global.PowerupCollectType, _sprite, true, true, false);
			part_emitter_region(global.p_system, global.PowerupCollectEmitter, x - 20, x + 20, y - 20, y + 20, ps_shape_rectangle, ps_distr_linear);
			part_emitter_burst(global.p_system, global.PowerupCollectEmitter, global.PowerupCollectType, 40);
			
			if (_id == 2) global._slug_health += 40;
			if (global._slug_health > global._max_slug_health) global._slug_health = global._max_slug_health;
			
			if (_id == 2) instance_destroy();
			
		}
		if (image_index > 60) {
			image_index = 0;
		}
		
		if (_tick > 600) _despawning = true;
		if (_id == 2 && global._slug_health == global._max_slug_health) _despawning = true;
		
	}

	if (image_index > 61) {
		if (image_index > 119) {
			image_index = 0;
		}
	}
} else {
	if (_tick > _collect_tick + 450 && _id == 1) {
		if (ds_map_find_value(global._powerups, _id) == 1) {
			ds_map_delete(global._powerups, _id);
		} else {
			ds_map_replace(global._powerups, _id, ds_map_find_value(global._powerups, _id) - 1);
		}
		instance_destroy();
	}
}