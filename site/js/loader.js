(function() {
	var webComponentsSupported = ('registerElement' in document
		&& 'import' in document.createElement('link')
		&& 'content' in document.createElement('template'))

	if (!webComponentsSupported) {
		var wcPoly = document.createElement('script')
		wcPoly.src = '../lib/webcomponents.js' // TODO: change to webcomponents-lite.min.js
		wcPoly.onload = lazyLoadPolymerAndElements
		document.head.appendChild(wcPoly)
	} else {
		lazyLoadPolymerAndElements()
	}

	function lazyLoadPolymerAndElements () {
		console.log("Set up the element imports")
		// Set up the element imports.
		window.Polymer = window.Polymer || {}
		window.Polymer.dom = 'shadow'

		var elements = [
			'/wc/header.htm'
		]

		elements.forEach(function(elementURL) {

			var elImport = document.createElement('link')
			elImport.rel = 'import'
			elImport.href = elementURL

			document.head.appendChild(elImport)

		})
	}
}())