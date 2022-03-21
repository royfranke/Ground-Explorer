/// @description Insert description here
// You can write your code in this editor
path_found = false;
route_done = false;
this_path = [];

int_start = "";
int_end = "";

vehicle = "car";
clearance = [0,0];

stop_timeout = 5*room_speed;
crossing_time =10*room_speed;
stop_counter = 0;
stopping = false;
