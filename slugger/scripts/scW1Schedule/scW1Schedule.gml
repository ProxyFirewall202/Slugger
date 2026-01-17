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
		distance : 100,
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
		distance : 100,
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
		distance : 100,
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
		distance : 100,
		shoottime : 50,
		follow : false,
		gun : 1,
		spd : 0.5
	});
	
	//Batch 2
	//Two enemies that come out from each side very fast and follow player, delay in between
	AddEnemy({
		num : undefined,
		xpos : room_width,
		ypos : room_height / 2,
		dir : 0,
		enemy : 1,
		tickdel : 1200,
		distance : infinity,
		shoottime : 0,
		follow : true,
		gun : 1,
		spd : 3
	});
	AddEnemy({
		num : undefined,
		xpos : 0,
		ypos : room_height / 2,
		dir : 0,
		enemy : 1,
		tickdel : 400,
		distance : infinity,
		shoottime : 0,
		follow : true,
		gun : 1,
		spd : 3
	});
	
	//Batch 3
	//Four enemies come from top of screen fast then stop at different distances
	AddEnemy({
		num : undefined,
		xpos : room_width - 320,
		ypos : 0,
		dir : 270,
		enemy : 1,
		tickdel : 500,
		distance : 20,
		shoottime : 60,
		follow : false,
		gun : 1,
		spd : 15
	});
	AddEnemy({
		num : undefined,
		xpos : room_width - 720,
		ypos : 0,
		dir : 270,
		enemy : 1,
		tickdel : 60,
		distance : 15,
		shoottime : 60,
		follow : false,
		gun : 1,
		spd : 15
	});
	AddEnemy({
		num : undefined,
		xpos : room_width - 1120,
		ypos : 0,
		dir : 270,
		enemy : 1,
		tickdel : 60,
		distance : 10,
		shoottime : 60,
		follow : false,
		gun : 1,
		spd : 15
	});
	AddEnemy({
		num : undefined,
		xpos : room_width - 1520,
		ypos : 0,
		dir : 270,
		enemy : 1,
		tickdel : 60,
		distance : 5,
		shoottime : 60,
		follow : false,
		gun : 1,
		spd : 15
	});
	//Batch 4
	//Four enemies come from bottom of screen fast then stop at different distances
	AddEnemy({
		num : undefined,
		xpos : room_width - 320,
		ypos : room_height,
		dir : 90,
		enemy : 1,
		tickdel : 500,
		distance : 20,
		shoottime : 60,
		follow : false,
		gun : 1,
		spd : 15
	});
	AddEnemy({
		num : undefined,
		xpos : room_width - 720,
		ypos : room_height,
		dir : 90,
		enemy : 1,
		tickdel : 60,
		distance : 15,
		shoottime : 60,
		follow : false,
		gun : 1,
		spd : 15
	});
	AddEnemy({
		num : undefined,
		xpos : room_width - 1120,
		ypos : room_height,
		dir : 90,
		enemy : 1,
		tickdel : 60,
		distance : 10,
		shoottime : 60,
		follow : false,
		gun : 1,
		spd : 15
	});
	AddEnemy({
		num : undefined,
		xpos : room_width - 1520,
		ypos : room_height,
		dir : 90,
		enemy : 1,
		tickdel : 60,
		distance : 5,
		shoottime : 60,
		follow : false,
		gun : 1,
		spd : 15
	});
}
