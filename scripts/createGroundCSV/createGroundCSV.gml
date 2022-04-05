// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function createGroundCSV(){


this_size = global.tile_size;
ground_width = global.g_width;
ground_height = global.g_height;

var spr_contents = "";
var qua_contents = "";
for (r = 0;r < ground_height;r++) {
	for (c = 0;c < ground_width;c++) {
		t_x = c*this_size;
		t_y = r*this_size;
		
		//this_s = ds_grid_get(global.scape_map,floor(t_x/global.block),floor(t_y/global.block));
		
		var this_g = ds_grid_get(global.ground_map,t_x,t_y);
		spr_contents += string(this_g)+",";
		var this_q = ds_grid_get(global.quality_map,c,r);
		qua_contents += string(this_q)+",";

	}
	spr_contents += "\n";
	qua_contents += "\n";
}

var file = file_text_open_write(working_directory+global.g_spr_settings+".csv");
file_text_write_string(file,spr_contents);
file_text_close(file);

var file = file_text_open_write(working_directory+global.g_qua_settings+".csv");
file_text_write_string(file,qua_contents);
file_text_close(file);
}