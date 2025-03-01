_tick += 1

//Key detection
_xvel += ((keyboard_check(vk_right) || keyboard_check(ord("D"))) - (keyboard_check(vk_left) || keyboard_check(ord("A")))) * _speed;
_yvel += ((keyboard_check(vk_down) || keyboard_check(ord("S"))) - (keyboard_check(vk_up) || keyboard_check(ord("W")))) * _speed;

//Edge tp
if (x > room_width) {x = 0; _xvel -= 13};
if (x < 0) {x = room_width; _xvel += 13};
if (y > room_height) {y = 0; _yvel -= 13};
if (y < 0) {y = room_height; _yvel += 13};

//Move
x += _xvel;
y += _yvel;

//Grow when moving
_my_size = 1 + (((abs(_xvel) + abs(_yvel)) / 4) / 20);

//Particles
part_emitter_region(global.p_system, global.SlugMoveEmitter, bbox_left, bbox_right, bbox_top, bbox_bottom, ps_shape_ellipse, ps_distr_linear);
if (irandom(32 - (abs(_xvel) + abs(_yvel))) == 0) {
	part_emitter_burst(global.p_system, global.SlugMoveEmitter, global.SlugMoveType, 1);
}

//Friction
_xvel *= 0.9;
_yvel *= 0.9;

//Point towards mouse
image_angle = point_direction(x, y, mouse_x, mouse_y);

//Set size
image_xscale = _my_size;
image_yscale = _my_size;