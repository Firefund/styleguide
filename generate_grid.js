
const grid = (columns) => {
	const startBracket = " {\r\n"
	const endBracket = "\r\n}\r\n"
	const css = [
		".f-row_",
		columns,
		" .f-row__cell_",
		null,//n
		startBracket,
		"\tlost-cell: ",
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
  clear: both;
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