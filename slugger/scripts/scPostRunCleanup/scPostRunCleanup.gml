function scPostRunCleanup(){
	show_debug_message("BEGINNING POST RUN CLEANUP!");
	global._run_state = 0;
	with (all) {
		if (run_only == 1) {
			instance_destroy();
		}
	}
	ds_map_destroy(global._bullets);
	ds_map_destroy(global._enemies);
	ds_map_destroy(global._powerups);
	ds_map_destroy(global._powerup_names);
	audio_stop_all();
}