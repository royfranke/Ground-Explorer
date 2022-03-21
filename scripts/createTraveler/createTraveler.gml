/// @function createTraveler();
function createTraveler (int_start,int_end) {
	path_found = false;
	var this_traveler = instance_create_layer(0,0,"Instances",obj_traveler);
	this_traveler.int_start = int_start;
	this_traveler.int_end = int_end;
}
