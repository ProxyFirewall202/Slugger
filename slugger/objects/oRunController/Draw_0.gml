if global._run_state == 1 {
	var _i = 0;
	var _info;
	repeat(array_length(_current_dmg)) {
		if _current_dmg[_i] != undefined {
			_info = _current_dmg[_i];
			_info.lifetime ++;
			draw_set_font(fDLEComicLowercase);
			_info.glow += _info.glowstate;
			if (_info.glow >= 1) {
				_info.glowstate = -0.02;
				_info.glow = 1
			} else {
				if (_info.glow <= 0) {
					_info.glowstate = 0.02;
					_info.glow = 0;
				}
			}
			var _glow_start = lerp(0, 0.5, real(_info.glow));
			var _glow_end = lerp(2, 10, real(_info.glow));
		
		
			if (_info.lifetime <= 30) {
				_info.alpha = lerp(0, 1, _info.lifetime / 30);
			} else {
				_info.alpha = lerp(1, 0, (_info.lifetime - 30) / 30);
			}
			
			var _old_data = _current_dmg[_i];
		
			font_enable_effects(fDLEComicLowercase, true, {
			glowEnable : true,
			glowStart : _glow_start,
			glowEnd : _glow_end,
			glowColour : _info.colour});
			_info.realx = _info.xpos;
			_info.realy = lerp(_info.realy, _info.ypos, 0.05)
			if (_info.damagetype == 0) {
				draw_text_transformed_color(_info.realx, _info.realy, "+" + string(_info.damage), _info.scale, _info.scale, 0, _info.colour, _info.colour, _info.colour, _info.colour, _info.alpha);
			} else if (_info.damagetype == 1) {
				draw_text_transformed_color(_info.realx, _info.realy, "-" + string(_info.damage), _info.scale, _info.scale, 0, _info.colour, _info.colour, _info.colour, _info.colour, _info.alpha);
			} else {
				draw_text_transformed_color(_info.realx, _info.realy, "x" + string(global._combo) + " Combo", _info.scale, _info.scale, 0, _info.colour, _info.colour, _info.colour, _info.colour, _info.alpha);
			}
			current_dmg[_i] = _info;
			if ((_info.lifetime - 30) > 100) _current_dmg[_i] = undefined;
		}
		_i ++;
	}
}