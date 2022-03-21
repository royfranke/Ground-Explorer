// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function checkKeyboard(){
	global.key_up = keyboard_check((ord("W"))); 
	global.key_right = keyboard_check((ord("D")));
	global.key_down = keyboard_check((ord("S")));
	global.key_left = keyboard_check((ord("A")));
	
	if (global.key_up || global.key_right || global.key_down || global.key_left) {
		global.key_held = true;
	}
	else {
		global.key_held = false;
	}
	
}