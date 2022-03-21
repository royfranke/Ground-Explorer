// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function getTravelAgenda(int_start,int_end){
		int_start = ds_grid_get(global.inters_grid,0,random_range(0,global.inters_count));
		int_end = ds_grid_get(global.inters_grid,0,random_range(0,global.inters_count));
		return [int_start,int_end];
}