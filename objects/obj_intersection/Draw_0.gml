/// @description Insert description here
// You can write your code in this editor

draw_set_color(int_color);
draw_circle(x,y,int_h,false);
//draw_text(x + 32,y - int_h/2,slug);


drawConnections(x,y,e_slug,s_slug,e_type,s_type,signals);


if (n_term) {
	draw_set_color(c_gray);
	draw_circle(x,y-int_h,4,false);
}

if (w_term) {
	draw_set_color(c_gray);
	draw_circle(x-int_h,y,4,false);
}
