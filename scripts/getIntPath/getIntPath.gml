/// @function findTestPath (int_start, int_end);
/// @param {index} object The Object to follow
/// @param {real}  speed  The speed to follow at
function getIntPath (int_start,obey_laws) {
	/// Get roads connecting to each intersection
	/// Make different path types for vehicle, bike, person, different for two-way/one way street
	//slug,x blocks, y blocks, n_term, e_slug, s_slug, w_term, e_name, s_name, e_type, s_type
	int_start_index = ds_grid_value_y(global.inters_grid,0,0,0,global.inters_count,int_start);
	n_term = ds_grid_get(global.inters_grid,3,int_start_index);
	e_slug = ds_grid_get(global.inters_grid,4,int_start_index);
	s_slug = ds_grid_get(global.inters_grid,5,int_start_index);
	w_term = ds_grid_get(global.inters_grid,6,int_start_index);
	e_type = ds_grid_get(global.inters_grid,9,int_start_index);
	s_type = ds_grid_get(global.inters_grid,10,int_start_index);
	int_paths = [];
	/// If the north doesn't terminate, search the column for south connectors to find the connecting intersection
	if (!n_term) {
		if (ds_grid_value_exists(global.inters_grid,5,0,5,global.inters_count,int_start)) {
			n_y = ds_grid_value_y(global.inters_grid,5,0,5,global.inters_count,int_start);
			n_slug = ds_grid_get(global.inters_grid,0,n_y);
			n_type = ds_grid_get(global.inters_grid,10,n_y);
			if (obey_laws) {
				if (n_type != 2) {
					array_push(int_paths,n_slug);
				}
			}
			else {
				array_push(int_paths,n_slug);
			}
		}
		
	}
	/// If the east isn't blank, record the intersection
	if (e_slug != "") {
		if (obey_laws) {
			if (e_type != 3) {
				array_push(int_paths,e_slug);
			}
		}
		else {
			array_push(int_paths,e_slug);
		}
	}
	/// If the south isn't blank, record the intersection
	if (s_slug != "") {
		if (obey_laws) {
			if (s_type != 3) {
				array_push(int_paths,s_slug);
			}
		}
		else {
			array_push(int_paths,s_slug);
		}
	}
	
	/// If the west doesn't terminate, search the column for east connectors to find the connecting intersection
	if (!w_term) {
		if (ds_grid_value_exists(global.inters_grid,4,0,4,global.inters_count,int_start)) {
			w_y = ds_grid_value_y(global.inters_grid,4,0,4,global.inters_count,int_start);
			w_slug = ds_grid_get(global.inters_grid,0,w_y);
			w_type = ds_grid_get(global.inters_grid,9,w_y);
			if (obey_laws) {
				if (w_type != 2) {
					array_push(int_paths,w_slug);
				}
			}
			else {
				array_push(int_paths,w_slug);
			}

		}
		
	}
	
	/// This function should return an array of intersections
	return int_paths;
}