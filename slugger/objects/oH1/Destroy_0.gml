if global._run_state {
	event_inherited()
	part_emitter_region(global.p_system, global.E1Death1Emitter, x - 20, x + 20, y - 20, y + 20, ps_shape_rectangle, ps_distr_linear);
	part_emitter_burst(global.p_system, global.E1Death1Emitter, global.E1Death1Type, 60);
	part_emitter_region(global.p_system, global.E1Death2Emitter, x, x, y, y, ps_shape_rectangle, ps_distr_linear);
	part_emitter_burst(global.p_system, global.E1Death2Emitter, global.E1Death2Type, 20);
	var _tmp_struct = {
	_enemy_name: "E1"
	};
	instance_create_layer(x, y, "Particles", oEnemyRemains, _tmp_struct)
}