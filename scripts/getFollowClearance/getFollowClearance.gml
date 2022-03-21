// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function getFollowClearance(this_x,this_y,vehicle_dir,vehicle){
	c_size = 32; /// radius
	clearance = [];
	switch (vehicle_dir) {
	case "n": clearance = [this_x,this_y-c_size];
	break;
	case "e": clearance = [this_x+c_size,this_y];
	break;
	case "s": clearance = [this_x,this_y+c_size];
	break;
	case "w": clearance = [this_x-c_size,this_y];
	break;
	}
	
	return clearance;

}