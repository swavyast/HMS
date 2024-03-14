<%@page import="java.security.Principal"%>
<%@page import="com.ml.db.DatabaseConfiguration"%>
<%@page import="com.ml.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/components/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="/components/allcss.jsp"%>
<meta charset="UTF-8">
<title>Admin Control Panel</title>
</head>
<body>
	<%
	UserDao u = new UserDao(DatabaseConfiguration.getMySQLConnection());
	session.getAttribute("adminObj");
	session.getAttribute("name");
	%>
	
	<header><%@include file="../components/navbar.jsp"%></header>
	<c:if test="${not empty adminObj}">

		<div id="map">
		
		<div class="container-fluid m-0 p-0 position-absolute" id="respHead" onscroll="remResp()">
		<span class="text-center col-md-4 offset-4 ms-auto bg-dark text-primary p-1 mt-1">${response}<c:if test="${empty response}">${adminObj.getName()}</c:if></span>
		<c:remove var="response" scope="session"/>
		</div>
		</div>
		<div class="mt-5 m-2">
		<h2>Test Components</h2>		
		<button onclick="reload()" class="btn bg-dark text-white me-auto">Click To Reload</button>
		
<!-- 		<button onclick="classToastCreator()" class="btn bg-dark text-white me-auto">Create Toast</button>
		
		<button onclick="modalCreator()" class="btn bg-dark text-white me-auto">Create Modal</button> -->
		
<!-- Replica of login/registration/logout function -->
		
		<button form="login" class="btn bg-dark text-white me-auto">Login</button>
		<button form="reg" class="btn bg-dark text-white me-auto">Register</button>
		<button form="logout" class="btn bg-dark text-white me-auto">Logout</button>
		
		<form action="../admin-login.jsp" method="post" id="login">
		
		</form>
		<form action="../registration.jsp" method="post" id="reg">
		
		</form>
		<form action="../logout" method="post" id="logout">
		
		</form>	
		
		<%-- <%@include file="/components/mailto.jsp"%>	 --%>
		</div>
		<!-- 		==============================Carousal Begins==============================
		<div class="carousel-container">
			<div class="container">
				<div class="container-fluid">
					<div id="mycar" class="carousel slide" data-bs-ride="carousel">
						<div class="carousel-inner">
							<div class="carousel-item active">
								<img id="pin" src="../images/location-icon-png.png" alt="" width="10" height="10"> <img src="../images/wmap-white.png" class="d-block w-100 wmap" data-bs-interval="1000" alt="x">
							</div>
							                        <div class="carousel-item"><img src="../images/banner-2.jpg" alt="y" class="d-block w-100"
                                data-bs-interval="100">
                        </div>
                        <div class="carousel-item"><img src="../images/banner-3.jpg" alt="z" class="d-block w-100"
                                data-bs-interval="100">
                        </div>
						</div>
						<button class="carousel-control-prev" type="button" data-bs-target="#mycar" data-bs-slide="prev">
							<span class="carousel-control-prev-icon" aria-hidden="true"></span>
							<span class="visually-hidden">Previous</span>
						</button>
						<button class="carousel-control-next" type="button" data-bs-target="#mycar" data-bs-slide="next">
							<span class="carousel-control-next-icon" aria-hidden="true"></span>
							<span class="visually-hidden">Next</span>
						</button>
					</div>
				</div>
			</div>
		</div>
		==============================Carousal Ends============================== -->
		<!--=========================== cards =========================== -->
		<hr>
		<div class="container p-3">
			<p class="text-center fs-3" id="respHead1">${name}'s Dashboard</p>
			<hr>
			<div class="container p-2">
				<div class="container p-2">
					<div class="col-md-4 d-flex mx-auto">
						<span class="text-light bg-black w-100 text-center">${resp} ${countResult}</span>
					</div>
					<br>
					<c:remove var="resp" scope="session" />
					<c:remove var="countResult" scope="session" />
					<hr>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6">
					<div class="card card-shadow">
						<div class="card-body">
							<b class="fs-5">Users (<%=u.countUsers()%>)
							</b>
							<hr>
							<small class="card-caption">CRUD operations on User entity/relation.</small>
							<div class="row">
								<!-- Modal button -->
								<form action="${ctxp}/HMS/countUsers" method="post">
									<button type="submit" class="btn bg-success text-light mt-2" data-bs-toggle="modal" data-bs-target="#countUserModal">Count Users</button>
								</form>
								<!-- Modal button -->
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="card card-shadow">
						<div class="card-body">
							<b class="fs-5">CRUD Doctors</b>
							<hr>
							<small class="card-caption">CRUD operations on Doctor entity/relation.</small>
							<br>
							<!-- Modal button -->
							<button type="button" class="btn bg-success text-light mt-2" data-bs-toggle="modal" data-bs-target="#crudDoctorModal">CDUD Doctor</button>
							<!-- Modal button -->
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6">
					<div class="card card-shadow">
						<div class="card-body">
							<b class="fs-5">CRUD Appointments</b>
							<hr>
							<small class="card-caption">CRUD operations on Appointment entity/relation.</small>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="card card-shadow">
						<div class="card-body">
							<b class="fs-6">CRUD Specialists</b>
							<hr>
							<small class="card-caption">CRUD operations on Specialists entity/relation.</small>
							<br>
							<!-- Modal button -->
							<button type="button" class="btn bg-success text-light mt-2" data-bs-toggle="modal" data-bs-target="#specialityModal">Add Speciality</button>
							<!-- Modal button -->
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
							<p>Paragraph to write a description about this card.</p>
						</div>
						<textarea rows="4" cols="3" placeholder="Write something"></textarea>
						<a class="btn btn-dark" href="">Go </a>
					</div>
				</div>
				<div class="col-md-4">
					<div class="card card-shadow">
						<div class="card-body">
							<small>Small letters to give a hint about something.</small>
							<p>Paragraph to write a description about this card.</p>
						</div>
						<textarea rows="4" cols="3" placeholder="Write something"></textarea>
						<a class="btn btn-dark" href="">Go </a>
					</div>
				</div>
				<div class="col-md-4">
					<div class="card card-shadow">
						<div class="card-body">
							<small>Small letters to give a hint about something.</small>
							<p>Paragraph to write a description about this card.</p>
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
							<p>Paragraph to write a description about this card.</p>
						</div>
						<textarea rows="4" cols="3" placeholder="Write something"></textarea>
						<a class="btn btn-dark" href="">Go </a>
					</div>
				</div>
				<div class="col-md-4">
					<div class="card card-shadow">
						<div class="card-body">
							<small>Small letters to give a hint about something.</small>
							<p>Paragraph to write a description about this card.</p>
						</div>
						<textarea rows="4" cols="3" placeholder="Write something"></textarea>
						<a class="btn btn-dark" href="">Go </a>
					</div>
				</div>
				<div class="col-md-4">
					<div class="card card-shadow">
						<div class="card-body">
							<small>Small letters to give a hint about something.</small>
							<p>Paragraph to write a description about this card.</p>
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
							<p>Paragraph to write a description about this card.</p>
						</div>
						<textarea rows="4" cols="3" placeholder="Write something"></textarea>
						<a class="btn btn-dark" href="">Go </a>
					</div>
				</div>
				<div class="col-md-4">
					<div class="card card-shadow">
						<div class="card-body">
							<small>Small letters to give a hint about something.</small>
							<p>Paragraph to write a description about this card.</p>
						</div>
						<textarea rows="4" cols="3" placeholder="Write something"></textarea>
						<a class="btn btn-dark" href="">Go </a>
					</div>
				</div>
				<div class="col-md-4">
					<div class="card card-shadow">
						<div class="card-body">
							<small>Small letters to give a hint about something.</small>
							<p>Paragraph to write a description about this card.</p>
						</div>
						<textarea rows="4" cols="3" placeholder="Write something"></textarea>
						<a class="btn btn-dark" href="">Go </a>
					</div>
				</div>
			</div>
			<!-- Hospital Records -->
		</div>
		<!--=========================== cards =========================== -->
		<!-- Modals -->
		<!-- Add Speciality Modal -->
		<div class="modal fade" id="specialityModal" tabindex="-1" aria-labelledby="specialityModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="specialityModalLabel">Add Speciality</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<form action="${ctxp}/HMS/addSpeciality" method="post">
							<input class="col-md-12" type="text" name="speciality" placeholder="Cardiology, Urology, Neurology something like that">
							<button type="submit" class="btn btn-primary d-flex mx-auto mt-4">Add</button>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
		<!-- Add Speciality Modal Ends -->
		<!-- CountUser Modal -->
		<div class="modal fade" id="countUserModal" tabindex="-1" aria-labelledby="countUserModalLabel" aria-hidden="false">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="countUserModalLabel">User Count</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body text-dark">${countResult}</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
		<!-- CountUser Modal Ends-->
		<!-- CRUD_Doctor Modal -->
		<div class="modal fade" id="crudDoctorModal" tabindex="-1" aria-labelledby="crudDoctorModalLabel" aria-hidden="false">
			<div class="modal-dialog modal-xl rounded-lg">
				<div class="modal-content">
					<div class="modal-header d-flex">
						<div class="col-11 text-center">
							<p class="modal-title mx-auto fs-3" id="crudDoctorModalLabel">CRUD Operations on Doctor Entities</p>
						</div>
						<div class="col-1 text-center">
							<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						</div>
					</div>
					<div class="modal-body text-dark"><%@include file="../../components/modal-templates/doctor-modal-page.jsp"%></div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
		<!-- CRUD_Doctor Modal Ends-->
		<!-- FooterMenu -->
		<div class="container-fluid mp-0 bg-dark text-light p-2 mx-auto my-auto">
			<div class="row border-top p-5">
				<p class="text-center d-flex my-auto">
					<span class="rounded-circle p-2 mx-auto">
						<a class="btn border nav-item m-2" href="facebook.com"><i class="fa-brands fa-facebook fs-3 text-light"></i> </a>
					</span>
					<br>
					<span class="rounded-circle p-2 mx-auto">
						<a class="btn border shadow nav-item m-2" href="youtube.com"><i class="fa-brands fa-youtube fs-3 text-light"></i> </a>
					</span>
					<span class="rounded-circle p-2 mx-auto">
						<a class="btn border shadow nav-item m-2" href="instagram.com"><i class="fa-brands fa-instagram fs-3 text-light"></i> </a>
					</span>
					<span class="rounded-circle p-2 mx-auto">
						<a class="btn border shadow nav-item m-2" href="t.me"><i class="fa-brands fa-telegram fs-3 text-light"></i> </a>
					</span>
				</p>
			</div>
			<div class="container border">
				<div class="row mt-5 clearfix">
					<div class="col-5 floatleft mt-5">
						<div class="mx-auto">
							<span class="mt-5">
								<img src="../images/crimson-star.png" alt="crimson-star" width="110">
							</span>
							<span class="mt-5">
								<img src="../images/crimson-star.png" alt="crimson-star" width="110">
							</span>
							<span class="mt-5">
								<img src="../images/crimson-star.png" alt="crimson-star" width="110">
							</span>
							<div class="jumbotron text-left mt-5 mx-5">
								<p class="fs-2">Hi!, I'm ${name}</p>
							</div>
						</div>
					</div>
					<div class="col-2 mx-auto my-auto">
						<img class="img-fluid mx-auto my-auto" src="../images/three-star.png" alt="three-star" width="110">
					</div>
					<%@include file="/components/avatar.jsp"%>
					<!--  col-5-->
				</div>
				<div class="row mt-5 clearfix my-auto d-flex">
					<div class="jumbotron mt-2">
						<p class="fs-1 caption text-light text-center">
							<span class="fs-3">The greatest glory in living lies not in never falling, but in rising every time we fall.</span>
							<br> - Nelson Mandela
						</p>
						<p class="fs-3 caption text-info text-center">If you are visiting this page, that means either you've hacked into this website or you have acquired the administrative priviledges of this website somehow. Whichever applies to you, all I want is to request you to behave responsibly.</p>
						<p class="fs-5 caption text-secondary text-center">Thanks! for visiting.</p>
					</div>
				</div>
			</div>
		</div>
		<!-- Count User Modal Ends -->
		<!-- Modals -->
		
		<!-- ==============================quicklinks============================== -->
		<%@include file="/components/quicklinks.jsp"%>
		<!-- ==============================quicklinks============================== -->
	</c:if>
		<!--=========================== footer =========================== -->
		<%@include file="/components/footer.jsp"%>
		<!--=========================== footer =========================== -->
		<!--=========================== scripts =========================== -->
		<%@include file="/components/allscripts.jsp"%>
		<!--=========================== scripts =========================== -->
		<c:remove var="response" scope="session" />

	<c:if test="${empty adminObj}">
		<c:redirect url="../index.jsp"></c:redirect>
	</c:if>
</body>
</html>