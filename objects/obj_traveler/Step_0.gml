/// @description Insert description here
// You can write your code in this editor
if (!path_found && int_start != "" && int_end != "") {
	this_path = findTestPath(int_start, int_end);
	int_start_loc = getIntLoc(int_start);
	int_end_loc = getIntLoc(int_end);
	show_debug_message(this_path);
	
	path_cord_x = [];
	path_cord_y = [];
	for (i = (array_length(this_path) - 1); i >= 0;i--) {
		int_loc = getIntLoc(this_path[i]);
		array_push(path_cord_x,int_loc[0]*global.block);
		array_push(path_cord_y,int_loc[1]*global.block);
	}
	path_found = true;
}


if (path_found && !route_done) {
	if (array_length(path_cord_x) > 0) {
		if (distance_to_point(path_cord_x[0], path_cord_y[0]) > 0) {
			
			var vehicle_dir = getVehicleDirection(x,y,path_cord_x[0], path_cord_y[0]);
			clearance = getFollowClearance(x,y,vehicle_dir,vehicle);
			if (!collision_circle(clearance[0],clearance[1],24,obj_traveler,false,true)) {
				if (!stopping) {
					if (stop_counter == 0) {
						move_towards_point(path_cord_x[0],path_cord_y[0], 1);
						if (point_in_circle(path_cord_x[0],path_cord_y[0],x,y,64)) {
							var next_int = instance_place(path_cord_x[0],path_cord_y[0], obj_intersection);
							var stop = false;
							if (next_int != noone)
								{
									switch (vehicle_dir) {
									case "n": if (next_int.s_edge == 1) {
									stop = true;
									}
									break;
									case "e": if (next_int.w_edge == 1) {
									stop = true;
									}
									break;
									case "s": if (next_int.n_edge == 1) {
									stop = true;
									}
									break;
									case "w": if (next_int.e_edge == 1) {
									stop = true;
									}
									break;
								}
							}
							if (stop) {
								stopping = true;
								stop_counter++;
								speed = 0;
							}
						}
					}
				}
				else {
						stop_counter++;
						if (stop_counter < stop_timeout) {
							speed = 0;
						}
						else {
							if (stop_counter < crossing_time) {
								move_towards_point(path_cord_x[0],path_cord_y[0], 1);
							}
							else {
								stopping = false;
							}
						}
					}
			}
			else {
				speed = 0;
			}
		}
		else {
			array_delete(path_cord_x,0,1);
			array_delete(path_cord_y,0,1);
			stopping = false;
			stop_counter = 0;
		}
	}
	else {
		route_done = true;
		speed = 0;
		instance_destroy();
	}
}




