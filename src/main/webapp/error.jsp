<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="components/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<!-- <script type="text/javascript" src="js/myscript.js"></script> -->
<meta charset="UTF-8">
<%@include file="components/allcss.jsp"%>
<title>Something didn't work</title>
</head>
<body>
	<!--=========================== header =========================== -->

	<header><%@include file="components/navbar.jsp"%></header>

	<!--=========================== header =========================== -->
	

	
	
	
	
	
	<div class="text-center mt-5">
		<h1 class="mt-5">Oops!</h1>
		<small>Something didn't work. Do review your request once
			again.</small>
	</div>
	<hr>
	<div class="container p-3">
		<p class="text-danger text-center">
			<c:if test="${empty userObj}">
${response}
<c:remove var="response" scope="session" />
			</c:if>
		</p>
	</div>

<div class="container">
<c:if test="${not empty exception}">
${exception }
<p><%=request.getParameter("exception") %></p>
</c:if>
<c:remove var="exception" scope="session" />


	<div id="toasterPlaceholder">
	

	
	</div>
</div>
	<!--=========================== footer =========================== -->

	<%@include file="components/footer.jsp"%>

	<!--=========================== footer =========================== -->

	<!--=========================== scripts =========================== -->

	<%@include file="components/allscripts.jsp"%>

	<!--=========================== scripts =========================== -->

</body>
</html>