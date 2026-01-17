function scW1Schedule(){
	
	//Add to ds_map
	function AddEnemy(_input) {
		if (_input.num == undefined) {
			ds_map_add(global.W1Schedule, ds_map_size(global.W1Schedule) + 1, _input);
		} else {
			ds_map_add(global.W1Schedule, _num, _input);
		}
	}
	
	//Batch 1
	//Spawn each side instantly
	AddEnemy({
		num : undefined,
		xpos : room_width / 2,
		ypos : room_height,
		dir : 90,
		enemy : 1,
		tickdel : 0,
		distance : 0.5,
		shoottime : 20,
		follow : false,
		gun : 1,
		spd : 0.5
	});
	AddEnemy({
		num : undefined,
		xpos : room_width / 2,
		ypos : 0,
		dir : 270,
		enemy : 1,
		tickdel : 0,
		distance : 0.5,
		shoottime : 50,
		follow : false,
		gun : 1,
		spd : 0.5
	});
	AddEnemy({
		num : undefined,
		xpos : 0,
		ypos : room_height / 2,
		dir : 0,
		enemy : 1,
		tickdel : 0,
		distance : 0.5,
		shoottime : 50,
		follow : false,
		gun : 1,
		spd : 0.5
	});
	AddEnemy({
		num : undefined,
		xpos : room_width,
		ypos : room_height / 2,
		dir : 180,
		enemy : 1,
		tickdel : 0,
		distance : 0.5,
		shoottime : 50,
		follow : false,
		gun : 1,
		spd : 0.5
	});
	
	//Batch 2
	AddEnemy({
		num : undefined,
		xpos : 950,
		ypos : 540,
		dir : 0,
		enemy : 1,
		tickdel : 500,
		distance : 2,
		shoottime : 0,
		follow : true,
		gun : 1,
		spd : 5
	});
}