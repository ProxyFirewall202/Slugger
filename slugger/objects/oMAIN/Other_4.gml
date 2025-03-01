//pMain
var _ps = part_system_create_layer("Particles", true);
part_system_draw_order(_ps, true);
var _ptype1;
var _pemit1;

scEnemyParticles(_ps);

//BulletParticle
_ptype1 = part_type_create();
part_type_shape(_ptype1, pt_shape_square);
part_type_size(_ptype1, 0.3, 1, 0, 0);
part_type_scale(_ptype1, 0.13, 0.13);
part_type_speed(_ptype1, 13, 13, -0.2, 0);
part_type_direction(_ptype1, 0, 359, 0, 0);
part_type_gravity(_ptype1, 0, 270);
part_type_orientation(_ptype1, 0, 0, 0, 0, false);
part_type_colour3(_ptype1, $FFFFFF, $007F06, $FFFFFF);
part_type_alpha3(_ptype1, 1, 1, 0);
part_type_blend(_ptype1, false);
part_type_life(_ptype1, 20, 20);

_pemit1 = part_emitter_create(_ps);

global.BulletParticleType = _ptype1;
global.BulletParticleEmitter = _pemit1;

//BulletHit
_ptype1 = part_type_create();
part_type_sprite(_ptype1, sPartShockwaveInner, false, true, false)
part_type_size(_ptype1, 1, 1, 0.01, 0);
part_type_scale(_ptype1, 1, 1);
part_type_speed(_ptype1, 0, 0, 0, 0);
part_type_direction(_ptype1, 0, 0, 0, 0);
part_type_gravity(_ptype1, 0, 270);
part_type_orientation(_ptype1, 0, 0, 0, 0, false);
part_type_colour3(_ptype1, $FFFFFF, $FFFFFF, $FFFFFF);
part_type_alpha3(_ptype1, 1, 0, 0);
part_type_blend(_ptype1, false);
part_type_life(_ptype1, 25, 25);

_pemit1 = part_emitter_create(_ps);

global.BulletHitType = _ptype1;
global.BulletHitEmitter = _pemit1;

//W1Particle
_ptype1 = part_type_create();
part_type_shape(_ptype1, pt_shape_square);
part_type_size(_ptype1, 0.3, 1, 0, 0.3);
part_type_scale(_ptype1, 0.1, 0.1);
part_type_speed(_ptype1, 1, 5, -0.01, 0);
part_type_direction(_ptype1, 1, 360, 0, 5);
part_type_gravity(_ptype1, 0, 270);
part_type_orientation(_ptype1, 0, 0, 5, 0, false);
part_type_colour3(_ptype1, $0000B2, $000099, $FFFFFF);
part_type_alpha3(_ptype1, 1, 1, 0);
part_type_blend(_ptype1, false);
part_type_life(_ptype1, 140, 250);

_pemit1 = part_emitter_create(_ps);

global.W1ParticleType = _ptype1;
global.W1ParticleEmitter = _pemit1;

part_emitter_region(_ps, global.W1ParticleEmitter, 0, room_width, 0, room_height, ps_shape_rectangle, ps_distr_linear);

//SlugParticle
_ptype1 = part_type_create();
part_type_sprite(_ptype1, sPartSlugMove, false, true, false)
part_type_size(_ptype1, 0.3, 1, 0, 0.3);
part_type_scale(_ptype1, 1, 1);
part_type_speed(_ptype1, 1, 5, -0.01, 0);
part_type_direction(_ptype1, 1, 360, 0, 5);
part_type_gravity(_ptype1, 0, 270);
part_type_orientation(_ptype1, 0, 0, 5, 0, false);
part_type_colour3(_ptype1, $FFFFFF, $FFFFFF, $FFFFFF);
part_type_alpha3(_ptype1, 1, 1, 1);
part_type_blend(_ptype1, false);
part_type_life(_ptype1, 140, 250);

_pemit1 = part_emitter_create(_ps);

global.SlugMoveType = _ptype1;
global.SlugMoveEmitter = _pemit1;
global.p_system = _ps;