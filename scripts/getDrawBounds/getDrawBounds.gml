// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function getDrawBounds(){
	var cx = camera_get_view_x(view_camera[0]) - 128;
	var cy = camera_get_view_y(view_camera[0]) - 128;
	
	if (cx < 0) {cx = 0;}
	if (cy < 0) {cy = 0;}
	
	var xb = cx + camera_get_view_width(view_camera[0]) + 256;
	var yb = cy + camera_get_view_height(view_camera[0]) + 256;
	bounds = [cx,cy,xb,yb];
	return bounds;
}