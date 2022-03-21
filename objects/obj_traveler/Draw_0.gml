/// @description Insert description here
// You can write your code in this editor

if (int_start != "" && !path_found) {
	int_start_loc = getIntLoc(int_start);
	x = int_start_loc[0]*global.block;
	y = int_start_loc[1]*global.block;
	draw_set_color(c_lime);
	draw_circle(int_start_loc[0]*global.block,int_start_loc[1]*global.block,24,false);
}
if (int_end != "" && !path_found) {
	int_end_loc = getIntLoc(int_end);
	draw_set_color(c_red);
	draw_circle(int_end_loc[0]*global.block,int_end_loc[1]*global.block,24,false);
}

if (path_found && !route_done) {
	for (p = 0; p < array_length(this_path);p++) {
		int_loc = getIntLoc(this_path[p]);
		draw_set_color(c_aqua);
		draw_circle(int_loc[0]*global.block,int_loc[1]*global.block,24,false);

	}
	draw_set_color(c_green);
	draw_circle(int_start_loc[0]*global.block,int_start_loc[1]*global.block,24,false);

	draw_set_color(c_maroon);
	draw_circle(int_end_loc[0]*global.block,int_end_loc[1]*global.block,24,false);
}

if (vehicle == "car") {
	if (stopping) {
		draw_set_color(c_red);
	}
	else {
		draw_set_color(c_yellow);
	}
	
	draw_circle(x,y,12,false);
	draw_set_color(c_orange);
	draw_circle(clearance[0],clearance[1],8,false);
}
