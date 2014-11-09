// TODO preparar para el 2015
function getCurrentDate() {
	var reg = /^.*\/([a-z]+)\/([0-9]+).html$/g;
	var string = $(location).attr('pathname');
	var match = reg.exec(string);
	// son globales
	var mes = match[1]
	var dia = match[2]
	return new Date(mes + "/" + dia + "/2014");

}

function setDateInTitle() {

	var date = getCurrentDate();
	var dia = date.getDate();
	var mes = date.getMonth();
	var container = $('.header');
	var value = container.html();
	value = value.replace("DATE", dia + " de " + mes)

	container.html(value);
	document.title = dia + " de " + mes;
}
