// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function compileGround(){
this_size = global.tile_size;
ground_width = global.g_width;
ground_height = global.g_height;

global.ground_init = true;
for (r = 0;r < ground_height;r++) {
	for (c = 0;c < ground_width;c++) {
		t_x = c*this_size;
		t_y = r*this_size;
		if (checkDrawBounds(t_x,t_y)) {
			this_s = ds_grid_get(global.scape_map,floor(t_x/global.block),floor(t_y/global.block));
			this_g = ds_grid_get(global.ground_map,t_x,t_y);

			this_q = ds_grid_get(global.quality_map,c,r);
			draw_sprite_part(this_g,0,this_size*this_q,0,this_size,this_size,t_x,t_y);
		}
	}
}
}