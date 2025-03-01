var _my_data = ds_map_find_value(enemies_list, my_id);

var _health_ratio = my_health / _my_data.maxhealth;

var scaled_width = sprite_get_width(sHealthBarMain) * _health_ratio;

var _fg_y = (ypos - sprite_get_height(sHealthBarMain) / 2) - spr_height / 2;
var _fg_x = (xpos - sprite_get_width(sHealthBarMain) / 2);

var _bg_y = (ypos - sprite_get_height(sHealthBarBG) / 2) - spr_height / 2;
var _bg_x = xpos - sprite_get_width(sHealthBarBG) / 2;

var color_full = make_color_rgb(0, 200, 0);
var color_empty = make_color_rgb(200, 0, 0);

var _health_colour = make_color_rgb(
    lerp(color_get_red(color_empty), color_get_red(color_full), _health_ratio),
    lerp(color_get_green(color_empty), color_get_green(color_full), _health_ratio),
    lerp(color_get_blue(color_empty), color_get_blue(color_full), _health_ratio)
);

draw_sprite_stretched(sHealthBarBG, 1, _bg_x, _bg_y, sprite_get_width(sHealthBarBG), sprite_get_height(sHealthBarBG));


var _lhealth_ratio = last_health / _my_data.maxhealth;
var _lscaled_width = sprite_get_width(sHealthBarMain) * _lhealth_ratio;

_lscaled_width = lerp(_lscaled_width, scaled_width, clamp((tick - last_update) / 100, 0, 1));
	
var _lfg_y = (ypos - sprite_get_height(sHealthBarMain) / 2) - spr_height / 2;
var _lfg_x = (xpos - sprite_get_width(sHealthBarMain) / 2);
	
draw_sprite_stretched_ext(sHealthBarMain, 1, _lfg_x, _lfg_y, _lscaled_width, sprite_get_height(sHealthBarMain), c_white, 0.4);
/*if tick mod 100 == 0 {
	last_health = my_health;
	last_update = tick;
}*/

draw_sprite_stretched_ext(sHealthBarMain, 1, _fg_x, _fg_y, scaled_width, sprite_get_height(sHealthBarMain), _health_colour, 1);
draw_set_color(_health_colour);



draw_set_font(fDLEComicLowercase);
draw_set_valign(fa_middle);
draw_set_halign(fa_center);
font_enable_effects(fDLEComicLowercase, true, {
	glowEnable : true,
	glowStart : 0.3,
	glowEnd : 3,
	glowColour : c_red});
draw_text_transformed_color(xpos, ypos - 50, string(my_health) + "/" + string(_my_data.maxhealth) + " HP", 0.8, 0.8, 0, c_red, c_red, c_red, c_red, 1);

instance_destroy();