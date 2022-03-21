/// @description Insert description here
// You can write your code in this editor
var _x = drag_room_x - event_data[? "rawposX"];
var _y = drag_room_y - event_data[? "rawposY"];

if (_x < 0) {
	_x = 0;
}

if (_y < 0) {
	_y = 0;
}

if (_x + camera_get_view_width(view_camera[0]) > map_w) {
	 _x = map_w - camera_get_view_width(view_camera[0]);
}

if (_y + camera_get_view_height(view_camera[0]) > map_h) {
	_y = map_h - camera_get_view_height(view_camera[0]);
}

camera_set_view_pos(camera,_x,_y);
global.draw_bounds = getDrawBounds();