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

//0ELSwitch3
var _ptype15 = part_type_create();
part_type_shape(_ptype15, pt_shape_cloud);
part_type_size(_ptype15, 0.8, 1.5, 0, 0);
part_type_scale(_ptype15, 2, 2);
part_type_speed(_ptype15, 1, 1, 0.07, 0);
part_type_direction(_ptype15, 0, 359, 3, 0);
part_type_gravity(_ptype15, 0, 270);
part_type_orientation(_ptype15, 0, 0, 5, 0, true);
part_type_colour3(_ptype15, $E0E0E0, $999999, $FFFFFF);
part_type_alpha3(_ptype15, 0, 1, 0);
part_type_blend(_ptype15, false);
part_type_life(_ptype15, 220, 240);

var _pemit15 = part_emitter_create(_ps);

//0ELSwitch2
var _ptype14 = part_type_create();
part_type_shape(_ptype14, pt_shape_square);
part_type_size(_ptype14, 0.8, 1.5, 0, 0);
part_type_scale(_ptype14, 0.1, 0.1);
part_type_speed(_ptype14, 1.3, 2, -0.01, 0);
part_type_direction(_ptype14, 0, 359, 0, 0);
part_type_gravity(_ptype14, 0, 270);
part_type_orientation(_ptype14, 0, 0, 0, 0, true);
part_type_colour3(_ptype14, $FFFFFF, $CCCCCC, $FFFFFF);
part_type_alpha3(_ptype14, 1, 1, 0);
part_type_blend(_ptype14, false);
part_type_life(_ptype14, 220, 250);

var _pemit14 = part_emitter_create(_ps);

//0ELSwitch1
var _ptype9 = part_type_create();
part_type_shape(_ptype9, pt_shape_line);
part_type_size(_ptype9, 0.8, 1.5, 0, 0);
part_type_scale(_ptype9, 0.7, 0.7);
part_type_speed(_ptype9, 1.3, 2, -0.01, 0);
part_type_direction(_ptype9, 0, 359, 0, 0);
part_type_gravity(_ptype9, 0, 270);
part_type_orientation(_ptype9, 0, 0, 0, 0, true);
part_type_colour3(_ptype9, $FFFFFF, $AFAFAF, $FFFFFF);
part_type_alpha3(_ptype9, 1, 1, 0);
part_type_blend(_ptype9, false);
part_type_life(_ptype9, 220, 250);

var _pemit9 = part_emitter_create(_ps);

//EL1Switch3
var _ptype5 = part_type_create();
part_type_shape(_ptype5, pt_shape_cloud);
part_type_size(_ptype5, 0.8, 1.5, 0, 0);
part_type_scale(_ptype5, 2, 2);
part_type_speed(_ptype5, 1, 1, 0.07, 0);
part_type_direction(_ptype5, 0, 359, 3, 0);
part_type_gravity(_ptype5, 0, 270);
part_type_orientation(_ptype5, 0, 0, 5, 0, true);
part_type_colour3(_ptype5, $0072FF, $0064FF, $FFFFFF);
part_type_alpha3(_ptype5, 0, 1, 0);
part_type_blend(_ptype5, false);
part_type_life(_ptype5, 220, 240);

var _pemit5 = part_emitter_create(_ps);

//EL1Switch2
var _ptype6 = part_type_create();
part_type_shape(_ptype6, pt_shape_square);
part_type_size(_ptype6, 0.8, 1.5, 0, 0);
part_type_scale(_ptype6, 0.1, 0.1);
part_type_speed(_ptype6, 1.3, 2, -0.01, 0);
part_type_direction(_ptype6, 0, 359, 0, 0);
part_type_gravity(_ptype6, 0, 270);
part_type_orientation(_ptype6, 0, 0, 0, 0, true);
part_type_colour3(_ptype6, $0073FF, $0021F1, $FFFFFF);
part_type_alpha3(_ptype6, 1, 1, 0);
part_type_blend(_ptype6, false);
part_type_life(_ptype6, 220, 250);

var _pemit6 = part_emitter_create(_ps);

//EL1Switch1
var _ptype7 = part_type_create();
part_type_shape(_ptype7, pt_shape_line);
part_type_size(_ptype7, 0.8, 1.5, 0, 0);
part_type_scale(_ptype7, 0.7, 0.7);
part_type_speed(_ptype7, 1.3, 2, -0.01, 0);
part_type_direction(_ptype7, 0, 359, 0, 0);
part_type_gravity(_ptype7, 0, 270);
part_type_orientation(_ptype7, 0, 0, 0, 0, true);
part_type_colour3(_ptype7, $CCE3FF, $0021F1, $FFFFFF);
part_type_alpha3(_ptype7, 1, 1, 0);
part_type_blend(_ptype7, false);
part_type_life(_ptype7, 220, 250);

var _pemit7 = part_emitter_create(_ps);

//EL2Switch3
var _ptype13 = part_type_create();
part_type_shape(_ptype13, pt_shape_cloud);
part_type_size(_ptype13, 0.8, 1.5, 0, 0);
part_type_scale(_ptype13, 2, 2);
part_type_speed(_ptype13, 1, 1, 0.07, 0);
part_type_direction(_ptype13, 0, 359, 3, 0);
part_type_gravity(_ptype13, 0, 270);
part_type_orientation(_ptype13, 0, 0, 5, 0, true);
part_type_colour3(_ptype13, $E2AC24, $E59100, $FFFFFF);
part_type_alpha3(_ptype13, 0, 1, 0);
part_type_blend(_ptype13, false);
part_type_life(_ptype13, 220, 240);

var _pemit13 = part_emitter_create(_ps);

//EL2Switch2
var _ptype12 = part_type_create();
part_type_shape(_ptype12, pt_shape_square);
part_type_size(_ptype12, 0.8, 1.5, 0, 0);
part_type_scale(_ptype12, 0.1, 0.1);
part_type_speed(_ptype12, 1.3, 2, -0.01, 0);
part_type_direction(_ptype12, 0, 359, 0, 0);
part_type_gravity(_ptype12, 0, 270);
part_type_orientation(_ptype12, 0, 0, 0, 0, true);
part_type_colour3(_ptype12, $FF8138, $CC7C14, $FFFFFF);
part_type_alpha3(_ptype12, 1, 1, 0);
part_type_blend(_ptype12, false);
part_type_life(_ptype12, 220, 250);

var _pemit12 = part_emitter_create(_ps);

//EL2Switch1
 var _ptype11 = part_type_create();
part_type_shape(_ptype11, pt_shape_line);
part_type_size(_ptype11, 0.8, 1.5, 0, 0);
part_type_scale(_ptype11, 0.7, 0.7);
part_type_speed(_ptype11, 1.3, 2, -0.01, 0);
part_type_direction(_ptype11, 0, 359, 0, 0);
part_type_gravity(_ptype11, 0, 270);
part_type_orientation(_ptype11, 0, 0, 0, 0, true);
part_type_colour3(_ptype11, $FFDE99, $B27900, $FFFFFF);
part_type_alpha3(_ptype11, 1, 1, 0);
part_type_blend(_ptype11, false);
part_type_life(_ptype11, 220, 250);

var _pemit11 = part_emitter_create(_ps);

global.ELSwitch = {
	e0 : {
		types : {
			s1 : _ptype9,
			s2 : _ptype14,
			s3 : _ptype15
		},
		emitters : {
			s1 : _pemit9,
			s2 : _pemit14,
			s3 : _pemit15
		}
	},
	e1 : {
		types : {
			s1 : _ptype7,
			s2 : _ptype6,
			s3 : _ptype5
		},
		emitters : {
			s1 : _pemit7,
			s2 : _pemit6,
			s3 : _pemit5
		}
	},
	e2 : {
		types : {
			s1 : _ptype13,
			s2 : _ptype12,
			s3 : _ptype11
		},
		emitters : {
			s1 : _pemit13,
			s2 : _pemit12,
			s3 : _pemit11
		}
	}
};
	

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

//PowerupCollect
var _ptype4 = part_type_create();
part_type_sprite(_ptype4, sDmgT1, false, true, false)
part_type_size(_ptype4, 0.8, 1.5, 0, 0);
part_type_scale(_ptype4, 0.5, 0.5);
part_type_speed(_ptype4, 6, 13, -0.1, 0);
part_type_direction(_ptype4, 0, 359, 0, 0);
part_type_gravity(_ptype4, 0, 270);
part_type_orientation(_ptype4, 0, 0, 0, 0, true);
part_type_colour3(_ptype4, $FFFFFF, $FFFFFF, $FFFFFF);
part_type_alpha3(_ptype4, 0.392, 0.196, 0);
part_type_blend(_ptype4, false);
part_type_life(_ptype4, 80, 80);

var _pemit4 = part_emitter_create(_ps);

global.PowerupCollectType = _ptype4;
global.PowerupCollectEmitter = _pemit4;

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

//HealthParticle
var _ptype10 = part_type_create();
part_type_sprite(_ptype10, sPartHealth, false, true, false)
part_type_size(_ptype10, 0.3, 1, 0, 0.1);
part_type_scale(_ptype10, 0.01, 0.01);
part_type_speed(_ptype10, 1, 5, -0.01, 0);
part_type_direction(_ptype10, 1, 360, 0, 5);
part_type_gravity(_ptype10, 0, 270);
part_type_orientation(_ptype10, 0, 0, 0, 0, false);
part_type_colour3(_ptype10, $FFFFFF, $FFFFFF, $FFFFFF);
part_type_alpha3(_ptype10, 1, 1, 0);
part_type_blend(_ptype10, false);
part_type_life(_ptype10, 140, 250);

var _pemit10 = part_emitter_create(_ps);
global.HealthPartType = _ptype10;
global.HealthPartEmitter = _pemit10;

//DamageParticle
_ptype10 = part_type_create();
part_type_sprite(_ptype10, sPartDamage, false, true, false)
part_type_size(_ptype10, 0.3, 1, 0, 0.1);
part_type_scale(_ptype10, 0.05, 0.05);
part_type_speed(_ptype10, 1, 5, -0.01, 0);
part_type_direction(_ptype10, 1, 360, 0, 5);
part_type_gravity(_ptype10, 0, 270);
part_type_orientation(_ptype10, 0, 0, 5, 0, false);
part_type_colour3(_ptype10, $FFFFFF, $FFFFFF, $FFFFFF);
part_type_alpha3(_ptype10, 1, 1, 0);
part_type_blend(_ptype10, false);
part_type_life(_ptype10, 140, 250);

_pemit10 = part_emitter_create(_ps);
global.DamagePartType = _ptype10;
global.DamagePartEmitter = _pemit10;
global.p_system = _ps;