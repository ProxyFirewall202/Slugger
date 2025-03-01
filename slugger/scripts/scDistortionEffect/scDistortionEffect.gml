function scDistortion(xpos, ypos, rad){
	instance_create_layer(0, 0, "Instances", oDistortionEffect, {
		xposition: xpos,
		yposition: ypos,
		radius: rad
	});
}