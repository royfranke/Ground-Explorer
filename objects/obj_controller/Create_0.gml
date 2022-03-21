/// @description Insert description here
// You can write your code in this editor
global.key_up = false;
global.key_right = false;
global.key_down = false;
global.key_left = false;
global.key_held = false;
global.map_block_w = 18;
global.map_block_h = 14;
global.tile_size = 16;
global.ground_init = false;
global.draw_bounds = [0,0,0,0];

player_x = 64;
player_y = 64;
createStreets();
createGround();

instance_create_layer(x,y,"Controllers",obj_camera);
instance_create_layer(x,y,"Controllers",obj_gui);
counter = 0;