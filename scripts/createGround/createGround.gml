// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function createGround(){
/// Map is 18w x 13h
	map_b_w = global.map_block_w;
	map_b_h = global.map_block_h;
	int_grid = ds_grid_create(map_b_w,map_b_h);
	/* The following is for writing an array of intersections to console
	for (i = 0; i < global.inters_count;i++) {
			var int_slug = ds_grid_get(global.inters_grid, 0, i);
			var int_x = ds_grid_get(global.inters_grid, 1, i);
			var int_y = ds_grid_get(global.inters_grid, 2, i);
			ds_grid_set(int_grid,int_x,int_y,int_slug);
	}
	
	int_array = [];
	for (r = 0;r < map_b_h;r++) {
		var row_array = [];
		for (c = 0;c < map_b_w;c++) {
			var int_slug = ds_grid_get(int_grid,c,r);
			array_push(row_array,int_slug);
		}
		array_push(int_array,row_array);
	}
	show_debug_message(int_array);
[[0,0,0,0,0,0,"N Exit",0,0,0,0,0,0,0,0,0,0,0],
[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
[0,0,0,0,0,0,"Middle,Valley",0,"River,Valley","W Valley Bridge",0,"E Valley Bridge","Marsh,Valley",0,"Pilgrim,Valley",0,0,0],
[0,0,0,0,"A,View",0,"Middle,View",0,"River,View",0,0,0,"Marsh,Quail",0,"Pilgrim,Quail",0,"Wood,Quail",0],
[0,0,0,"A,Hill",0,0,"Middle,Hill",0,"River,Hill",0,0,0,"Marsh,Camp",0,"Pilgrim,Camp",0,"Wood,Camp",0],
[0,0,"A,Green",0,"B,Green",0,"Middle,Green",0,0,0,0,0,"Marsh,Rail",0,"Pilgrim,Rail",0,"Wood,Rail",0],
[0,0,"A,Carp",0,"B,Carp",0,"Middle,Carp",0,0,0,0,0,0,"W Willow","Pilgrim,Willow","E Willow",0,0],
[0,0,"A,Bell",0,"B,Bell",0,"Middle,Bell",0,"Bus,Bell",0,0,0,0,"W Cherry","Pilgrim,Cherry","E Cherry",0,0],
[0,0,"A,Oak",0,"B,Oak",0,"Middle,Oak",0,0,0,0,0,0,"W Myrtle","Pilgrim,Myrtle","E Myrtle",0,0],
["W Exit",0,"A,Thru",0,"B,Thru",0,"Route Center",0,"Bus Drive","W Thru Bridge",0,"E Thru Bridge","Market,Thru",0,"Pilgrim,Thru",0,"Well,Thru",0],
[0,0,0,0,0,0,0,0,0,0,0,0,"Shore,Bow",0,"Pilgrim,Bow",0,"Well,Bow",0],
[0,0,"A,Field",0,0,"Field,Field","Underpass",0,0,0,0,0,"Shore,Kip",0,"Pilgrim,Kip",0,"Well,Kip",0],
[0,0,"A,South",0,0,"Overpass",0,0,0,0,"Reservoir",0,"Shore,South",0,"Pilgrim,South",0,"Well,South",0]
]

	*/
	///Defines in between intersections
	block_quality = [
	[3,2,1,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0],
	[2,1,0,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0],
	[1,0,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0],
	[0,1,1,1,2,1,2,1,0,0,0,0,0,0,0,0,0,0,0],
	[1,1,1,1,2,1,1,0,0,0,0,0,0,0,0,0,0,0,0],
	[1,1,1,2,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0],
	[1,2,2,3,2,1,0,0,0,0,0,0,0,0,0,0,0,0,0],
	[1,2,2,3,2,1,1,1,2,2,0,0,0,0,0,0,0,0,0],
	[2,3,2,2,1,1,2,3,2,1,0,1,2,0,0,1,0,0,0],
	[0,1,2,1,1,1,2,2,2,2,1,1,2,1,2,0,0,1,0],
	[0,1,2,1,2,1,1,1,2,1,1,0,0,2,1,2,1,1,0],
	[0,1,1,2,1,1,1,1,1,1,0,0,0,2,2,1,2,1,0],
	[0,0,0,1,2,1,1,1,0,0,0,0,0,0,1,2,3,2,0],
	[0,0,0,0,1,2,1,0,0,0,0,0,0,0,0,2,2,1,0],
	[0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0]
	];
	
	///Defines in between intersections
	enum s {
		gr = spr_s_grass, //grass
		ce = spr_s_cement, //cement
		as = spr_s_asphalt, //asphalt
		di = spr_ground, //dirt
		ma = spr_s_marsh, //marsh
		fo = spr_s_forest, // forest
		me = spr_ground, // meadow
		pl = spr_s_plaza, //plaza
		ri = spr_s_river //river
	};
	block_scape = [
	//Edge, A, Blank, B, Blank, Middle, Blank, Bus, Bridge, Blank, West, Pilgrim, East
	[s.fo,s.fo,s.fo,s.fo,s.fo,s.fo,s.fo,s.fo,s.fo,s.fo,s.ri,s.fo,s.fo,s.fo,s.fo,s.fo,s.fo,s.fo],
	[s.fo,s.fo,s.fo,s.gr,s.fo,s.gr,s.gr,s.gr,s.gr,s.gr,s.ri,s.ma,s.me,s.gr,s.gr,s.gr,s.fo,s.fo],//Valley, 
	[s.fo,s.fo,s.gr,s.fo,s.gr,s.gr,s.gr,s.gr,s.gr,s.gr,s.ri,s.ma,s.me,s.gr,s.gr,s.gr,s.gr,s.fo],//View, Quail
	[s.fo,s.fo,s.gr,s.gr,s.gr,s.gr,s.gr,s.gr,s.ma,s.ri,s.ri,s.ma,s.fo,s.gr,s.gr,s.gr,s.fo,s.fo],//Hill, Camp
	[s.fo,s.fo,s.gr,s.gr,s.gr,s.gr,s.gr,s.gr,s.ma,s.ri,s.ma,s.ma,s.gr,s.gr,s.gr,s.gr,s.fo,s.fo],//Green,Rail
	[s.fo,s.gr,s.gr,s.gr,s.gr,s.gr,s.gr,s.gr,s.ma,s.ri,s.ma,s.ma,s.fo,s.gr,s.gr,s.gr,s.fo,s.fo],//Carp
	[s.fo,s.gr,s.gr,s.gr,s.gr,s.ce,s.ce,s.gr,s.gr,s.ri,s.ri,s.ma,s.gr,s.gr,s.gr,s.gr,s.gr,s.fo],//Bell
	[s.fo,s.gr,s.gr,s.gr,s.ce,s.ce,s.ce,s.gr,s.gr,s.ri,s.ri,s.gr,s.gr,s.gr,s.gr,s.gr,s.gr,s.fo],//Oak
	[s.fo,s.gr,s.gr,s.gr,s.pl,s.pl,s.ce,s.gr,s.gr,s.ri,s.ri,s.as,s.gr,s.gr,s.gr,s.gr,s.fo,s.fo],//Thru
	[s.gr,s.gr,s.gr,s.gr,s.gr,s.gr,s.gr,s.gr,s.gr,s.ri,s.ri,s.gr,s.gr,s.gr,s.gr,s.gr,s.gr,s.gr],//Bow
	[s.gr,s.gr,s.gr,s.gr,s.gr,s.gr,s.gr,s.gr,s.gr,s.ri,s.ri,s.gr,s.gr,s.gr,s.gr,s.gr,s.gr,s.gr],//Field
	[s.gr,s.gr,s.gr,s.gr,s.gr,s.gr,s.gr,s.gr,s.gr,s.ri,s.ri,s.gr,s.gr,s.gr,s.gr,s.gr,s.fo,s.fo],//South
	[s.gr,s.gr,s.gr,s.gr,s.gr,s.gr,s.gr,s.gr,s.gr,s.gr,s.gr,s.gr,s.gr,s.gr,s.gr,s.gr,s.fo,s.fo],
	[s.gr,s.gr,s.gr,s.gr,s.gr,s.gr,s.gr,s.gr,s.gr,s.gr,s.gr,s.gr,s.gr,s.gr,s.gr,s.fo,s.fo,s.fo]
	];

	global.scape_map = ds_grid_create(map_b_w,map_b_h);
	global.ground_map = ds_grid_create(map_b_w*global.block,map_b_h*global.block);
	for (r = 0;r < map_b_h;r++) {
		for (c = 0;c < map_b_w;c++) {
			
			var this_scape = block_scape[r,c];
			for (rr = r*global.block;rr < (r+1)*global.block;rr++) {
				for (cc = c*global.block;cc < (c+1)*global.block;cc++) {
					ds_grid_set(global.ground_map,cc,rr,this_scape);
				}
			}
			ds_grid_set(global.scape_map,c,r,this_scape);
		}
	}
	
	block_tiles =  global.block/global.tile_size;
	global.g_width = map_b_w*block_tiles;
	global.g_height = map_b_h*block_tiles;
	ground_width = global.g_width;
	ground_height = global.g_height;
	show_debug_message(string(ground_width)+" x "+string(ground_height));
	global.quality_map = ds_grid_create(ground_width+1,ground_height+1);
	//global.tile_map = ds_grid_create(ground_width,ground_height);
	for (r = 0;r < ground_height;r++) {
		for (c = 0;c < ground_width;c++) {
			
			
			block_x = floor((c*global.tile_size)/global.block);
			block_y = floor((r*global.tile_size)/global.block);
			var this_block_q = block_quality[block_y,block_x];
			switch (this_block_q) {
				case 0: var this_quality = irandom_range(0,5);
				break;
				case 1: var this_quality = irandom_range(0,9);
				break;
				case 2: var this_quality = irandom_range(0,12);
				break;
				case 3: var this_quality = irandom_range(4,15);
				break;
			}
			ds_grid_set(global.quality_map,c,r,this_quality);
		}
	}
	instance_create_layer(0,0,"Ground",obj_ground);
}