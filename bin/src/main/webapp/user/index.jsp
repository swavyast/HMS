<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.LocalDate"%>
<%@page import="com.ml.db.DatabaseConfiguration"%>
<%@page import="com.ml.dao.UserDao"%>
<%@page import="com.ml.entity.User"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/components/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/components/allcss.jsp"%>
<meta charset="UTF-8">
<title>Welcome to MediHome</title>
</head>
<body>

	<%
	UserDao u = new UserDao(DatabaseConfiguration.getMySQLConnection());
	session.getAttribute("userObj");
	%>
	<header><%@include file="../components/navbar.jsp"%></header>
	<div class="container-fluid text-light bg-success text-center" style="border-top: 1px solid white">
		<span class="fs-6"> <c:if test="${not empty response}">
               ${response} ${userObj.name}
               <c:remove var="response" scope="session"/>
			</c:if>
		</span>
	</div>

	<!--==============================Carousal Begins==============================-->

	<div class="carousel-container">
		<div class="container">

			<div class="container-fluid">
				<div id="mycar" class="carousel slide" data-bs-ride="carousel">
					<div class="carousel-inner">
						<div class="carousel-item active">
						
							<img id="pin" src="../images/location-icon-png.png" alt="" width = "10" height="10">
							<img src="../images/wmap-white.png" class="d-block w-100 wmap" data-bs-interval="1000" alt="x" >
						</div>
						<!--                         <div class="carousel-item"><img src="../images/banner-2.jpg" alt="y" class="d-block w-100"
                                data-bs-interval="100">
                        </div>
                        <div class="carousel-item"><img src="../images/banner-3.jpg" alt="z" class="d-block w-100"
                                data-bs-interval="100">
                        </div> -->
					</div>
					<button class="carousel-control-prev" type="button" data-bs-target="#mycar" data-bs-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next" type="button" data-bs-target="#mycar" data-bs-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span> <span class="visually-hidden">Next</span>
					</button>


				</div>

			</div>

		</div>
	</div>

	<!--==============================Carousal Ends==============================-->

	<!--=========================== cards =========================== -->
	<hr>
	<div class="container p-3">

		<p class="text-center fs-3">Dashboard</p>
		<hr>
		<div class="row">


			<div class="col-md-6">

				<div class="card card-shadow">

					<div class="card-body">
					<b class="fs-6">User Details</b><hr>
					<small class="card-caption">I'll write something about this card in future.</small>
						<div class="row d-flex">
							<div class="col-md-4 mt-2 avatar p-2">
									<img class="floatright p-1 dp circle" src="../images/avatar-frame.png" alt="" width="120" height="120">
									<img class = "pngdp circle" src="../images/dpwbg.png" alt="" width="100" height="100">
							</div>
							<div class="col-md-8 mt-2">
								<div class="row p-1 h6">
									<small class="col-md-4">Name:</small>
									<small class="col-md-8">
									${userObj.name}
									</small>
								</div>

								<div class="row p-1 h6">
									<small class="col-md-4">Email:</small>
									<small class="col-md-8">
									${userObj.email}
									</small>
								</div>

								<div class="row p-1 h6">
									<small class="col-md-4">DOB:</small>
									<small class="col-md-8">
									${userObj.dob}
									</small>
								</div>

								<div class="row p-1 h6">
									<small class="col-md-4">Phone:</small>
									<small class="col-md-8">
									${userObj.phone}
									</small>
								</div>
							</div>

						</div>
					</div>

				</div>

			</div>


			<div class="col-md-6">

				<div class="card card-shadow">

					<div class="card-body">

						<b class="fs-6">Appointment Details</b><hr>
						<small class="card-caption">I'll write something about this card in future.</small>
								<div class="row p-1 h6 mt-2">
									<small class="col-md-6">Appointment Date : </small>
									<small class="col-md-6">
									<% out.print(LocalDate.now()); %>
									</small>
								</div>

								<div class="row p-1 h6">
									<small class="col-md-6">Reception Contact : </small>
									<small class="col-md-6">
									${userObj.phone}
									</small>
								</div>

								<div class="row p-1 h6">
									<small class="col-md-6"> Name of the Doctor/Resident:</small>
									<small class="col-md-6">
									${userObj.phone}
									</small>
								</div>
								
								<div class="row p-1 h6">
									<small class="col-md-6">Available Slots : </small>
									<small class="col-md-6">
									<%out.print(LocalDateTime.now()); %>
									</small>
								</div>
					</div>

				</div>

			</div>


		</div>
		<hr>

		<!-- Hospital Records -->

		<p class="fs-3 text-center">Detailed Insights</p>
		<hr>
		<div class="row ">

			<div class="col-md-4">
				<div class="card card-shadow">
				<div class="card-body">
					<small>Small letters to give a hint about something.</small>
					<p>Paragraph to write a description about this card. </p>
				</div>
					<textarea rows="4" cols="3" placeholder="Write something"></textarea>
					<a class="btn btn-dark" href="">Go </a>
				</div>	
			</div>
			<div class="col-md-4">
				<div class="card card-shadow">
				<div class="card-body">
					<small>Small letters to give a hint about something.</small>
					<p>Paragraph to write a description about this card. </p>
				</div>
					<textarea rows="4" cols="3" placeholder="Write something"></textarea>
					<a class="btn btn-dark" href="">Go </a>
				</div>	

			</div>
			<div class="col-md-4">
				<div class="card card-shadow">
				<div class="card-body">
					<small>Small letters to give a hint about something.</small>
					<p>Paragraph to write a description about this card. </p>
				</div>
					<textarea rows="4" cols="3" placeholder="Write something"></textarea>
					<a class="btn btn-dark" href="">Go </a>
				</div>	
			</div>

		</div>

		<div class="row">

			<div class="col-md-4">
				<div class="card card-shadow">
				<div class="card-body">
					<small>Small letters to give a hint about something.</small>
					<p>Paragraph to write a description about this card. </p>
				</div>
					<textarea rows="4" cols="3" placeholder="Write something"></textarea>
					<a class="btn btn-dark" href="">Go </a>
				</div>	
			</div>
			<div class="col-md-4">
				<div class="card card-shadow">
				<div class="card-body">
					<small>Small letters to give a hint about something.</small>
					<p>Paragraph to write a description about this card. </p>
				</div>
					<textarea rows="4" cols="3" placeholder="Write something"></textarea>
					<a class="btn btn-dark" href="">Go </a>
				</div>	
			</div>
			<div class="col-md-4">
				<div class="card card-shadow">
				<div class="card-body">
					<small>Small letters to give a hint about something.</small>
					<p>Paragraph to write a description about this card. </p>
				</div>
					<textarea rows="4" cols="3" placeholder="Write something"></textarea>
					<a class="btn btn-dark" href="">Go </a>
				</div>	
			</div>

		</div>

		<div class="row">

			<div class="col-md-4">
				<div class="card card-shadow">
				<div class="card-body">
					<small>Small letters to give a hint about something.</small>
					<p>Paragraph to write a description about this card. </p>
				</div>
					<textarea rows="4" cols="3" placeholder="Write something"></textarea>
					<a class="btn btn-dark" href="">Go </a>
				</div>			
			</div>
			<div class="col-md-4">
				<div class="card card-shadow">
				<div class="card-body">
					<small>Small letters to give a hint about something.</small>
					<p>Paragraph to write a description about this card. </p>
				</div>
					<textarea rows="4" cols="3" placeholder="Write something"></textarea>
					<a class="btn btn-dark" href="">Go </a>
				</div>					
			</div>
			<div class="col-md-4">
				<div class="card card-shadow">
				<div class="card-body">
					<small>Small letters to give a hint about something.</small>
					<p>Paragraph to write a description about this card. </p>
				</div>
					<textarea rows="4" cols="3" placeholder="Write something"></textarea>
					<a class="btn btn-dark" href="">Go </a>
				</div>				
			</div>

		</div>

		<!-- Hospital Records -->


	</div>

	<!--=========================== cards =========================== -->












	<!--=========================== footer =========================== -->

	<%@include file="/components/footer.jsp"%>

	<!--=========================== footer =========================== -->

	<!--=========================== scripts =========================== -->

	<%@include file="/components/allscripts.jsp"%>

	<!--=========================== scripts =========================== -->
</body>
</html>