// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function createSignals(_x,_y,e_width,s_width,signals){
	var signal_x = _x;
	var signal_y = _y;
	for (d = 1; d < 5; d++) {
		switch d {
			case 1:
				signal_x = _x - s_width*8;
				signal_y = _y - e_width*8;
				
			break;
			case 2:
				signal_x = _x + s_width*8;
				signal_y = _y - e_width*8;

			break;
			case 3:
				signal_x = _x + s_width*8;
				signal_y = _y + e_width*8;

			break;
			case 4:
				signal_x = _x - s_width*8;
				signal_y = _y + e_width*8;
				
			break;
		}
		if (signals[d] == 1) {
			var this_sign = instance_create_layer(signal_x,signal_y,"Instances",obj_stopsign);
			this_sign.image_index = d - 1;
		}
		if (signals[d] == 2) {
			var this_sign = instance_create_layer(signal_x,signal_y,"Instances",obj_stopsign);
			this_sign.image_index = d - 1;
		}
	}
	if (signals[0] == 1) {
		var this_tlight = instance_create_layer(_x,_y,"Instances",obj_trafficlight);
		this_tlight.e_width = s_width;
		this_tlight.s_width = e_width;
		this_tlight.ready = true;
	}
}