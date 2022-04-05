// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function initializer(){
	global.key_up = false;
	global.key_right = false;
	global.key_down = false;
	global.key_left = false;
	global.key_held = false;
	
	global.map_block_w = 18;
	global.map_block_h = 14;
	
	global.block = 384;
	global.tile_size = 16;
	
	global.road_type_width = [6,10,4,4];
	
	
	global.ground_init = false;
	global.draw_bounds = [0,0,0,0];
	
	global.g_spr_settings = "g_spr_settings";
	global.g_qua_settings = "g_qua_settings";
	
	draw_set_font(font_default);
	
	createStreets();
}