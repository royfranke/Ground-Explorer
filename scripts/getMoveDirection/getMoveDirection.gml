// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function getMoveDirection(){
	if (global.key_up) {
		move_dir = 0;
	}
	if (global.key_right) {
		move_dir = 1;
	}
	if (global.key_down) {
		move_dir = 2;
	}
	if (global.key_left) {
		move_dir = 3;
	}
	return move_dir;
}