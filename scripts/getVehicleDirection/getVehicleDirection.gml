// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function getVehicleDirection(start_x,start_y,end_x,end_y){
	vehicle_dir = "";
	if (start_x == end_x) { //NS Axis only
		if (start_y < end_y) {
			vehicle_dir = "s";
		}
		else {
			vehicle_dir = "n";
		}
	}
	else {
		if (start_y == end_y) { //EW Axis only
			if (start_x < end_x) {
				vehicle_dir = "e";
			}
			else {
				vehicle_dir = "w";
			}
		}
		else {
			if (abs(start_y - end_y) > abs(start_x - end_x)) {
				if (start_y < end_y) {
					vehicle_dir = "s";
				}
				else {
					vehicle_dir = "n";
				}
			}
			else {
				if (start_x < end_x) {
					vehicle_dir = "e";
				}
				else {
					vehicle_dir = "w";
				}
			}
		}
	}
	
	return vehicle_dir;
}