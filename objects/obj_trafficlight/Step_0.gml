/// @description Insert description here
// You can write your code in this editor
if (ready && !initialized) {
	controller = string(x)+"_"+string(y);
	for (d = 1; d < 5; d++) {
		switch d {
			case 1:
				signal_x = x - s_width*8;
				signal_y = y - e_width*8;
				this_instance = obj_trafficlight_w;
				
			break;
			case 2:
				signal_x = x + s_width*8;
				signal_y = y - e_width*8;
				this_instance = obj_trafficlight_n;

			break;
			case 3:
				signal_x = x + s_width*8;
				signal_y = y + e_width*8;
				this_instance = obj_trafficlight_e;

			break;
			case 4:
				signal_x = x - s_width*8;
				signal_y = y + e_width*8;
				this_instance = obj_trafficlight_s;
				
			break;
		}

		var this_light = instance_create_layer(signal_x,signal_y,"Instances",this_instance);
		this_light.image_index = 0;
		this_light.controller = controller;
	}
	initialized = true;
}
if (initialized) {
	
/// States:
// Stop
// Go
// Hurry
// Slow
	var this_controller = controller;
	switch (ew_state) {
		case "stop":
			with (obj_trafficlight_e) {
				if (controller == this_controller) {
					image_index = 0;
				}
			}
			with (obj_trafficlight_s) {
				if (controller == this_controller) {
					image_index = 0;
				}
			}
			with (obj_trafficlight_w) {
				if (controller == this_controller) {
					image_index = 2;
				}
			}
		break;
		case "go":
		with (obj_trafficlight_e) {
				if (controller == this_controller) {
					image_index = 1;
				}
			}
			with (obj_trafficlight_s) {
				if (controller == this_controller) {
					image_index = 1;
				}
			}
			with (obj_trafficlight_w) {
				if (controller == this_controller) {
					image_index = 3;
				}
			}
			go_timer++;
			if (go_timer > go_time) {
				hurry_timer = 0;
				ew_state = "hurry";
			}
			
		break;
		case "hurry":
			if (blink_timer > blink_time) {
				if (blinker_on) {
					blinker_on = false;
				}
				else {
					blinker_on = true;
				}
				blink_timer = 0;
			}
			if (blinker_on) {
				var blink = 2;
				var alt_blink = 0;
				var alt_blink2 = 4;
			}
			else {
				var blink = 3;
				var alt_blink = 2;
				var alt_blink2 = 5;
			}
			with (obj_trafficlight_e) {
				if (controller == this_controller) {
					image_index = blink;
				}
			}
			with (obj_trafficlight_s) {
				if (controller == this_controller) {
					image_index = alt_blink;
				}
			}
			with (obj_trafficlight_w) {
				if (controller == this_controller) {
					image_index = alt_blink2;
				}
			}
			hurry_timer++;
			blink_timer++;
			if (hurry_timer > hurry_time) {
				slow_timer = 0;
				ew_state = "slow";
			}
			
		break;
		case "slow":
		with (obj_trafficlight_e) {
				if (controller == this_controller) {
					image_index = 4;
				}
			}
		with (obj_trafficlight_s) {
				if (controller == this_controller) {
					image_index = 0;
				}
			}
		with (obj_trafficlight_w) {
				if (controller == this_controller) {
					image_index = 6;
				}
			}
			slow_timer++;
			if (slow_timer > slow_time) {
				stop_timer = 0;
				go_timer = 0;
				ew_state = "stop";
				ns_state = "go";
			}
		break;
	}
	
	
	
	/// Now NS
	
	switch (ns_state) {
		case "stop":
			with (obj_trafficlight_n) {
				if (controller == this_controller) {
					image_index = 0;
				}
			}
		break;
		case "go":
		with (obj_trafficlight_n) {
				if (controller == this_controller) {
					image_index = 1;
				}
			}
		with (obj_trafficlight_w) {
				if (controller == this_controller) {
					image_index = 2;
				}
			}
			go_timer++;
			if (go_timer > go_time) {
				hurry_timer = 0;
				ns_state = "hurry";
			}
			
		break;
		case "hurry":

			if (blink_timer > blink_time) {
				if (blinker_on) {
					blinker_on = false;
				}
				else {
					blinker_on = true;
				}
				blink_timer = 0;
			}
			if (blinker_on) {
				var blink = 2;
				var alt_blink = 1;
			}
			else {
				var blink = 3;
				var alt_blink = 0;
			}
			with (obj_trafficlight_n) {
				if (controller == this_controller) {
					image_index = blink;
				}
			}
			with (obj_trafficlight_w) {
				if (controller == this_controller) {
					image_index = alt_blink;
				}
			}
			hurry_timer++;
			blink_timer++;
			if (hurry_timer > hurry_time) {
				slow_timer = 0;
				ns_state = "slow";
			}
			
		break;
		case "slow":
		with (obj_trafficlight_n) {
				if (controller == this_controller) {
					image_index = 4;
				}
			}
		with (obj_trafficlight_w) {
				if (controller == this_controller) {
					image_index = 0;
				}
			}
			slow_timer++;
			if (slow_timer > slow_time) {
				stop_timer = 0;
				go_timer = 0;
				ns_state = "stop";
				ew_state = "go";
			}
		break;
	}
}