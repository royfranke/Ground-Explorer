/// @description Insert description here
// You can write your code in this editor
var bounds = global.draw_bounds;

bound_x1 = floor(bounds[0]/this_size);
bound_y1 = floor(bounds[1]/this_size);

bound_x2 = floor(bounds[2]/this_size);
bound_y2 = floor(bounds[3]/this_size);

for (r = bound_y1;r <= bound_y2;r++) {
	for (c = bound_x1;c <= bound_x2;c++) {
		t_x = c*this_size;
		t_y = r*this_size;

			//this_s = ds_grid_get(global.scape_map,floor(t_x/global.block),floor(t_y/global.block));
			this_g = ds_grid_get(global.ground_map,t_x,t_y);

			this_q = ds_grid_get(global.quality_map,c,r);
			draw_sprite_part(this_g,0,this_size*this_q,0,this_size,this_size,t_x,t_y);

	}
}