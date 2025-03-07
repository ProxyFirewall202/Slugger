event_inherited();
x = room_width / 2;
y = room_height / 2;
part_emitter_region(global.p_system, global.E1Death1Emitter, x - 20, x + 20, y - 20, y + 20, ps_shape_rectangle, ps_distr_linear);
part_emitter_burst(global.p_system, global.E1Death1Emitter, global.E1Death1Type, 5);
image_speed = 1;
image_index = 120;
_state = 0;
_step = 0;
_death_step = "NA";
_spawn_step = 0;
_hit = 0;
_last_hit = 0
_state3_pushed = false;