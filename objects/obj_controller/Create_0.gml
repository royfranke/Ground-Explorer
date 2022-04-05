/// @description Insert description here
// You can write your code in this editor
player_x = 2640;
player_y = 2640;

buildStreets();
createGround();

instance_create_layer(x,y,"Controllers",obj_camera);
instance_create_layer(x,y,"Controllers",obj_gui);
counter = 0;