ds_map_delete(global._bullets, _bullet_id);
part_emitter_region(global.p_system, global.BulletParticleEmitter, x - 20, x + 20, y - 20, y + 20, ps_shape_ellipse, ps_distr_linear);
part_emitter_burst(global.p_system, global.BulletParticleEmitter, global.BulletParticleType, 30);
part_emitter_region(global.p_system, global.BulletHitEmitter, x, x, y, y, ps_shape_rectangle, ps_distr_linear);
part_emitter_burst(global.p_system, global.BulletHitEmitter, global.BulletHitType, 1);