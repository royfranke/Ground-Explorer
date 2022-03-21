/// @function createStreets();
function createStreets(){
	global.block = 384;
	global.tile_size = 16;
	global.road_type_width = [6,10,4,4];
		inters = [
	//slug,x blocks, y blocks, n_term, e_slug, s_slug, w_term, 0-6
	//e_name, s_name, e_type, s_type, traf_light, n_edge ,e_edge, s_edge, w_edge 7-15
		["N Exit",6,0,true,"","Middle,Valley",true,"","Middle St.",0,1,0,0,0,0,0],
		
		//Valley Rd.
		["Middle,Valley",6,2,false,"River,Valley","Middle,View",true,"Valley Rd.","Middle St.",0,1,0,0,0,0,0],
		["River,Valley",8,2,true,"W Valley Bridge","River,View",false,"Valley Rd.","River St.",0,0,0,0,0,0,0],
		["W Valley Bridge",9,2,true,"E Valley Bridge","",false,"Valley Rd.","",0,0,0,0,0,0,0],
		["E Valley Bridge",11,2,true,"Marsh,Valley","",false,"Valley Rd.","",0,0,0,0,0,0,0],
		["Marsh,Valley",12,2,true,"Pilgrim,Valley","Marsh,Quail",false,"Valley Rd.","Marsh Rd.",0,2,0,0,0,0,0],
		["Pilgrim,Valley",14,2,true,"","Pilgrim,Quail",false,"Valley Rd.","Pilgrim St.",0,0,0,0,0,0,0],
		
		//View Rd.
		["A,View",4,3,false,"Middle,View","A,Hill",true,"View Rd.","A St.",3,2,0,0,0,0,0],
		["Middle,View",6,3,false,"River,View","Middle,Hill",false,"View Rd.","Middle St.",3,1,0,0,0,0,0],
		["River,View",8,3,false,"","River,Hill",false,"View Rd.","River St.",3,3,0,0,0,0,0],
	
		//Hill Rd.
		["A,Hill",3,4,false,"Middle,Hill","A,Green",true,"Hill Rd.","A St.",2,2,0,0,0,0,0],
		["Middle,Hill",6,4,false,"River,Hill","Middle,Green",false,"Hill Rd.","Middle St.",2,1,0,0,0,0,0],
		["River,Hill",8,4,false,"","",false,"Hill Rd.","River St.",2,0,0,0,0,0,0],
	
		//Green St.
		["A,Green",2,5,false,"B,Green","A,Carp",true,"Green St.","A St.",3,2,0,0,0,0,0],
		["B,Green",4,5,true,"Middle,Green","B,Carp",false,"Green St.","B St.",3,3,0,0,0,0,0],
		["Middle,Green",6,5,false,"","Middle,Carp",false,"Green St.","Middle St.",3,1,0,0,0,0,0],

		//Carp St.
		["A,Carp",2,6,false,"B,Carp","A,Bell",true,"Carp St.","A St.",2,2,0,0,0,0,0],
		["B,Carp",4,6,false,"Middle,Carp","B,Bell",false,"Carp St.","B St.",2,3,0,0,0,0,0],
		["Middle,Carp",6,6,false,"","Middle,Bell",false,"Carp St.","Middle St.",2,1,0,0,0,0,0],
		
		//Bell St.
		["A,Bell",2,7,false,"B,Bell","A,Oak",true,"Bell St.","A St.",3,2,0,0,0,0,0],
		["B,Bell",4,7,false,"Middle,Bell","B,Oak",false,"Bell St.","B St.",3,3,0,0,0,0,0],
		["Middle,Bell",6,7,false,"Bus,Bell","Middle,Oak",false,"Bell St.","Middle St.",3,1,0,0,0,0,0],
		["Bus,Bell",8,7,true,"","Bus Drive",false,"","Bus Drive",3,3,0,0,0,0,0],
		
		//Oak St.
		["A,Oak",2,8,false,"B,Oak","A,Thru",true,"Oak St.","A St.",2,2,0,0,0,0,0],
		["B,Oak",4,8,false,"Middle,Oak","B,Thru",false,"Oak St.","B St.",2,3,0,0,0,0,0],
		["Middle,Oak",6,8,false,"","Route Center",false,"","Middle St.",2,1,0,0,0,0,0],
		
		//Field Rd.
		["A,Field",2,11,false,"Field,Field","A,South",true,"Field Rd.","",0,0,0,0,0,0,0],
		["Field,Field",5,11,true,"","Overpass",false,"","Field Ct.",0,0,0,0,0,0,0],
		
		//South Rd.
		["A,South",2,12,false,"Overpass","",true,"South Rd.","",0,0,0,0,0,0,0],
		["Overpass",5,12,false,"Reservoir","",false,"South Rd.","",0,0,0,0,0,0,0],
		["Reservoir",10,12,true,"Shore,South","",false,"South Rd.","",0,0,0,0,0,0,0],
		["Shore,South",12,12,false,"Pilgrim,South","",false,"South Rd.","",0,0,0,0,0,0,0],
		["Pilgrim,South",14,12,false,"Well,South","",false,"South Rd.","",0,0,0,0,0,0,0],
		["Well,South",16,12,false,"","",false,"","",0,0,0,0,0,0,0],
		
		//Kip St.
		["Shore,Kip",12,11,false,"Pilgrim,Kip","Shore,South",true,"Kip St.","Shore Rd.",0,0,0,0,0,0,0],
		["Pilgrim,Kip",14,11,false,"Well,Kip","Pilgrim,South",false,"Kip St.","Pilgrim St.",0,0,0,0,0,0,0],
		["Well,Kip",16,11,false,"","Well,South",false,"Kip St.","Well St.",0,0,0,0,0,0,0],
		
		//Bow St.
		["Shore,Bow",12,10,true,"Pilgrim,Bow","Shore,Kip",true,"Bow St.","Shore Rd.",0,0,0,0,0,0,0],
		["Pilgrim,Bow",14,10,false,"Well,Bow","Pilgrim,Kip",false,"Bow St.","Pilgrim St.",0,0,0,1,1,1,1],
		["Well,Bow",16,10,false,"","Well,Kip",false,"Bow St.","Well St.",0,0,0,0,0,0,0],
		
		//Thru St.
		["W Exit",0,9,true,"A,Thru","",false,"Thru St.","",1,0,0,0,0,0,0],
		["A,Thru",2,9,false,"B,Thru","A,Field",false,"Thru St.","",1,0,0,0,0,0,0],
		["B,Thru",4,9,false,"Route Center","",false,"Thru St.","",1,0,0,0,0,0,0],
		["Route Center",6,9,false,"Bus Drive","Underpass",false,"Thru St.","Middle St.",1,0,1,0,0,0,0],
		["Bus Drive",8,9,false,"W Thru Bridge","",false,"Thru St.","",1,0,0,0,0,0,0],
		["W Thru Bridge",9,9,true,"E Thru Bridge","",false,"Thru St.","",1,0,0,0,0,0,0],
		["E Thru Bridge",11,9,true,"Market,Thru","",false,"Thru St.","",1,0,0,0,0,0,0],
		["Market,Thru",12,9,false,"Pilgrim,Thru","",false,"Thru St.","",1,0,0,0,0,0,0],
		["Pilgrim,Thru",14,9,false,"Well,Thru","Pilgrim,Bow",false,"Thru St.","Pilgrim St.",1,0,1,0,0,0,0],
		["Well,Thru",16,9,true,"E Exit","Well,Bow",false,"Thru St.","Well St.",1,0,0,0,0,0,0],
		["E Exit",18,9,true,"","",false,"","",1,0,0,0,0,0,0],
		
		//Myrtle St.
		["W Myrtle",13,8,true,"Pilgrim,Myrtle","",true,"Myrtle St.","",0,0,0,0,0,0,0],
		["Pilgrim,Myrtle",14,8,false,"E Myrtle","Pilgrim,Thru",false,"Thru St.","Pilgrim St.",0,0,0,1,1,1,1],
		["E Myrtle",15,8,true,"","",false,"","",0,0,0,0,0,0,0],
		
		//Cherry St.
		["W Cherry",13,7,true,"Pilgrim,Cherry","",true,"Cherry St.","",0,0,0,0,0,0,0],
		["Pilgrim,Cherry",14,7,false,"E Cherry","Pilgrim,Myrtle",false,"Cherry St.","Pilgrim St.",0,0,0,1,1,1,1],
		["E Cherry",15,7,true,"","",false,"","",0,0,0,0,0,0,0],
		
		//Willow St.
		["W Willow",13,6,true,"Pilgrim,Willow","",true,"Willow St.","",0,0,0,0,0,0,0],
		["Pilgrim,Willow",14,6,false,"E Willow","Pilgrim,Cherry",false,"Willow St.","Pilgrim St.",0,0,0,1,1,1,1],
		["E Willow",15,6,true,"","",false,"","",0,0,0,0,0,0,0],
		
		//Rail St.
		["Marsh,Rail",12,5,false,"Pilgrim,Rail","",true,"Rail St.","",2,2,0,0,0,0,0],
		["Pilgrim,Rail",14,5,false,"Wood,Rail","Pilgrim,Willow",false,"Rail St.","Pilgrim St.",3,0,0,0,0,0,0],
		["Wood,Rail",16,5,false,"","",false,"","",3,2,0,0,0,0,0],
		
		//Camp St.
		["Marsh,Camp",12,4,false,"Pilgrim,Camp","Marsh,Rail",true,"Camp St.","Marsh Rd.",3,2,0,0,1,0,0],
		["Pilgrim,Camp",14,4,false,"Wood,Camp","Pilgrim,Rail",false,"Camp St.","Pilgrim St.",3,0,0,0,0,0,0],
		["Wood,Camp",16,4,false,"","Wood,Rail",false,"","Wood St.",3,2,0,0,0,0,0],
		
		//Quail St.
		["Marsh,Quail",12,3,false,"Pilgrim,Quail","Marsh,Camp",true,"Quail St.","Marsh Rd.",2,2,0,0,0,0,0],
		["Pilgrim,Quail",14,3,false,"Wood,Quail","Pilgrim,Camp",false,"Quail St.","Pilgrim St.",2,0,0,0,0,0,0],
		["Wood,Quail",16,3,true,"","Wood,Camp",false,"","Wood St.",2,2,0,0,0,0,0],
		
		
		["Underpass",6,11,false,"","Onramp",true,"","Middle St./Rte. 12",0,0,0,0,0,0,0],
		["Onramp",6,13,false,"","",true,"","",0,0,0,0,0,0,0]
    ];

	global.inters_count = array_length(inters);
	global.inters_grid = ds_grid_create(16,global.inters_count);
	for (i = 0; i < global.inters_count;i++) {
		var this_inter = instance_create_layer(inters[i][1]*global.block,inters[i][2]*global.block,"Roads",obj_intersection);
		this_inter.slug = inters[i][0];
		this_inter.n_term = inters[i][3];
		this_inter.e_slug = inters[i][4];
		this_inter.s_slug = inters[i][5];
		this_inter.w_term = inters[i][6];
		this_inter.e_name = inters[i][7];
		this_inter.s_name = inters[i][8];
		this_inter.e_type = inters[i][9];
		this_inter.s_type = inters[i][10];
		
		this_inter.traf_light = inters[i][11];
		this_inter.n_edge = inters[i][12];
		this_inter.e_edge = inters[i][13];
		this_inter.s_edge = inters[i][14];
		this_inter.w_edge = inters[i][15];
		
		for (g = 0; g < 16; g++) {
			ds_grid_set(global.inters_grid, g, i, inters[i][g]);
		}
	}
}
