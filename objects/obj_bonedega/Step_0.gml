/// @description Insert description here
// You can write your code in this editor
if (obj_player.x > x && obj_player.x < x + (tile_size*8)
&& obj_player.y > y && obj_player.y < y + (tile_size*6)) {
	image_index = 1;
	transparent = true;
}
else {
	image_index = 0;
	transparent = false;
}