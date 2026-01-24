draw_sprite(sRUNUIBG, 0, 0, 0);
_freq += 0.12;
_anim = sin(_freq) / lerp(70, 1000, global._slug_health / global._slug_max_health);
if (_last_health != global._slug_health) {
    _last_health = global._slug_health
    _health_change_start = _tick;
    _new_dmg = true;
}
if (_tick > _health_change_start + 30) {
    _new_dmg = false;
}
var _i = 0;
repeat (floor(global._max_slug_health / 20)) {
    draw_sprite_ext(sGreyHeart, 0, 680 + 55 * _i, 65, 0.06 + _anim, 0.06 + _anim, 0, c_white, 1);
    _i ++;
}
_i = 0;
repeat (floor(global._slug_health / 20)) {
    if (_new_dmg && _i == floor(global._slug_health / 20) - 1 && !(global._slug_health % 20 > 9 || global._slug_health < 10)) gpu_set_fog(true,c_white,0,0);
    draw_sprite_ext(sHeart, 0, 680 + 55 * _i, 65, 0.06 + _anim, 0.06 + _anim, 0, c_white, 1);
    gpu_set_fog(false,c_white,0,0);
    _i ++;
}

if (global._slug_health % 20 > 9 || global._slug_health < 10) {
    if (_new_dmg) gpu_set_fog(true,c_white,0,0);
    draw_sprite_ext(sHalfHeart, 0, 680 + 55 * _i, 65, 0.06 + _anim, 0.06 + _anim, 0, c_white, 1);
    gpu_set_fog(false,c_white,0,0);
}
draw_set_font(fDLEComicLowercase);
font_enable_effects(fDLEComicLowercase, true, {
	glowEnable : true,
	glowStart : 0,
	glowEnd : 3,
	glowColour : c_white});
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text_transformed_colour(740, 27, "HP: " + string(floor(global._slug_health)) + "/" + string(global._slug_max_health),
1, 1, 0, c_white, c_white, c_white, c_white, 1
);

font_enable_effects(fDLEComicLowercase, true, {
	glowEnable : true,
	glowStart : 0.5,
	glowEnd : 1,
	glowColour : c_white});

draw_text_transformed_colour(130, 55, "WAVE " + string(global._wave),
3, 3, 0, c_white, c_white, c_white, c_white, 1
);
draw_set_halign(fa_left);
draw_text_transformed_colour(1405, 40, string(global._warped_souls),
2.3, 2.3, 0, c_green, c_green, c_green, c_green, 1
);

with (oWarpedSoul) {
    if (_state == 2) {
        draw_sprite_ext(sWarpedSoul, 0, x, y, 1, 1, 0, c_white, 1);
    }
}