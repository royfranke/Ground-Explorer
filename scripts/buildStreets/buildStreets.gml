// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function buildStreets(){
	for (i = 0; i < global.inters_count;i++) {
		var block_x = ds_grid_get(global.inters_grid,1,i)*global.block;
		var block_y = ds_grid_get(global.inters_grid,2,i)*global.block;
		var this_inter = instance_create_layer(block_x,block_y,"Roads",obj_intersection);
		this_inter.slug = ds_grid_get(global.inters_grid,0,i);
		this_inter.n_term = ds_grid_get(global.inters_grid,3,i);
		this_inter.e_slug = ds_grid_get(global.inters_grid,4,i);
		this_inter.s_slug = ds_grid_get(global.inters_grid,5,i);
		this_inter.w_term = ds_grid_get(global.inters_grid,6,i);
		this_inter.e_name = ds_grid_get(global.inters_grid,7,i);
		this_inter.s_name = ds_grid_get(global.inters_grid,8,i);
		this_inter.e_type = ds_grid_get(global.inters_grid,9,i);
		this_inter.s_type = ds_grid_get(global.inters_grid,10,i);
		
		this_inter.traf_light = ds_grid_get(global.inters_grid,11,i);
		this_inter.n_edge = ds_grid_get(global.inters_grid,12,i);
		this_inter.e_edge = ds_grid_get(global.inters_grid,13,i);
		this_inter.s_edge = ds_grid_get(global.inters_grid,14,i);
		this_inter.w_edge = ds_grid_get(global.inters_grid,15,i);
		
	}
}