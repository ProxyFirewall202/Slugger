_tick ++;

if (mouse_check_button(mb_left)) && (global._current_weapon_cooldown < 1) {
	_using = true;

	//Screen shake
	_scrshake_vals.mag += (0.5 - _scrshake_vals.mag) * 0.05;
	_scrshake_vals.spd += (0.5 - _scrshake_vals.spd) * 0.05;
} else {
	_using = false;
	if global._current_weapon_cooldown > 0 {
		global._current_weapon_cooldown -= delta;
	}
}

if !(_scrshake_vals.mag == 0 && _scrshake_vals.spd == 0) {
	_scrshake_vals.mag -= _scrshake_vals.mag / 20;
	_scrshake_vals.spd -= _scrshake_vals.spd / 20;
}

global._scrshake.mag += _scrshake_vals.mag;
global._scrshake.spd += _scrshake_vals.spd;