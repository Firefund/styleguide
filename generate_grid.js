
/**
 * Naive grid generator - creates rows with cells that can be pushed
 * to different start positions.
 * TODO: Refactor to combine classes that does the same
 * 	E.g. These 3 declaration blocks are identical:
 *
 * ```css
	.f-row_6 .f-row__cell_3 {
		lost-cell: 3/6 flex;
	}
	.f-row_12 .f-row__cell_6 {
		lost-cell: 6/12 flex;
	}
	.f-row_24 .f-row__cell_12 {
		lost-cell: 12/24 flex;
	}
	```
 */
const grid = (cells) => {
	const startBracket = " {\r\n"
	const endBracket = "\r\n}\r\n"
	const css = [
		".f-row_",
		cells,
		" .f-row__cell_",
		null,//n
		startBracket,
		"\tlost-column: ",
		null,//n
		"/",
		cells,
		" flex;",
		endBracket,
		".f-row_",
		cells,
		" .f-row__cell_push_",
		null,//n
		startBracket,
  	"\tlost-offset: -",
		null,//n
		"/",
		cells,
		";",
		endBracket
	]
	const csss = []
	for (let n = 1; n < cells; n++) {
		csss.push(css.map(a => a == null ? n : a).join(""))
	}
	csss.push("\r\n")
	return csss.join("")
}
const grid_mobile = (cells) => {
	const startBracket = " {\r\n"
	const endBracket = "\r\n}\r\n"
	const css = [
		".f-row_",
		cells,
		" .f-row__cell_",
		null,//n
		startBracket,
		"\tlost-column: ",
		null,//n
		"/",
		cells,
		" flex;",
		endBracket,
		".f-row_",
		cells,
		" .f-row__cell_push_",
		null,//n
		startBracket,
  	"\tlost-offset: -",
		null,//n
		"/",
		cells,
		";",
		endBracket
	]
	const csss = []
	for (let n = 1; n < cells; n++) {
		csss.push(css.map(a => a == null ? n : a).join(""))
	}
	csss.push("\r\n")
	return csss.join("")
}

const grid_6 = grid(6)
const grid_12 = grid(12)
const grid_24 = grid(24)
const grid_mobile_6 = grid_mobile(6)
const grid_mobile_12= grid_mobile(12)
const grid_mobile_24= grid_mobile(24)

console.log(`
@lost gutter 3.4rem;

.f-row {
  lost-flex-container: row;
}
.f-row::after {
  lost-utility: clearfix;
}

.f-row__cell {
  lost-column: 1 flex;
}

@media screen and (--viewport-desktop) {
	.f-row__not-desktop { display: none; }

	${grid_6}

	${grid_12}

	${grid_24}
}


/*
 ## mobile
*/
@media screen and (--viewport-mobile) {
  .f-row__not-mobile { display: none; }

	${grid_mobile(6)}
	
	${grid_mobile(12)}
	
	${grid_mobile(24)}
}
`)
