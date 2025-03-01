// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scEnemyParticles(ps)   {
    
    var _ps = ps;
    
    //E1Death1
    var _ptype1 = part_type_create();
    part_type_shape(_ptype1, pt_shape_square);
    part_type_size(_ptype1, 0.3, 1.3, 0, 0);
    part_type_scale(_ptype1, 0.1, 0.1);
    part_type_speed(_ptype1, 13, 13, -0.1, 0);
    part_type_direction(_ptype1, 0, 359, 0, 0);
    part_type_gravity(_ptype1, 0, 270);
    part_type_orientation(_ptype1, 0, 0, 0, 0, false);
    part_type_colour3(_ptype1, $FFFFFF, $0000A0, $FFFFFF);
    part_type_alpha3(_ptype1, 1, 1, 0);
    part_type_blend(_ptype1, false);
    part_type_life(_ptype1, 30, 30);
    
    var _pemit1 = part_emitter_create(_ps);
    part_emitter_region(_ps, _pemit1, -32, 32, -32, 32, ps_shape_rectangle, ps_distr_linear);
    part_emitter_burst(_ps, _pemit1, _ptype1, 80);
    
    global.E1Death1Type = _ptype1;
    global.E1Death1Emitter = _pemit1;
    
    //E1Death2
    _ptype1 = part_type_create();
    part_type_shape(_ptype1, pt_shape_line);
    part_type_size(_ptype1, 0.8, 1.5, 0, 0);
    part_type_scale(_ptype1, 0.7, 0.7);
    part_type_speed(_ptype1, 13, 20, -0.1, 0);
    part_type_direction(_ptype1, 0, 359, 0, 0);
    part_type_gravity(_ptype1, 0, 270);
    part_type_orientation(_ptype1, 0, 0, 0, 0, true);
    part_type_colour3(_ptype1, $FFFFFF, $0000A0, $FFFFFF);
    part_type_alpha3(_ptype1, 1, 1, 0);
    part_type_blend(_ptype1, false);
    part_type_life(_ptype1, 30, 30);
    
    _pemit1 = part_emitter_create(_ps);
    
    global.E1Death2Type = _ptype1;
    global.E1Death2Emitter = _pemit1;
    
    //E1Remains
    var _ptype5 = part_type_create();
    part_type_sprite(_ptype5, sPartE1Remains, false, true, false)
    part_type_size(_ptype5, 1, 3, 0, 0);
    part_type_scale(_ptype5, 0.3, 0.3);
    part_type_speed(_ptype5, 0, 0, 0, 0);
    part_type_direction(_ptype5, 0, 359, 0, 0);
    part_type_gravity(_ptype5, 0, 270);
    part_type_orientation(_ptype5, 0, 359, 0, 0, false);
    part_type_colour3(_ptype5, $FFFFFF, $FFFFFF, $FFFFFF);
    part_type_alpha3(_ptype5, 1, 1, 0);
    part_type_blend(_ptype5, false);
    part_type_life(_ptype5, 500, 500);
    
    var _pemit5 = part_emitter_create(_ps);
    
    global.E1RemainsType = _ptype5;
    global.E1RemainsEmitter = _pemit5;
    
    //EShockwaveInner1
    _ptype1 = part_type_create();
    part_type_sprite(_ptype1, sPartShockwaveInner, false, true, false)
    part_type_size(_ptype1, 1, 1, 0.008, 0);
    part_type_scale(_ptype1, 1, 1);
    part_type_speed(_ptype1, 0, 0, 0, 0);
    part_type_direction(_ptype1, 0, 0, 0, 0);
    part_type_gravity(_ptype1, 0, 270);
    part_type_orientation(_ptype1, 0, 0, 0, 0, false);
    part_type_colour3(_ptype1, $FFFFFF, $FFFFFF, $FFFFFF);
    part_type_alpha3(_ptype1, 1, 0, 0);
    part_type_blend(_ptype1, false);
    part_type_life(_ptype1, 80, 80);
    
    _pemit1 = part_emitter_create(_ps);
    
    global.EShockwaveInnerType = _ptype1;
    global.EShockwaveInnerEmitter = _pemit1;
    
    //EShockwaveOuter
    var _ptype2 = part_type_create();
    part_type_sprite(_ptype2, sPartShockwaveOuter, false, true, false)
    part_type_size(_ptype2, 1, 1, 0.1, 0);
    part_type_scale(_ptype2, 1, 1);
    part_type_speed(_ptype2, 0, 0, 0, 0);
    part_type_direction(_ptype2, 0, 0, 0, 0);
    part_type_gravity(_ptype2, 0, 270);
    part_type_orientation(_ptype2, 0, 0, 0, 0, false);
    part_type_colour3(_ptype2, $FFFFFF, $FFFFFF, $FFFFFF);
    part_type_alpha3(_ptype2, 1, 0, 0);
    part_type_blend(_ptype2, false);
    part_type_life(_ptype2, 80, 80);
    
    var _pemit2 = part_emitter_create(_ps);
    
    global.EShockwaveOuterType = _ptype2;
    global.EShockwaveOuterEmitter = _pemit2;

	//SlugDamage
	var _ptype9 = part_type_create();
	part_type_shape(_ptype9, pt_shape_square);
	part_type_size(_ptype9, 0.3, 1, 0, 0.3);
	part_type_scale(_ptype9, 0.2, 0.2);
	part_type_speed(_ptype9, 1, 5, -0.01, 0);
	part_type_direction(_ptype9, 1, 360, 0, 5);
	part_type_gravity(_ptype9, 0, 270);
	part_type_orientation(_ptype9, 0, 0, 5, 0, false);
	part_type_colour3(_ptype9, $000000, $000000, $FFFFFF);
	part_type_alpha3(_ptype9, 1, 0.722, 0);
	part_type_blend(_ptype9, false);
	part_type_life(_ptype9, 140, 250);

	var _pemit9 = part_emitter_create(_ps);
	
	global.SlugDamageType = _ptype9;
	global.SlugDamageEmitter =_pemit9;
}
    
    
    
    
    
    
    
    
    