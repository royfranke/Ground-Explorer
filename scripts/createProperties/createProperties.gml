// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function createProperties(){
	
	//slug, x blocks, y blocks, order_x, order_y, prop_width, prop_height, 0-6
	//address_number, friendly_name

	properties = [
		["bonedega", 4,8,1,0,8,15, "200","Bone-Dega",obj_bonedega],
		["laundry", 4,8,10,1,6,8, "204","Laundro-mat",""],
		["busstation", 6,8,0,0,24,16, "100","Bus Station",""],
	];
	
	block = global.block;
	tile_size = global.tile_size;
	
	for (i = 0; i < array_length(properties); i++) {
		var order_x = (properties[i][3]*tile_size);
		var order_y = (properties[i][4]*tile_size);
		var prop_x = properties[i][1]*block;
		var prop_y = ((properties[i][2]*block) - (properties[i][6]*tile_size));

		var prop_x2 = prop_x+(properties[i][5]*tile_size);
		var prop_y2 = prop_y+(properties[i][6]*tile_size);
		
		//Find Widths of Surrounding Streets
		var road = getRoadInfo(prop_x,prop_y2);
		//road_type, road_dir, road_name, road_width,
		//road_x1, road_y1, road_x2, road_y2
		if (road[0] == -1) {
			var this_int = getIntInfo(prop_x,prop_y2);
			//slug, int_loc_x, int_loc_y, int_widths
			prop_x = this_int[1]+(this_int[3][0]*tile_size);
			prop_y2 = this_int[2];
			prop_y = prop_y2 -(properties[i][6]*tile_size);
			if (order_x > 0 || order_y > 0) {
				prop_x = prop_x + order_x;
				prop_y = prop_y - order_y;
			}
		}
		
		
		var this_prop = instance_create_layer(prop_x,prop_y,"Properties",obj_property);
		
		if (road[0] != -1) {
			this_prop.prop_street = string(properties[i][7])+" "+string(road[3]);
		}
		else {
			this_prop.prop_street = string(properties[i][7])+" "+string(this_int[0]);

		}

		this_prop.prop_slug = properties[i][0];
		this_prop.prop_friendly = properties[i][8];
		this_prop.prop_tile_size = tile_size;
		this_prop.prop_tile_width = properties[i][5];
		this_prop.prop_tile_height = properties[i][6];
		if (properties[i][9] != "") {
			instance_create_layer(prop_x,prop_y,"Properties",properties[i][9]);
		}
	}
	
}