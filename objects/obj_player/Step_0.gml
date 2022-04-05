/// @description Insert description here
// You can write your code in this editor
if (global.key_held) {
	state = "walking";
	obj_gui.camera_follows = "player";
}
else {
	state = "idle";
}


if (state == "walking") {
	facing = getMoveDirection();
	next_coord = getNextCoord(x,y,2,facing);
	if (!position_meeting(next_coord[0],next_coord[1],obj_collision)) {
		x = next_coord[0];
		y = next_coord[1];
	}
	else {
		state = "idle";
	}
}