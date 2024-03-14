/**
 * My Script
 */
//alert("Script is loading")
var map;
function initMap() {
		map = new mappls.Map('map', {
		center: [28.638698386592438, 77.27604556863412],
		geolocation: true,
		zoomControl: true,
		scrollWheel: false
	}
	)
}			   

function reload() {
	document.location.reload()
}

function adminLoginResponse() {
	const myDivision = document.createElement("div");
	myDivision.setAttribute("class", "card shadow bg-dark text-light p-2 m-2");
	myDivision.innerHTML = "Hello World";
	const myDivision1 = document.createElement("div");
	myDivision1.setAttribute("class", "card-body text-danger text-center m-2 p-2");
	myDivision1.setAttribute("id", "secondDiv");
	myDivision1.textContent = "my Division one";
	myDivision.appendChild(myDivision1);
	/*document.getElementById("respHead1").innerHTML+="Hello Admin";*/
	document.getElementById("respHead1").appendChild(myDivision);
	document.getElementById("secondDiv").appendChild(myBoldText());
}

function logoutForm() {
	const logoutForm = document.createElement("form");
	logoutForm.setAttribute("method", "post");
	logoutForm.setAttribute("action", "${ctxp}/HMS/logout");
	logoutForm.setAttribute("id", "logoutForm");
}
function logoutButton() {
	const mybtn = document.createElement("button");
	mybtn.setAttribute("class", "bg-danger text-white text-center");
	mybtn.setAttribute("form", "logoutForm");
	mybtn.setAttribute("value", "Logout")
}

//prompt("You're about to terminate your session", "testing");

function logOuT() {
	let x = confirm("You're about to terminate your session, Do you want to logout?");
	if (x == true) {
		alert("You are being redirected");
	}
	let baseUriOfPage = document.baseURI;
	baseUriOfPage = "http://localhost:8080/HMS/logout";
	action
	return baseUriOfPage;
}

function serverResp() {
	const mydiv = document.createElement("div");
	mydiv.setAttribute("class", "bg-dark text-light text-center fs-2");
	mydiv.innerHTML = "${response}";
	const r = document.getElementById("myResponseHeader");
	r.appendChild(mydiv);
}

function remResp() {
	document.getElementById("respHead").removeAttribute("${response}");
}
