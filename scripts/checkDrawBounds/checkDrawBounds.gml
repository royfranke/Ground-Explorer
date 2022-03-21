// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function checkDrawBounds(_x,_y){
	bounds = global.draw_bounds;
	draw = false;
	if (_x >= bounds[0] && _x <= bounds[2]
	 && _y >= bounds[1] && _y <= bounds[3]) {
		draw = true;
	 }
	return draw;
}