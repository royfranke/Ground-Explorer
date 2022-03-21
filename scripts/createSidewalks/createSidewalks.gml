// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function createSidewalks(road_x1,road_y1,road_x2,road_y2,road_dir,road_name,road_type){
	tile_size = global.tile_size;
	if (road_dir == "ew" || road_dir == "e" || road_dir == "w") {
		for (i = (road_x1/tile_size); i < (road_x2/tile_size); i++) {
			ds_grid_set(global.ground_map,i*tile_size,road_y1-tile_size,spr_s_cement);
			ds_grid_set(global.ground_map,i*tile_size,road_y2,spr_s_cement);
		}
		for (i = (road_y1/tile_size) + 1; i < (road_y2/tile_size) - 1; i++) {
			ds_grid_set(global.ground_map,road_x1,i*tile_size,spr_crosswalk_ew);
			ds_grid_set(global.ground_map,road_x1+tile_size,i*tile_size,spr_crosswalk_ew);
		
			ds_grid_set(global.ground_map,road_x1+(tile_size*2),i*tile_size,spr_road_m_ns);
		
			ds_grid_set(global.ground_map,road_x2-tile_size,i*tile_size,spr_crosswalk_ew);
			ds_grid_set(global.ground_map,road_x2-(tile_size*2),i*tile_size,spr_crosswalk_ew);
			
			ds_grid_set(global.ground_map,road_x2-(tile_size*3),i*tile_size,spr_road_m_ns);
		}
	}
	else {
		for (i = (road_y1/tile_size); i < (road_y2/tile_size); i++) {
			ds_grid_set(global.ground_map,road_x1-tile_size,i*tile_size,spr_s_cement);
			ds_grid_set(global.ground_map,road_x2,i*tile_size,spr_s_cement);
		}
		for (i = (road_x1/tile_size) + 1; i < (road_x2/tile_size) - 1; i++) {
			ds_grid_set(global.ground_map,i*tile_size,road_y1,spr_crosswalk_ns);
			ds_grid_set(global.ground_map,i*tile_size,road_y1+tile_size,spr_crosswalk_ns);
			
			ds_grid_set(global.ground_map,i*tile_size,road_y1+(tile_size*2),spr_road_m_ew);
			
			ds_grid_set(global.ground_map,i*tile_size,road_y2-tile_size,spr_crosswalk_ns);
			ds_grid_set(global.ground_map,i*tile_size,road_y2-(tile_size*2),spr_crosswalk_ns);
			
			ds_grid_set(global.ground_map,i*tile_size,road_y2-(tile_size*3),spr_road_m_ew);
		}
	}
}