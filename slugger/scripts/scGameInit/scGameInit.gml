function scGameInit(){
	global._screen_width = display_get_width();
	global._screen_height = display_get_height() - 50;

	window_set_size(1920, 1080);
	surface_resize(application_surface, 1920, 1080);
	window_center();

	audio_channel_num(128);

	game_set_speed(60, gamespeed_fps);

	global._delta_factor = 1;
	global._sound_pitch_scale = 1;
	#macro pitchscale global._sound_pitch_scale
	#macro delta global._delta_factor

	display_reset(0, false);

	scGenericInit();
}