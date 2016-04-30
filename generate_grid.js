
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
const grid = (columns) => {
	const startBracket = " {\r\n"
	const endBracket = "\r\n}\r\n"
	const css = [
		".f-row_",
		columns,
		" .f-row__cell_",
		null,//n
		startBracket,
		"\tlost-column: ",
		null,//n
		"/",
		columns,
		" flex;",
		endBracket,
		".f-row_",
		columns,
		" .f-row__cell_push_",
		null,//n
		startBracket,
  	"\tlost-offset: -",
		null,//n
		"/",
		columns,
		";",
		endBracket
	]
	const csss = []
	for (let n = 1; n < columns; n++) {
		csss.push(css.map(a => a == null ? n : a).join(""))
	}
	csss.push("\r\n")
	return csss.join("")
}

console.log(`
@lost gutter 3.6rem;

.f-row {
  lost-flex-container: row;
}
.f-row::after {
  lost-utility: clearfix;
}

.f-row__cell {
  lost-column: 1 flex;
}
`)

console.log(
	grid(6),
	grid(12),
	grid(24)
)