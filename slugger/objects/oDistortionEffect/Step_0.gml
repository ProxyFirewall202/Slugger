radius += (_rad_state - radius) * 0.01;
if radius <= 0 {
	layer_destroy(string(_my_id));
	global._distort_count --;
	instance_destroy();
}
angle += (_angle_state - angle) * 0.05;
if (angle == _angle_state) {
	_angle_state = -_angle_state;
}

fx_set_parameter(_distort_info, "g_DistortAngle", angle);
fx_set_parameter(_distort_info, "g_DistortRadius", radius);