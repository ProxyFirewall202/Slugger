tick ++;

if tick > 13 {
    var _emitter = variable_global_get(_enemy_name + "RemainsEmitter");
    var _type = variable_global_get(_enemy_name + "RemainsType");
    part_emitter_region(global.p_system, _emitter, x - 8, x + 8, y - 8, y + 8, ps_shape_rectangle, ps_distr_linear);
    part_emitter_burst(global.p_system, _emitter, _type, irandom(3));
    instance_destroy();
}