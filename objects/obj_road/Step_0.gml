/// @description Insert description here
// You can write your code in this editor
if (!initialized) {
	for (c = (road_x1/tile_size); c < (road_x2/tile_size);c++) {
		for (r = (road_y1/tile_size); r < (road_y2/tile_size);r++) {
			this_spr = spr_s_asphalt;
			if (road_dir == "ew" || road_dir == "e" || road_dir == "w") {
				if (r == (road_y1/tile_size)) {
					this_spr = spr_curb_n; // North curb
				}
				if (road_type < 2 && r == (road_y1/tile_size)+1) {
					this_spr = spr_road_sw_ew; //Solid White Line
				}
				if (road_type == 1 && (r == (road_y1/tile_size) + ((road_width-4)/2) || r == road_y1/tile_size + (road_width-3))) {
					this_spr = spr_road_daw_ew; //Dashed White Line
				}
				if (road_type < 2 && r == (road_y1/tile_size) + (road_width/2)) {
					this_spr = spr_road_dy_ew; //Double Yellow Line
				}
				if (road_type < 2 && r == (road_y2/tile_size) - 2) {
					this_spr = spr_road_sw_ews; //Solid White Line
				}
				if (r == (road_y2/tile_size) - 1) {
					this_spr = spr_curb_s; //South Curb
				}
			}
			else {
				if (c == (road_x1/tile_size)) {
					this_spr = spr_curb_w; // West curb
				}
				if (road_type < 2 && c == (road_x1/tile_size)+1) {
					this_spr = spr_road_sw_ns; //Solid White Line
				}
				if (road_type == 1 && (c == (road_x1/tile_size) + ((road_width-4)/2) || c == road_x1/tile_size + (road_width-3))) {
					this_spr = spr_road_daw_ns; //Dashed White Line
				}
				if (road_type < 2 && c == (road_x1/tile_size) + (road_width/2)) {
					this_spr = spr_road_dy_ns; //Double Yellow Line
				}
				if (road_type < 2 && c == (road_x2/tile_size) - 2) {
					this_spr = spr_road_sw_nse; //Solid White Line
				}
				if (c == (road_x2/tile_size) - 1) {
					this_spr = spr_curb_e; //East Curb
				}
			
			}
			ds_grid_set(global.ground_map,c*tile_size,r*tile_size,this_spr);
		}
	}
	createSidewalks(road_x1,road_y1,road_x2,road_y2,road_dir,road_name,road_type);
	initialized = true;
}
else {
	if (mouse_x >= road_x1 && mouse_x <= road_x2
	&&  mouse_y >= road_y1 && mouse_y <= road_y2) {
		var this_name = road_name;
		with obj_gui {
			mouse_street = this_name;
		}
	}
	
}