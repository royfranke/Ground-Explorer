// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function getIntSize(int_slug){
	var int_index = ds_grid_value_y(global.inters_grid,0,0,0,global.inters_count,int_slug);
	var n_term = ds_grid_get(global.inters_grid,3,int_index);
	var e_slug = ds_grid_get(global.inters_grid,5,int_index);
	var s_slug = ds_grid_get(global.inters_grid,4,int_index);
	var w_term = ds_grid_get(global.inters_grid,6,int_index);
	var e_type = ds_grid_get(global.inters_grid,9,int_index);
	var s_type = ds_grid_get(global.inters_grid,10,int_index);
	var e_sizes = [];
	var s_sizes = [];
	var int_sizes = [-1,-1,-1,-1];
	if (e_slug != "") {
		array_push(e_sizes,global.road_type_width[e_type]);
		int_sizes[1] = global.road_type_width[e_type];
	}
	
	if (s_slug != "") {
		array_push(s_sizes,global.road_type_width[s_type]);
		int_sizes[2] = global.road_type_width[s_type];
	}

	/// If the north doesn't terminate, search the column for south connectors to find the connecting intersection
	if (!n_term) {
		if (ds_grid_value_exists(global.inters_grid,5,0,5,global.inters_count,int_slug)) {
			var n_y = ds_grid_value_y(global.inters_grid,5,0,5,global.inters_count,int_slug);
			var n_type = ds_grid_get(global.inters_grid,10,n_y);
			array_push(s_sizes,global.road_type_width[n_type]);
			int_sizes[0] = global.road_type_width[n_type];
		}
	}
	
	/// If the west doesn't terminate, search the column for south connectors to find the connecting intersection
	if (!w_term) {
		if (ds_grid_value_exists(global.inters_grid,4,0,4,global.inters_count,int_slug)) {
			var w_y = ds_grid_value_y(global.inters_grid,4,0,4,global.inters_count,int_slug);
			var w_type = ds_grid_get(global.inters_grid,9,w_y);
			array_push(e_sizes,global.road_type_width[w_type]);
			int_sizes[3] = global.road_type_width[w_type];
		}
	}
	

	var maxSize_e = 0; 
// Loop through each array element
for (i = 0; i < array_length(e_sizes); i++) {
    if (e_sizes[i] > e_sizes[maxSize_e]) {maxSize_e = i;}
}
	var maxSize_s = 0;
for (i = 0; i < array_length(s_sizes); i++) {
    if (s_sizes[i] > s_sizes[maxSize_s]) {maxSize_s = i;}
}
if (array_length(e_sizes) == 0) {
	e_sizes[0] = s_sizes[maxSize_s];
}
if (array_length(s_sizes) == 0) {
	s_sizes[0] = e_sizes[maxSize_e];
}
	return [e_sizes[maxSize_e],s_sizes[maxSize_s],int_sizes[0],int_sizes[1],int_sizes[2],int_sizes[3]];
}