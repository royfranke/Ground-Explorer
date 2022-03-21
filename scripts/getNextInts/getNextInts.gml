// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function getNextInts (next_int,int_end,visited) {
	finished = false;
	if (next_int == int_end) {
		finished = true;
	}
	else {
	/// If it isn't already visited...
		if (!in_array(next_int,visited)) {	
	///		run getIntPath on the intersection
			following_ints = getIntPath(next_int);
			if (array_length(following_ints) > 1) {
			///		Count the possible next intersections
			///     if there is at least one further int...
			///     put our intersection on the YES list
					array_push(yes_list,next_int);
					for (f = 0; f < array_length(following_ints); f++) {
						if (following_ints[n] == int_end) {
							finished = true;
						}
						else {
							if (
							!in_array(following_ints[f],future_paths)
							&& !in_array(following_ints[f],yes_list)
							&& !in_array(following_ints[f],no_list)
							) {
								array_push(future_paths,following_ints[f]);
							}
						}
					}
				}
			}
		}
}