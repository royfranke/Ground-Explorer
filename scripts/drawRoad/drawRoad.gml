// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function drawRoad(int_x,int_y,n_int_x,n_int_y,road_type,road_dir){
	//0 2 Lanes
	//1 4 Lanes
	//2 1 Lane Away (e_type of this means 1 way going east)
	//3 1 Lane Towards (e_type of this means 1 way going west)
	quality = .7;
	draw_set_color(c_green);
	switch (road_type) {
		case 0:
			if (road_dir == "e") {
				draw_line(int_x,int_y,n_int_x*global.block,n_int_y*global.block);
			
			}
			if (road_dir == "s") {
				draw_line(int_x,int_y,n_int_x*global.block,n_int_y*global.block);
			
			}
		break;
		case 1:
		
			if (road_dir == "e") {
				draw_line(int_x,int_y,n_int_x*global.block,n_int_y*global.block);
			}
			if (road_dir == "s") {
				draw_line(int_x,int_y,n_int_x*global.block,n_int_y*global.block);
			}
		break;
		case 2:
		draw_set_color(c_purple);
			
			draw_arrow(int_x,int_y,n_int_x*global.block,n_int_y*global.block,16);
		break;
		case 3:
		draw_set_color(c_fuchsia);
			draw_arrow(n_int_x*global.block,n_int_y*global.block,int_x,int_y,16);
		break;
	}
}