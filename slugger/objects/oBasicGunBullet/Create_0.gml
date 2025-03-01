run_only = 1;
_tick = 0;
_vel = 2.5;
part_emitter_region(global.p_system, global.BulletParticleEmitter, x - 20, x + 20, y - 20, y + 20, ps_shape_ellipse, ps_distr_linear);
part_emitter_burst(global.p_system, global.BulletParticleEmitter, global.BulletParticleType, 30);