_tick += round(delta);
if (_tick % 2 == 0) _animation_idx += round(delta);
if (_animation_idx > _total_idx) _animation_idx = 0;

if (place_meeting(x, y, oSlug)) {
	ds_map_add(global._crates, global._wave, false);
	audio_sound_pitch(snWinAcquire, pitchscale);
	audio_play_sound(snWinAcquire, 0, false);
	part_emitter_region(global.p_system, global.WhitePartEmitter, x, x, y, y, ps_shape_rectangle, ps_distr_linear);
	part_emitter_burst(global.p_system, global.WhitePartEmitter, global.WhitePartType, 100);
	part_emitter_region(global.p_system, global.GlintPartEmitter, x, x, y, y, ps_shape_rectangle, ps_distr_linear);
	part_emitter_burst(global.p_system, global.GlintPartEmitter, global.GlintPartType, 100);
	var _dmg_dis_data = {
        xpos : x,
        ypos : y,
		damage : 0,
        basedamage : 0,
        crit : 0,
		damage_type : 3,
		damage_percent : 0
    };
    array_push(global._dmg_dis_queue, _dmg_dis_data);
	instance_destroy();
}

if (distance_to_object(oSlug) < 100) {
	_size = lerp(0, 1, distance_to_object(oSlug) / 100);
}

if (_tick % 60 == 0) {
	part_emitter_region(global.p_system, global.GlintPartEmitter, x, x, y, y, ps_shape_rectangle, ps_distr_linear);
	part_emitter_burst(global.p_system, global.GlintPartEmitter, global.GlintPartType, 2);
}