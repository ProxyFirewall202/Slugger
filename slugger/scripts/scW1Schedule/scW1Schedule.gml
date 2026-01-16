function scW1Schedule(){
	
	//Add to ds_map
	function AddEnemy(_num, _x, _y, _dir, _enemy, _tick_delay, _dis, _shoot_time, _follow, _gun, _spd) {
		var _data = {
			xpos : _x,
			ypos : _y,
			dir : _dir,
			enemy : _enemy,
			tickdel : _tick_delay,
			distance : _dis,
			shoottime : _shoot_time,
			follow : _follow,
			gun : _gun,
			spd : _spd
		};
			
		if (_num == undefined) {
			ds_map_add(global.W1Schedule, ds_map_size(global.W1Schedule) + 1, _data);
		} else {
			ds_map_add(global.W1Schedule, _num, _data);
		}
	}
	
	//Batch 1
	AddEnemy(undefined, room_width / 2, room_height, 0, 1, 1200, 50, 120, false, 1, 5);
	AddEnemy(undefined, room_width / 2, 0, 0, 1, 340, 50, 120, false, 1, 5);
	AddEnemy(undefined, 0, room_height / 2, 0, 1, 0, 50, 120, false, 1, 5);
	AddEnemy(undefined, room_width, room_height / 2, 0, 1, 600, 50, 120, false, 1, 5);
	
	//Batch 2
	AddEnemy(undefined, 500, 800, 0, 1, 30, 50, 120, false, 1, 5);
}