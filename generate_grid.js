
const grid = (columns) => {
	const css = [
		".f-grid_",
		columns,
		" .f-grid__column_",
		,//n
		" {\r\n",
		"  lost-column: ",
		,//n
		"/",
		columns,
		" flex;",
		"\r\n}\r\n",
	]
	const csss = []
	for (let n = 1; n < columns; n++) {
		css[3] = css[6] = n
		csss.push(css.join(""))
	}
	csss.push("\r\n")
	return csss.join("")
}

console.log(`
@lost gutter 3.6rem;

.f-grid {
  lost-flex-container: row;
}
.f-grid::after {
  clear: both;
}

.f-grid__column {
  lost-column: 1 flex;
}
`)

console.log(
	grid(6),
	grid(12),
	grid(24)
)