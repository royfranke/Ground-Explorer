// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function getNextCoord(_x,_y,_speed,_dir){
	var coords = [0,0];
	switch (_dir) {
		case 0: coords[0] = _x;
			coords[1] = _y - _speed;
		break;
		case 1: coords[0] = _x + _speed;
			coords[1] = _y;
		break;
		case 2: coords[0] = _x;
			coords[1] = _y + _speed;
		break;
		case 3: coords[0] = _x - _speed;
			coords[1] = _y;
		break;
	}
	return coords;
}