global._tick ++;

if keyboard_check_pressed(ord("L")) {
	global._run_state = (!global._run_state);
	show_debug_message(global._run_state);
	if global._run_state == 1 {
		scInitRun();
	} else {
		with (all) {
			if (run_only == 1) {
				instance_destroy();
			}
		}
	}
}

fx_set_parameter(global._screenshake_info, "g_Magnitude", global._scrshake.mag);
fx_set_parameter(global._screenshake_info, "g_ShakeSpeed", global._scrshake.spd);
global._scrshake.mag -= global._scrshake.mag / 20;
global._scrshake.spd -= global._scrshake.spd / 20;

/*var _fx_struct, _fx_params, _fx_param_nams;
_fx_struct = layer_get_fx("ScreenShake");
_fx_params = fx_get_parameters(_fx_struct);
_fx_param_nams = fx_get_parameter_names(_fx_struct);*/