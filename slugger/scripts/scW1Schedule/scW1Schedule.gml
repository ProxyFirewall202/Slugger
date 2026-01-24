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
		tickdel : 300,
		distance : 100,
		shoottime : 20,
		follow : false,
		gun : 1,
		spd : 0.5
	});
	AddEnemy({
		num : undefined,
		xpos : room_width / 2,
		ypos : 100,
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
		ypos : 100,
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
		ypos : 100,
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
		ypos : 100,
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
		ypos : 100,
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
	//Batch 5
	//Enemies close in from corners slowly
	AddEnemy({
		num : undefined,
		xpos : 0,
		ypos : room_height,
		dir : 45,
		enemy : 1,
		tickdel : 300,
		distance : 200,
		shoottime : 20,
		follow : false,
		gun : 1,
		spd : 1
	});
	AddEnemy({
		num : undefined,
		xpos : room_width,
		ypos : room_height,
		dir : 135,
		enemy : 1,
		tickdel : 0,
		distance : 200,
		shoottime : 50,
		follow : false,
		gun : 1,
		spd : 1
	});
	AddEnemy({
		num : undefined,
		xpos : 0,
		ypos : 100,
		dir : 315,
		enemy : 1,
		tickdel : 0,
		distance : 200,
		shoottime : 50,
		follow : false,
		gun : 1,
		spd : 1
	});
	AddEnemy({
		num : undefined,
		xpos : room_width,
		ypos : 100,
		dir : 225,
		enemy : 1,
		tickdel : 0,
		distance : 200,
		shoottime : 50,
		follow : false,
		gun : 1,
		spd : 1
	});
	//Batch 6
	//Three enemies that come from top of screen fast and follow player, delay in between
	AddEnemy({
		num : undefined,
		xpos : room_width,
		ypos : 100,
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
		xpos : room_width / 2,
		ypos : 100,
		dir : 0,
		enemy : 1,
		tickdel : 50,
		distance : infinity,
		shoottime : 0,
		follow : true,
		gun : 1,
		spd : 3
	});
	AddEnemy({
		num : undefined,
		xpos : 0,
		ypos : 100,
		dir : 0,
		enemy : 1,
		tickdel : 50,
		distance : infinity,
		shoottime : 0,
		follow : true,
		gun : 1,
		spd : 3
	});
	//Batch 7
	//Three enemies that come from bottom of screen fast and follow player, delay in between
	AddEnemy({
		num : undefined,
		xpos : room_width,
		ypos : room_height,
		dir : 0,
		enemy : 1,
		tickdel : 300,
		distance : infinity,
		shoottime : 0,
		follow : true,
		gun : 1,
		spd : 3
	});
	AddEnemy({
		num : undefined,
		xpos : room_width / 2,
		ypos : room_height,
		dir : 0,
		enemy : 1,
		tickdel : 50,
		distance : infinity,
		shoottime : 0,
		follow : true,
		gun : 1,
		spd : 3
	});
	AddEnemy({
		num : undefined,
		xpos : 0,
		ypos : room_height,
		dir : 0,
		enemy : 1,
		tickdel : 50,
		distance : infinity,
		shoottime : 0,
		follow : true,
		gun : 1,
		spd : 3
	});
	//Batch 8
	//Eight enmies come from sides, two on each side
	AddEnemy({
		num : undefined,
		xpos : 0,
		ypos : room_height - room_height / 4,
		dir : 0,
		enemy : 1,
		tickdel : 120,
		distance : 100,
		shoottime : 0,
		follow : false,
		gun : 1,
		spd : 2
	});
	AddEnemy({
		num : undefined,
		xpos : 0,
		ypos : room_height / 4,
		dir : 0,
		enemy : 1,
		tickdel : 0,
		distance : 100,
		shoottime : 0,
		follow : false,
		gun : 1,
		spd : 2
	});
	AddEnemy({
		num : undefined,
		xpos : room_width,
		ypos : room_height - room_height / 4,
		dir : 180,
		enemy : 1,
		tickdel : 60,
		distance : 100,
		shoottime : 0,
		follow : false,
		gun : 1,
		spd : 2
	});
	AddEnemy({
		num : undefined,
		xpos : room_width,
		ypos : room_height / 4,
		dir : 180,
		enemy : 1,
		tickdel : 0,
		distance : 100,
		shoottime : 0,
		follow : false,
		gun : 1,
		spd : 2
	});
	AddEnemy({
		num : undefined,
		xpos : room_width - room_width / 4,
		ypos : 100,
		dir : 270,
		enemy : 1,
		tickdel : 60,
		distance : 50,
		shoottime : 0,
		follow : false,
		gun : 1,
		spd : 2
	});
	AddEnemy({
		num : undefined,
		xpos : room_width / 4,
		ypos : 100,
		dir : 270,
		enemy : 1,
		tickdel : 0,
		distance : 50,
		shoottime : 0,
		follow : false,
		gun : 1,
		spd : 2
	});
	AddEnemy({
		num : undefined,
		xpos : room_width - room_width / 4,
		ypos : room_height,
		dir : 90,
		enemy : 1,
		tickdel : 60,
		distance : 50,
		shoottime : 0,
		follow : false,
		gun : 1,
		spd : 2
	});
	AddEnemy({
		num : undefined,
		xpos : room_width / 4,
		ypos : room_height,
		dir : 90,
		enemy : 1,
		tickdel : 0,
		distance : 50,
		shoottime : 0,
		follow : false,
		gun : 1,
		spd : 2
	});
	//Batch 9
	//Three enemies that come from bottom of screen fast and follow player, delay in between
	AddEnemy({
		num : undefined,
		xpos : room_width,
		ypos : room_height,
		dir : 0,
		enemy : 1,
		tickdel : 1200,
		distance : infinity,
		shoottime : 0,
		follow : true,
		gun : 1,
		spd : 4
	});
	AddEnemy({
		num : undefined,
		xpos : room_width / 2,
		ypos : room_height,
		dir : 0,
		enemy : 1,
		tickdel : 50,
		distance : infinity,
		shoottime : 0,
		follow : true,
		gun : 1,
		spd : 4
	});
	AddEnemy({
		num : undefined,
		xpos : 0,
		ypos : room_height,
		dir : 0,
		enemy : 1,
		tickdel : 50,
		distance : infinity,
		shoottime : 0,
		follow : true,
		gun : 1,
		spd : 4
	});
	//Batch 12
	//Three enemies that come from top of screen fast and follow player, delay in between
	AddEnemy({
		num : undefined,
		xpos : room_width,
		ypos : 100,
		dir : 0,
		enemy : 1,
		tickdel : 300,
		distance : infinity,
		shoottime : 0,
		follow : true,
		gun : 1,
		spd : 4
	});
	AddEnemy({
		num : undefined,
		xpos : room_width / 2,
		ypos : 100,
		dir : 0,
		enemy : 1,
		tickdel : 50,
		distance : infinity,
		shoottime : 0,
		follow : true,
		gun : 1,
		spd : 4
	});
	AddEnemy({
		num : undefined,
		xpos : 0,
		ypos : 100,
		dir : 0,
		enemy : 1,
		tickdel : 50,
		distance : infinity,
		shoottime : 0,
		follow : true,
		gun : 1,
		spd : 4
	});
	//Batch 13
	//Three enemies that come from bottom of screen fast and follow player, delay in between
	AddEnemy({
		num : undefined,
		xpos : room_width,
		ypos : room_height,
		dir : 0,
		enemy : 1,
		tickdel : 300,
		distance : infinity,
		shoottime : 0,
		follow : true,
		gun : 1,
		spd : 4
	});
	AddEnemy({
		num : undefined,
		xpos : room_width / 2,
		ypos : room_height,
		dir : 0,
		enemy : 1,
		tickdel : 50,
		distance : infinity,
		shoottime : 0,
		follow : true,
		gun : 1,
		spd : 4
	});
	AddEnemy({
		num : undefined,
		xpos : 0,
		ypos : room_height,
		dir : 0,
		enemy : 1,
		tickdel : 50,
		distance : infinity,
		shoottime : 0,
		follow : true,
		gun : 1,
		spd : 4
	});
	//Batch 15
	//Enemies repeatedly come from same spot with delays in between
	AddEnemy({
		num : undefined,
		xpos : room_width / 2,
		ypos : room_height,
		dir : 0,
		enemy : 1,
		tickdel : 500,
		distance : infinity,
		shoottime : 0,
		follow : true,
		gun : 1,
		spd : 4
	});
	AddEnemy({
		num : undefined,
		xpos : room_width / 2,
		ypos : room_height,
		dir : 0,
		enemy : 1,
		tickdel : 60,
		distance : 100,
		shoottime : 0,
		follow : true,
		gun : 1,
		spd : 4
	});
	AddEnemy({
		num : undefined,
		xpos : room_width / 2,
		ypos : room_height,
		dir : 0,
		enemy : 1,
		tickdel : 60,
		distance : infinity,
		shoottime : 0,
		follow : true,
		gun : 1,
		spd : 4
	});
	AddEnemy({
		num : undefined,
		xpos : room_width / 2,
		ypos : room_height,
		dir : 0,
		enemy : 1,
		tickdel : 60,
		distance : 100,
		shoottime : 0,
		follow : true,
		gun : 1,
		spd : 4
	});
	AddEnemy({
		num : undefined,
		xpos : room_width / 2,
		ypos : room_height,
		dir : 0,
		enemy : 1,
		tickdel : 60,
		distance : infinity,
		shoottime : 0,
		follow : true,
		gun : 1,
		spd : 4
	});
	AddEnemy({
		num : undefined,
		xpos : room_width / 2,
		ypos : room_height,
		dir : 0,
		enemy : 1,
		tickdel : 60,
		distance : 100,
		shoottime : 0,
		follow : true,
		gun : 1,
		spd : 4
	});
	AddEnemy({
		num : undefined,
		xpos : room_width / 2,
		ypos : room_height,
		dir : 0,
		enemy : 1,
		tickdel : 60,
		distance : 100,
		shoottime : 0,
		follow : true,
		gun : 1,
		spd : 4
	});
	AddEnemy({
		num : undefined,
		xpos : room_width / 2,
		ypos : room_height,
		dir : 0,
		enemy : 1,
		tickdel : 60,
		distance : 100,
		shoottime : 0,
		follow : true,
		gun : 1,
		spd : 4
	});
	AddEnemy({
		num : undefined,
		xpos : room_width / 2,
		ypos : room_height,
		dir : 0,
		enemy : 1,
		tickdel : 60,
		distance : 100,
		shoottime : 0,
		follow : true,
		gun : 1,
		spd : 4
	});
	//Batch 16
	//Eight enmies come from sides, two on each side
	AddEnemy({
		num : undefined,
		xpos : 0,
		ypos : room_height - room_height / 4,
		dir : 0,
		enemy : 1,
		tickdel : 700,
		distance : 100,
		shoottime : 0,
		follow : false,
		gun : 1,
		spd : 2
	});
	AddEnemy({
		num : undefined,
		xpos : 0,
		ypos : room_height / 4,
		dir : 0,
		enemy : 1,
		tickdel : 0,
		distance : 100,
		shoottime : 0,
		follow : false,
		gun : 1,
		spd : 2
	});
	AddEnemy({
		num : undefined,
		xpos : room_width,
		ypos : room_height - room_height / 4,
		dir : 180,
		enemy : 1,
		tickdel : 60,
		distance : 100,
		shoottime : 0,
		follow : false,
		gun : 1,
		spd : 2
	});
	AddEnemy({
		num : undefined,
		xpos : room_width,
		ypos : room_height / 4,
		dir : 180,
		enemy : 1,
		tickdel : 0,
		distance : 100,
		shoottime : 0,
		follow : false,
		gun : 1,
		spd : 2
	});
	AddEnemy({
		num : undefined,
		xpos : room_width - room_width / 4,
		ypos : 100,
		dir : 270,
		enemy : 1,
		tickdel : 60,
		distance : 50,
		shoottime : 0,
		follow : false,
		gun : 1,
		spd : 2
	});
	AddEnemy({
		num : undefined,
		xpos : room_width / 4,
		ypos : 100,
		dir : 270,
		enemy : 1,
		tickdel : 0,
		distance : 50,
		shoottime : 0,
		follow : false,
		gun : 1,
		spd : 2
	});
	AddEnemy({
		num : undefined,
		xpos : room_width - room_width / 4,
		ypos : room_height,
		dir : 90,
		enemy : 1,
		tickdel : 60,
		distance : 50,
		shoottime : 0,
		follow : false,
		gun : 1,
		spd : 2
	});
	AddEnemy({
		num : undefined,
		xpos : room_width / 4,
		ypos : room_height,
		dir : 90,
		enemy : 1,
		tickdel : 0,
		distance : 50,
		shoottime : 0,
		follow : false,
		gun : 1,
		spd : 2
	});
}