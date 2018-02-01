function init() {
	completeField = document.getElementById("searchId");
	completeTable = document.getElementById("complete-table");
	autoRow = document.getElementById("auto-row");

}

function doCompletion() {
	var url = "FlightServlet?code=autocomplete&searchId="
			+ escape(searchId.value);
	console.log(searchId.value);
	req = initRequest();
	req.open("GET", url, true);
	req.send();
	req.onreadystatechange = callback;
}

function initRequest() {
	isIE = false;
	if (window.XMLHttpRequest) {
		if (navigator.userAgent.indexOf('MSIE') != -1) {
			isIE = true;
		}
		return new XMLHttpRequest();
	} else if (window.ActiveXObject) {
		isIE = true;
		return new ActiveXObject("Microsoft.XMLHTTP");
	}
}
function appendProduct(name, link) {
	var row;
	var cell;
	var linkElement;
	if (isIE) {
		completeTable.style.display = 'block';
		row = completeTable.insertRow(completeTable.rows.length);
		cell = row.insertCell(0);
	} else {
		completeTable.style.display = 'table';
		completeTable.style.background = "#eee";
		completeTable.className = "gridtable autocomplete-table";
		row = document.createElement("tr");
		cell = document.createElement("td");
		cell.style.padding = '5px';
		cell.style.fontSize = '20px';
		row.appendChild(cell);
		completeTable.appendChild(row);
	}
	cell.className = "popupCell";
	linkElement = document.createElement("a");
	linkElement.className = "popupItem";
	linkElement.setAttribute("href", link);
	linkElement.appendChild(document.createTextNode(name));
	cell.appendChild(linkElement);
	console.log(cell);
}
function parseMessages(responseXML) {
	if (responseXML == null) {
		return false;
	} else {
		var results = responseXML.getElementsByTagName("results")[0];
		if (results.childNodes.length > 0) {
			completeTable.setAttribute("bordercolor", "black");
			completeTable.setAttribute("border", "1");
			for (loop = 0; loop < results.childNodes.length; loop++) {
				var result = results.childNodes[loop];
				var name = result.getElementsByTagName("name")[0];
				var link = result.getElementsByTagName("link")[0];
				appendProduct(name.childNodes[0].nodeValue,
						link.childNodes[0].nodeValue);
			}
		}
	}
}
function callback() {
	clearTable();
	if (req.readyState == 4) {
		if (req.status == 200) {
			parseMessages(req.responseXML);

		}
	}
}
function clearTable() {
	if (completeTable.getElementsByTagName("tr").length > 0) {
		completeTable.style.display = 'none';
		for (loop = completeTable.childNodes.length - 1; loop >= 0; loop--) {
			completeTable.removeChild(completeTable.childNodes[loop]);
		}
	}
}
