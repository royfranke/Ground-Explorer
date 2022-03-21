/// @function findTestPath (int_start, int_end);
function findTestPath (int_start, int_end) {
	visited = [];
	parents = [];
	obey_laws = true;
	solved = false;
	// Build a frontier from the next open intersections
	frontier = [int_start];
	solution = [];
	// While the frontier is populated...
	while (array_length(frontier) > 0 && !solved) {
		next_ints = getIntPath(frontier[0],obey_laws);
		array_push(visited,frontier[0]);
		for (n = 0; n < array_length(next_ints);n++) {
			if (!in_array(next_ints[n],visited) && !in_array(next_ints[n],frontier)) {
				array_push(frontier,next_ints[n]);
				array_push(parents,[next_ints[n],frontier[0]])
				if (next_ints[n] == int_end) {
					solved = true;
					place = frontier[0];
					solution = [next_ints[n],frontier[0]];
					while (place != int_start) {
						for (d = 0; d < array_length(parents); d++) {
							if (parents[d][0] == place) {
								place = parents[d][1];
								array_push(solution,place);
							}
						}
					}
				}
			}
		}
		array_delete(frontier,0,1);
	}
	return(solution);
}