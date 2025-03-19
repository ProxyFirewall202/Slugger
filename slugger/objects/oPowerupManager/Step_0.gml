if (image_index < 62) {
	if (place_meeting(x, y, oSlug)) instance_destroy();
	if (image_index > 60) {
		image_index = 0;
	}
}

if (image_index > 61) {
	if (image_index > 119) {
		image_index = 0;
	}
}