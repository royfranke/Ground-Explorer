/// @description Insert description here
// You can write your code in this editor
e_width = 0;
s_width = 0;

initialized = false;
ready = false;
controller = "";
go_timer = 0;
hurry_timer = 0;
slow_timer = 0;
stop_timer = 0;
blink_timer = 0;
blinker_on = false;

go_time = 10*room_speed;
hurry_time = 5*room_speed;
slow_time = 2*room_speed;
stop_time = go_time + hurry_time + slow_time;
blink_time = .5*room_speed;

/// States:
// Stop
// Go
// Hurry
// Slow


ew_state = "stop";
ns_state = "go";