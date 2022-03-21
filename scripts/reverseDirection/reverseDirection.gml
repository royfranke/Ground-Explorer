// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function reverseDirection(dir){
	reverse_dir = "s";
	switch dir {
		case "n": reverse_dir = "s";
		break;
		case "e": reverse_dir = "w";
		break;
		case "s": reverse_dir = "n";
		break;
		case "w": reverse_dir = "e";
		break;
	}
	return reverse_dir;
}