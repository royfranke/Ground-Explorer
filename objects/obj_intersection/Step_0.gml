/// @description Insert description here
// You can write your code in this editor

if (signals[0] == -1) {
	signals = [traf_light,n_edge,e_edge,s_edge,w_edge];
	
	
	tile_size = global.tile_size;
	int_size = getIntSize(slug);
	createSignals(x,y,int_size[0],int_size[1],signals);
	int_loc_px = getIntLoc(slug);
	int_widths = [int_size[2],int_size[3],int_size[4],int_size[5]];
	int_loc_x = (int_loc_px[0]*global.block) - (int_size[1]*tile_size)/2;
	int_loc_y = (int_loc_px[1]*global.block) - (int_size[0]*tile_size)/2;
	for (ew = 0; ew < int_size[0];ew++) {
		for (ns = 0; ns < int_size[1];ns++) {
			var pos_x = int_loc_x+(tile_size*ns);
			var pos_y = int_loc_y+(tile_size*ew);
			var in_range = true;
			if (pos_x < 0 || pos_x/tile_size >= global.g_width) {
					in_range = false;
				}
			if (pos_y < 0 || pos_y/tile_size >= global.g_height) {
					in_range = false;
				}
			if (in_range) {
				var road_sprite = spr_s_asphalt;
		
				if (!n_term && !w_term) {
					if (ew == 0 && ns == 0) {
						road_sprite = spr_curb_corner_nw;
					}
					
					if (int_size[1] > int_size[2]) {
						if (ew == 0 && ns == 1) {
							road_sprite = spr_curb_corner_nw;
						}
						if (ew == 0 && ns == 0) {
							road_sprite = spr_curb_n;
						}
						
					}
				}
				if (!n_term && e_slug != "") {
					if (ew == 0 && ns == int_size[1]-1) {
						road_sprite = spr_curb_corner_ne;
					}
					if (int_size[1] > int_size[2]) {
						if (ew == 0 && ns == int_size[1]-2) {
							road_sprite = spr_curb_corner_ne;
						}
						if (ew == 0 && ns == int_size[1]-1) {
							road_sprite = spr_curb_n;
						}
					}
					
				}
				if (s_slug != "" && !w_term) {
					if (ew == int_size[0]-1 && ns == 0) {
						road_sprite = spr_curb_corner_sw;
					}
					if (int_size[1] > int_size[4] && e_slug != "") {
						//Get difference
						var road_diff = (int_size[1] - int_size[4])/2;
						if (ew == int_size[0]-1 && ns == road_diff) {
							road_sprite =  spr_curb_corner_sw;
						}
						if (ew == int_size[0]-1 && ns >= 0 && ns < road_diff) {
							road_sprite = spr_curb_s;
						}
						
					}
				}
				if (s_slug != "" && e_slug != "") {
					if (ew == int_size[0]-1 && ns == int_size[1]-1) {
						road_sprite = spr_curb_corner_se;
					}
					if (int_size[1] > int_size[4]) {
						//Get difference
						var road_diff = (int_size[1] - int_size[4])/2 + 1;
						if (ew == int_size[0]-1 && ns == int_size[1]-road_diff) {
							road_sprite = spr_curb_corner_se;
						}
						if (ew == int_size[0]-1 && ns <= int_size[1]-1 && ns > int_size[1]-road_diff) {
							road_sprite = spr_curb_s;
						}
						
					}
				}
				if (n_term && ew == 0) {
					road_sprite = spr_curb_n;
				}
				if (e_slug = "" && ns == int_size[1]-1) {
					road_sprite = spr_curb_e;
				}
				if (s_slug = "" && ew == int_size[0]-1) {
					road_sprite = spr_curb_s;
				}
				if (w_term && ns == 0) {
					road_sprite = spr_curb_w;
				}

				if (n_term && w_term && ew == 0 && ns == 0) {
					road_sprite = spr_road_curve_nw;
				}
				if (n_term && e_slug == "" && ew == 0 && ns == int_size[1]-1) {
					road_sprite = spr_road_curve_ne;
				}
				if (s_slug == "" && w_term && ew == int_size[0]-1 && ns == 0) {
					road_sprite = spr_road_curve_sw;
				}
				if (s_slug == "" && e_slug == "" && ew == int_size[0]-1 && ns == int_size[1]-1) {
					road_sprite = spr_road_curve_se;
				}
				if (road_sprite == spr_road_curve_ne) {
					ds_grid_set(global.ground_map,pos_x+tile_size,pos_y-tile_size,spr_cement_corner_ne);
				}
				if (road_sprite == spr_road_curve_nw) {
					ds_grid_set(global.ground_map,pos_x-tile_size,pos_y-tile_size,spr_cement_corner_nw);
				}
				if (road_sprite == spr_road_curve_se) {
					ds_grid_set(global.ground_map,pos_x+tile_size,pos_y+tile_size,spr_cement_corner_se);
				}
				if (road_sprite == spr_road_curve_sw) {
					ds_grid_set(global.ground_map,pos_x-tile_size,pos_y+tile_size,spr_cement_corner_sw);
				}
				
				if (road_sprite == spr_curb_n || road_sprite == spr_road_curve_ne || road_sprite == spr_road_curve_nw) {
					ds_grid_set(global.ground_map,pos_x,pos_y-tile_size,spr_s_cement);
				
}
				if (road_sprite == spr_curb_e || road_sprite == spr_road_curve_ne || road_sprite == spr_road_curve_se) {
					ds_grid_set(global.ground_map,pos_x+tile_size,pos_y,spr_s_cement);
				}
				if (road_sprite == spr_curb_s || road_sprite == spr_road_curve_se || road_sprite == spr_road_curve_sw) {
					ds_grid_set(global.ground_map,pos_x,pos_y+tile_size,spr_s_cement);
				}
				if (road_sprite == spr_curb_w || road_sprite == spr_road_curve_nw || road_sprite == spr_road_curve_sw) {
					ds_grid_set(global.ground_map,pos_x-tile_size,pos_y,spr_s_cement);
				}
				ds_grid_set(global.ground_map,pos_x,pos_y,road_sprite);
			}
			//
		}
	}
	if (e_slug != "") {
		var e_road = instance_create_layer(x,y,"Roads",obj_road);
		e_road.road_name = e_name;
		e_road.road_type = e_type;
		e_road.road_width = global.road_type_width[e_type];
		e_road.road_dir = "ew";
		if (e_type == 2) {
			e_road.road_dir = "e";
		}
		if (e_type == 3) {
			e_road.road_dir = "w";
		}
		
		e_road.road_x1 = (int_loc_px[0]*global.block) + (int_size[1]*tile_size)/2;
		e_road.road_y1 = (int_loc_px[1]*global.block) - (e_road.road_width*tile_size)/2;
		
		var ec_int_size = getIntSize(e_slug);
		var ec_int_loc_px = getIntLoc(e_slug);
		e_road.int_size = ec_int_size;
		e_road.road_x2 = (ec_int_loc_px[0]*global.block) - (ec_int_size[1]*tile_size)/2;
		e_road.road_y2 = (ec_int_loc_px[1]*global.block) + (e_road.road_width*tile_size)/2;
	}
	if (s_slug != "") {
		var s_road = instance_create_layer(x,y,"Roads",obj_road);
		s_road.road_name = s_name;
		s_road.road_type = s_type;
		s_road.road_width = global.road_type_width[s_type];
		
		s_road.road_dir = "ns";
		if (s_type == 2) {
			s_road.road_dir = "s";
		}
		if (s_type == 3) {
			s_road.road_dir = "n";
		}

		s_road.road_x1 = (int_loc_px[0]*global.block) - (s_road.road_width*tile_size)/2;
		s_road.road_y1 = (int_loc_px[1]*global.block) + (int_size[0]*tile_size)/2;
		
		var sc_int_size = getIntSize(s_slug);
		var sc_int_loc_px = getIntLoc(s_slug);
		s_road.int_size = sc_int_size;
		s_road.road_x2 = (sc_int_loc_px[0]*global.block) + (s_road.road_width*tile_size)/2;
		s_road.road_y2 = (sc_int_loc_px[1]*global.block) - (sc_int_size[0]*tile_size)/2;
	}
}

if (mouse_x < x + 24 && mouse_x > x - 24
&& mouse_y < y + 24 && mouse_y > y - 24
&& mouse_check_button_pressed(mb_left)) {
	var temp_slug = slug;
	var temp_closed = false;
	if instance_exists(obj_traveler) {
		with (obj_traveler) {
			if (int_end == "") {
				int_end = temp_slug;
				temp_closed = true;
			}	
		}
		if (!temp_closed) {
			createTraveler(temp_slug,"");
		}
	}
	else {
		createTraveler(slug,"");
	}
}