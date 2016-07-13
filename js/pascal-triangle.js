const pascal_triangle = function(level) {
	const pascal = function(r, c) {
		if (c===0) {
			v = 1;
		} else {
			v = pascal(r, c-1) * ((r + 1 - c) / c)
		} 
		console.log('(' + r + ',' + c + ') = ' + v)
		return v;
	};
	pascal(level, level)
	if (level > 0) {
		pascal_triangle(level - 1)
	}
}

pascal_triangle(4)