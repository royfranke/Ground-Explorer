/// @description Insert description here
// You can write your code in this editor
draw_set_color(c_white);
draw_text(24,64,mouse_street);
draw_text(24,88,instance_count);
draw_text(24,104,string(fps)+" "+string(fps_real)+" "+string(room_speed));

draw_rectangle(24,24,48,48,false);
if (camera_follows == "frame") {
	draw_set_color(c_silver);
}
if (camera_follows == "player") {
	draw_set_color(c_green);
}
draw_circle(32,32,8,false);

counter++;
if keyboard_check(ord("M")) {
	draw_set_color(c_white);
	draw_rectangle(0,0,camera_get_view_width(view_camera[0]),camera_get_view_height(view_camera[0]),false);
	
}