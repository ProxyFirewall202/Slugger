_sprites_list = scTextureList();

_sprite_index = 0;
_subimg_index = 0;

_total_steps = 0;
_completed_steps = 0;

_i = 0;
while (_i < array_length(_sprites_list)) {
	var _current = _sprites_list[_i];
	_total_steps += sprite_get_number(_current);
	_i ++;
}

_thumbnail_tick = 0;
_alpha = 1;