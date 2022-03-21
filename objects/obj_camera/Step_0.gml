/// @description Insert description here
// You can write your code in this editor
if (obj_gui.camera_follows == "player") {
	var _x = obj_player.x - (camera_get_view_width(view_camera[0])/2);
	var _y = obj_player.y - (camera_get_view_height(view_camera[0])/2);;
	camera_set_view_pos(camera,_x,_y);
	global.draw_bounds = getDrawBounds();
}