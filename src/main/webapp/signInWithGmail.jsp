<!DOCTYPE html>
<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page isELIgnored="false"%>
<html lang="en">
<head>
<%-- stylesheets --%>
<%-- font awesome--%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<%-- bootstrap min--%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<%-- Google fonts --%>
<link href="https://fonts.googleapis.com/css?family=Lato:400,900|Scada&amp;subset=latin-ext" rel="stylesheet">
<%-- custom css --%>
<link rel="stylesheet" href="../styles/style.css">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<%--tablet and iphone meta--%>
<meta name='HandheldFriendly' content='True' />
<meta name="viewport" content="initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, width=device-width, user-scalable=no">
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
<title>Sign In Using Google</title>
</head>
<body style="overflow: visible;">
	<div class="container-flud p-0">
		<!--=========================== header =========================== -->
		<header>
			<div id="header-is" class="headbar-cs">
				<div class="container-fluid p-0">
					<div class="row-fluid">
						<div class="col-md-12">
							<%@include file="components/navbar.jsp"%>
						</div>
					</div>
				</div>
			</div>
		</header>
		<!--=========================== header =========================== -->
		<div id="content-is" class="content-cs">
			<p>Contents</p>


			
			
			
			
			
			
			
			
			
			
		</div>
		<div id="links-is" class="links-cs">
			<p>Links</p>
		</div>
		<!--=========================== footer =========================== -->
		<footer>
			<div id="copyright" class="copyright">
				<%@include file="components/footer.jsp"%>
			</div>
		</footer>
		<!--=========================== footer =========================== -->
	</div>
	<%-- scripts --%>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.11.8/umd/popper.min.js" integrity="sha512-TPh2Oxlg1zp+kz3nFA0C5vVC6leG/6mm1z9+mA81MI5eaUVqasPLO8Cuk4gMF4gUfP5etR73rgU/8PNMsSesoQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
	<script src="../js/myscript.js"></script>
</body>
</html>