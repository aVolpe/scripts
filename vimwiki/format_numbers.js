function addClassTo3nthColumn() {

	// Agregamos la clase number a los números
        $('table tr').find('td:nth-child(3)').addClass('number')
}

/**
 * Calcula el total de gastos de un díá
 */
function calculateTotal() {
	// sumamos
	sum = 0
	number =  $('.number')
	number.each(function(i) {
			value = parseInt($(this).html());
			if (!isNaN(value))
				sum += value
		} );

	//Agrega la fila deseada
	$('table tr:last').after('<tr class="footTable"><td>Total</td><td></td><td class="number">' + sum.toString() + '</td><td></td></tr>');
}
function formatNumbers() {

	number =  $('.number')
	number.number(true)
}
