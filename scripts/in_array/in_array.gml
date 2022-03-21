// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function in_array(needle,haystack){
	h = array_length(haystack);
	found = false;
	for (i = 0;i < h; i++) {
		if (haystack[i] == needle) {
			found = true;
			i = h;
		}
	}
	return found;
}