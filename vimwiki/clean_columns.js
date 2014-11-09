/**
 * Elimina los espacios sobrantes en cada celda
 * Es importante que se ejecute antes que el siguiente
 * script, por que o sino elminara celdas del total.
 */
function removeEmptyCells() {
	// por cada celda.
	$('td').each(function(e){
		var text = $(this).text();
		text = $.trim(text);
		// asigna la cadena del texto pero
		// sin espacios ni al inicio ni al
		// fin, si era una cadena compuesta
		// de espacios (\t,\s, etc) será una
		// cadena vacía.
		$(this).text(text);
	})
	//Elimina todos los que esten vacios
	$('td:empty').remove()
}
