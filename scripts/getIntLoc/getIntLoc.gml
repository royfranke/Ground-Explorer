// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function getIntLoc (int_start) {
	var int_start_index = ds_grid_value_y(global.inters_grid,0,0,0,global.inters_count,int_start);
	var int_start_x = ds_grid_get(global.inters_grid,1,int_start_index);
	var int_start_y = ds_grid_get(global.inters_grid,2,int_start_index);
	
	return [int_start_x,int_start_y];
}