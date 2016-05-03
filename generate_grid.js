
/**
 * Naive grid generator - creates rows with cells that can be pushed
 * to different start positions.
 * Based on lost: https://github.com/peterramsing/lost#readme
 * TODO: Refactor to combine classes that does the same
 * 	E.g. These 3 declaration blocks are identical:
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

/** nth take a selector as list and a declaration as list
 * and combine them while inserting n in null positions
 * [a] -> [a] -> b -> c
 * @param {string[]} css
 * @param {number} n
 * @returns {string}
*/
const nth = (css, n) =>
	css.map(a => a === placeholders.cellNumber ? n : a).join("")

const replace = (list, predicate, r) =>
	list.map(a => a === predicate ? r : a)
/**
 * @param {string[]} selector
 * @param [string[]] declaration
 * @param {number} cells
 */
const generator = (selector, declaration, cells) => {
	const output = []
	const Rselector = replace(selector, placeholders.rowNumber, cells)
	const Rdeclaration = replace(declaration, placeholders.rowNumber, cells)
	for (let n = 1; n < cells; n++) {		
		output.push( nth([...Rselector, ...Rdeclaration], n) )
	}
	return output.join("	")
}

// const types = {
// 	rowNumber: "★",
// 	cellNumber: "Ⓐ"
// }
const placeholders = {
	rowNumber: Symbol("rowNumber"),
	cellNumber: Symbol("cellNumber")
}

const startBracket = " {\r\n"
const endBracket = "\r\n}\r\n"

const cellSelector = [
	".f-row_",
	placeholders.rowNumber,
	" .f-row__cell-",
	placeholders.cellNumber
]
const pushSelector = [
	".f-row_",
	placeholders.rowNumber,
	" .f-row__cell_push_",
	placeholders.cellNumber
]
const mobileCellSelector = [
	".f-row_",
	placeholders.rowNumber,
	" .f-row__cell-mobile-",
	placeholders.cellNumber
]
const mobilePushSelector = [
	".f-row_",
	placeholders.rowNumber,
	" .f-row__cell-mobile_push_",
	placeholders.cellNumber
]
const widthDeclaration = [
	startBracket,
	"\tlost-column: ",
	placeholders.cellNumber,
	"/",
	placeholders.rowNumber,
	" flex;",
	endBracket
]
const pushDeclaration = [
	startBracket,
	"\tlost-offset: -",
	placeholders.cellNumber,
	"/",
	placeholders.rowNumber,
	";",
	endBracket
]

const columnSelector = [
	".f-column_",
	placeholders.cellNumber,
	" > *"
]
const mobilecolumnSelector = [
	".f-column_mobile_",
	placeholders.rowNumber,
	" > *"
]
const columnDeclaration = [
	startBracket,
	"\tlost-column: 1/",
	placeholders.cellNumber,
	" ",
	placeholders.rowNumber,
	";",
	endBracket
]

const grid_6 = generator(cellSelector, widthDeclaration, 6)
const pushGrid_6 = generator(pushSelector, pushDeclaration, 6)
const gridMobile_6 = generator(mobileCellSelector, widthDeclaration, 6)
const pushGridMobile_6 = generator(mobilePushSelector, pushDeclaration, 6)

const grid_12 = generator(cellSelector, widthDeclaration, 12)
const pushGrid_12 = generator(pushSelector, pushDeclaration, 12)
const gridMobile_12 = generator(mobileCellSelector, widthDeclaration, 12)
const pushGridMobile_12 = generator(mobilePushSelector, pushDeclaration, 12)

const grid_24 = generator(cellSelector, widthDeclaration, 24)
const pushGrid_24 = generator(pushSelector, pushDeclaration, 24)
const gridMobile_24 = generator(mobileCellSelector, widthDeclaration, 24)
const pushGridMobile_24 = generator(mobilePushSelector, pushDeclaration, 24)

const columnGrid_6 = generator(columnSelector, columnDeclaration, 6)
const columnMobileGrid_6 = generator(columnSelector, columnDeclaration, 6)

console.log(`
@lost gutter 3.4rem;

.f-row {
	lost-flex-container: row;
	width: 100%;
}

.f-row::after {
	lost-utility: clearfix;
}

.f-row_debug, .f-row_debug > * {
	border: 1px dashed cyan;
}

.f-row__cell {
  lost-column: 1 flex;
}

.f-column {
	lost-flex-container: row;
	width: 100%;
}

${columnGrid_6}

@media screen and (--viewport-desktop) {
	.f-row_not-desktop, .f-row__not-desktop { display: none; }
	
	${pushGrid_6}
	${pushGrid_12}
	${pushGrid_24}
}

${grid_6}

${grid_12}

${grid_24}

/*
 ## mobile
*/
@media screen and (--viewport-mobile) {
  .f-row_not-mobile, .f-row__not-mobile { display: none; }

	.f-row__cell-mobile { lost-column: 1 flex!important; }

	${columnMobileGrid_6}

	${gridMobile_6}
	${pushGridMobile_6}

	${gridMobile_12}
	${pushGridMobile_12}
	
	${gridMobile_24}
	${pushGridMobile_24}
}
`)
