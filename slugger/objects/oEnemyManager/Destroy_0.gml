audio_sound_pitch(snSmallDeath, random_range(0.8, 1.2));
audio_play_sound(snSmallDeath, 1, false);
global._scrshake.mag += 5;
global._scrshake.spd += 5;
if global._tick < global._last_enemy_killed + 200 {
	global._combo ++;
	var _dmg_dis_data = {
        xpos : x,
        ypos : y,
		damage : 0,
        basedamage : 0,
        crit : 0,
		damage_type : 2,
		damage_percent : 0
    };
    array_push(global._dmg_dis_queue, _dmg_dis_data);
}
global._last_enemy_killed = global._tick;
repeat(irandom(ds_map_find_value(global.EnemyWS, string(object_get_name(object_index)))) + global._combo) {
	instance_create_layer(x + random_range(-20, 20), y + random_range(-20, 20), "Collectables", oWarpedSoul);
}
part_emitter_region(global.p_system, global.EShockwaveInnerEmitter, x, x, y, y, ps_shape_rectangle, ps_distr_linear);
part_emitter_burst(global.p_system, global.EShockwaveInnerEmitter, global.EShockwaveInnerType, 1);
part_emitter_region(global.p_system, global.EShockwaveOuterEmitter, x, x, y, y, ps_shape_rectangle, ps_distr_linear);
part_emitter_burst(global.p_system, global.EShockwaveOuterEmitter, global.EShockwaveOuterType, 1);