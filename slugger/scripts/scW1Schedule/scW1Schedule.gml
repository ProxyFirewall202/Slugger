function scW1Schedule(){
	
	//Add to ds_map
	function AddEnemy(_num, _x, _y, _dir, _enemy, _tick_delay, _dis) {
		if (_num == undefined) {
			ds_map_add(global.W1Schedule, ds_map_size(global.W1Schedule) + 1, scSpawnData(_x, _y, _dir, _enemy, _tick_delay, _dis));
		} else {
			ds_map_add(global.W1Schedule, _num, scSpawnData(_x, _y, _dir, _enemy, _tick_delay, _dis));
		}
	}
	
	//Batch 1
	AddEnemy(undefined, room_width / 2, room_height, 0, 1, 0, 50);
	AddEnemy(undefined, room_width / 2, 0, 0, 1, 0, 50);
	AddEnemy(undefined, 0, room_height / 2, 0, 1, 0, 50);
	AddEnemy(undefined, room_width, room_height / 2, 0, 1, 300, 50);
	
	//Batch 2
	AddEnemy(undefined, room_width, room_height / 2, 0, 1, 0, 50);
}