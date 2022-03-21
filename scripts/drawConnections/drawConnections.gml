// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function drawConnections (int_x,int_y,e_slug,s_slug,e_type,s_type,signals) {	
	int_h = 8;
	if (e_slug != "") {
	if (ds_grid_value_exists(global.inters_grid,0,0,0,(global.inters_count - 1),e_slug))
	{ 
		e_int = getIntLoc(e_slug);
		draw_text(int_x + 32,int_y - int_h,e_name);
		drawRoad(int_x,int_y,e_int[0],e_int[1],e_type,"e");
	}
	else {
		draw_set_color(c_red);
		draw_text(int_x + 32,int_y - int_h,e_slug);
	}
}
else {
	draw_set_color(c_gray);
	draw_circle(int_x+int_h,int_y,4,false);
}

if (s_slug != "") {
	if (ds_grid_value_exists(global.inters_grid,0,0,0,(global.inters_count - 1),s_slug))
	{ 
		draw_set_color(c_blue);
		s_int = getIntLoc(s_slug);
		//draw_text(int_x + 32,int_y - int_h,s_name);
		drawRoad(int_x,int_y,s_int[0],s_int[1],s_type,"s");
	}
	else {
		draw_set_color(c_red);
		draw_text(int_x + 32,int_y + int_h,s_slug);
	}
}
else {
	draw_set_color(c_gray);
	draw_circle(int_x,int_y+int_h,4,false);
}

	if (signals[0] == 1) { ///Draw traffic light
		draw_set_color(c_olive);
		draw_rectangle(int_x - 4,int_y - 4,int_x + 4,int_y + 4,false);
	}
	if (signals[1] == 1) { ///Draw n stop sign
		draw_set_color(c_red);
		draw_circle(int_x,int_y-int_h,4,false);
	}
	if (signals[2] == 1) { ///Draw e stop sign
		draw_set_color(c_red);
		draw_circle(int_x+int_h,int_y,4,false);
	}
	if (signals[3] == 1) { ///Draw s stop sign
		draw_set_color(c_red);
		draw_circle(int_x,int_y+int_h,4,false);
	}
	if (signals[4] == 1) { ///Draw w stop sign
		draw_set_color(c_red);
		draw_circle(int_x-int_h,int_y,4,false);
	}
}