// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function getRoadInfo(place_x,place_y){
	//road_type, road_dir, road_name, road_width,
	//road_x1, road_y1, road_x2, road_y2
	var inst;
	var road_info = [-1,"","",-1,0,0,0,0];
	inst = instance_position(place_x,place_y,obj_road);
	if (inst != noone)
	{
		road_info = [
			inst.road_type,
			inst.road_dir,
			inst.road_name,
			inst.road_width,
			inst.road_x1,
			inst.road_y1,
			inst.road_x2,
			inst.road_y2
		];
	}
	return road_info;
}