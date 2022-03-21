// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function getIntInfo(place_x,place_y){
	//slug, int_loc_x, int_loc_y, int_widths
	var inst;
	var int_info = [-1,0,0,[0,0,0,0]];
	inst = instance_position(place_x,place_y,obj_intersection);
	if (inst != noone)
	{
		int_info = [
			inst.slug,
			inst.int_loc_x,
			inst.int_loc_y,
			inst.int_widths
		];
	}
	return int_info;
}