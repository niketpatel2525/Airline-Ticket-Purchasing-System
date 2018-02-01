/**
 * This JS will only check empty fields.
 */

function validateEmptyFields(form) {
	if(null == form || typeof(form) == 'undefined') {
		return false;
	}
	if(form.id == "signInForm") {
		return validateSignInForm(form);
	} else if(form.id == "registerForm") {
		return validateRegisterForm(form);
	} else if(form.id == "addUpdateAircraft") {
		return validateAddUpdateAircraftForm(form);
	} else if(form.id == "addUpdateOffer") {
		return validateAddUpdateOfferForm(form);
	} else if(form.id == "searchTicketForm") {
		return validateSearchTicektForm(form);
	} else if(form.id == "flightStatusForm") {
		return validateFlightStatusForm(form);
	} else if(form.id == "helpForm") {
		return validateHelpForm(form);
	} else if(form.id == "addUpdateFlightForm") {
		return validateAddUpdateFlightForm(form);
	} else if(form.id == "homeForm") {
		return validateHomeForm(form);
	}
}

function checkIfEmpty(formElement, isDropdown, dropDownDefaultText) {
	if(null == formElement || typeof(formElement) == 'undefined') {
		return false;
	}
	if(!isDropdown) {
		if(formElement.value == null || formElement.value.trim() == '') {
			return false;
		}
	} else {
		if(null == dropDownDefaultText || dropDownDefaultText == '') {
			if(formElement.value == null || formElement.value.trim() == '') {
				return false;
			}
		} else {
			if(formElement.value == null || formElement.value.trim() == '' || formElement.value.trim() == dropDownDefaultText) {
				return false;
			}
		}
	}
	return true;
}

// This function will validate all fields
function validateAllFields(form, dropDownDefaultTexts) {
	debugger;
	var elements = form.elements;
	var isValid = true;
	var dropDownCount = 0;
	for(var i=0; i < elements.length; i++) {
		var element = elements[i];
		console.debug("Validating element of type - "+element.type + " and name -"+ element.name + " with value -"+element.value);
		if(element.type == "submit" || element.type == "button") {
			continue;
		}
		if(element.type == "text" || element.type == "email" || element.type == "password" || element.type == "date" || element.type == "time") {
			if(!checkIfEmpty(element, false, null)) {
				element.nextSibling.nextSibling.innerHTML = "This Field is required";
				isValid = false;
			} else {
				element.nextSibling.nextSibling.innerHTML = "";
			}
		} else {
			if(!checkIfEmpty(element, true, dropDownDefaultTexts[dropDownCount])) {
				element.nextSibling.nextSibling.innerHTML = "This Field is required";
				isValid = false;
			} else {
				element.nextSibling.nextSibling.innerHTML = "";
			}
			dropDownCount = dropDownCount + 1;
		}
	}
	return isValid;
}

function validateSignInForm(form) {
	var dropDowns = ["Choose User Type"];
	return validateAllFields(form, dropDowns);
}

function validateRegisterForm(form) {
	var dropDowns = ["Choose User Type"];
	return validateAllFields(form, dropDowns);
}

function validateAddUpdateAircraftForm(form) {
	return validateAllFields(form, []);
}

function validateAddUpdateOfferForm(form) {
	return validateAllFields(form, [""]);
}

function validateSearchTicektForm(form) {
	return validateAllFields(form, []);
}

function validateFlightStatusForm(form) {
	return validateAllFields(form, []);
}

function validateHelpForm(form) {
	return validateAllFields(form, []);
}

function validateAddUpdateFlightForm(form) {
	return validateAllFields(form, ["Choose Aircraft","Choose Route",""]);
}

function validateHomeForm(form) {
	//return validateAllFields(form, []);
	var isValid = true;
	var tripType = "";
	if(document.getElementById("optionsRadios1").checked) {
		tripType = "rt";
	} else {
		tripType = "ow"; 
	}
	if(!checkIfEmpty(document.getElementById("departuerText"), false, null)) {
		isValid = false;
		document.getElementById("departuerErr").innerHTML = "This field is required";
	} else {
		
		document.getElementById("departuerErr").innerHTML = "";
	}

	if(!checkIfEmpty(document.getElementById("arrivalText"), false, null)) {
		isValid = false;
		document.getElementById("arrivalErr").innerHTML = "This field is required";
	} else {
		document.getElementById("arrivalErr").innerHTML = "";
	}

	if(!checkIfEmpty(document.getElementById("dDateText"), false, null)) {
		isValid = false;
		document.getElementById("dDateErr").innerHTML = "This field is required";
	} else {
		document.getElementById("dDateErr").innerHTML = "";
	}

	if(tripType == "rt") {
		if(!checkIfEmpty(document.getElementById("rdate"), false, null)) {
			isValid = false;
			document.getElementById("rdateErr").innerHTML = "This field is required";
		} else {
			document.getElementById("rdateErr").innerHTML = "";
		}
	}

	if(!checkIfEmpty(document.getElementById("nopText"), false, null)) {
		isValid = false;
		document.getElementById("nopErr").innerHTML = "This field is required";
	} else {
		document.getElementById("nopErr").innerHTML = "";
	}
	return isValid;
}

// function to handle trip type.
function handleTripType(radio) {
	if(radio.value == "rt") {
		document.getElementById('rdateDiv').style.display="";
	}
	else if(radio.value == "ow") {
		document.getElementById('rdateDiv').style.display="none";
	}
}
