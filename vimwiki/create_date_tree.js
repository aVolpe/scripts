//TODO Preparar para el 2015

/*
 * Lista de meses
 */
var monthNames = [ "enero", "febrero", "marzo", "abril", "mayo", "junio",
    "julio", "agosto", "setiembre", "octubre", "noviembre", "diciembre" ];

/**
* Retorna el un objeto json que representa el díá del mes pasado,
* con una propiedad `url` que es igual a : `mes\dia`
*/
function getDay(name, monthNumber) {
	var month = monthNames[monthNumber];
	if (name < 10) name = "0" + name;
	return { title : name, url : "../" + month + "/" + name + ".html"};
}

/**
 * Retorna un objeto json que representa al mes,
 * no se almacena el número del mismo, solo la cadena,
 * ver #monthNames.
 */
function getMonth(number) {
	var name = monthNames[number];
	return { title : name, folder : true};
}

/**
 * Dado un <ui> con id=tree, crea un arbol
 * de días, empezando por el 24 de enero, hasta el díá de hoy.
 */
function createDateTree() {

	$('#tree').fancytree({
		activate: function(event, data) {
			var node = data.node;
			var url = data.node.data.url;
			// Use <a> href and target attributes to load the content:
			if( url ){
				location.href = url
			} else {
				node.setExpanded(true);
			}
		}
	});
	var root = $('#tree').fancytree('getRootNode');
	var start = new Date("01/24/2014");
	var end = new Date(Date.now());

	var hoy = getCurrentDate();

	var dia = hoy.getDate();
	var mes = hoy.getMonth();

	var currentRoot = root.addChildren(getMonth(start.getMonth()));
	var currentMonth = start.getMonth();

	while( start < end ){
		if (currentMonth != start.getMonth()) {
			// se cambio el mes
			currentRoot = root.addChildren(getMonth(start.getMonth()));
			currentMonth = start.getMonth();
		}
		var current = currentRoot.addChildren(getDay(start.getDate(), currentMonth))

		if (mes === monthNames[start.getMonth()] &&
				parseInt(dia) === start.getDate()) {
			current.data.url = null;
			current.setActive();
		}
		var newDate = start.setDate(start.getDate() + 1);
		start = new Date(newDate);
	}
}
