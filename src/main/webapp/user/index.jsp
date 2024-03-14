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
<script src="https://apis.mappls.com/advancedmaps/api/6a73c01e8dadfeb929c4fd9913cbfa58/map_sdk?v=3.0&layer=vector&callback=initMap" defer async></script>
<style>
html, body, #map {
	margin: 0;
	padding: 0;
	width: 100%;
	height: 100%;
}
</style>
<meta charset="UTF-8">
<title>${userObj.name}</title>
</head>
<body>
	<%
	//UserDao u = new UserDao(DatabaseConfiguration.getMySQLConnection());
	session.getAttribute("userObj");
	%>
	<c:if test="${empty userObj}">
		<c:redirect url="../index.jsp"></c:redirect>
	</c:if>
	<script type="text/javascript">
		
	</script>
	<!-- ========================================Header======================================== -->
	<header><%@include file="../components/navbar.jsp"%></header>
	<!-- ========================================Header======================================== -->
	<c:if test="${not empty userObj}">
		<!-- ======================================== Response Header======================================== -->
		<!-- ======================================== Response Header======================================== -->
		<div id="map">
			<!-- <div class="container-fluid p-0 mx-auto" id="myResponseHeader"> -->
				<span class="text-center bg-dark text-primary p-1 mt-0 position-absolute">${response}
				<c:if test="${empty response}">${userObj.getName()}</c:if>
				</span>
				<!-- Response on top -->
				<%-- 				<div class="alert alert-success alert-dismissible fade show text-center" role="alert">
					${response}
					<c:if test="${empty response}">
						<strong>${userObj.name}</strong>
					</c:if>
					<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
				</div> --%>
				<!-- Response on top -->
				<!--<script type="text/javascript">
	serverResp();
	</script> -->
				<c:remove var="response" scope="session" />
		</div>
		<!--==============================Carousal Begins==============================-->
<!-- 		<div class="carousel-container">
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
		</div> -->
		<!--==============================Carousal Ends==============================-->
		<!-- CRUD_Appointment Modal -->
		<div class="modal fade" id="crudAppointmentModal" tabindex="-1" aria-labelledby="crudAppointmentModalLabel" aria-hidden="false">
			<div class="modal-dialog modal-xl rounded-lg">
				<div class="modal-content">
					<div class="modal-header d-flex">
						<div class="col-11 text-center">
							<p class="modal-title mx-auto fs-3" id="crudAppointmentModalLabel">CRUD Appointment</p>
						</div>
						<div class="col-1 text-center">
							<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						</div>
					</div>
					<div class="modal-body text-dark"><%@include file="../../components/modal-templates/appointment-modal-page.jsp"%></div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
		<!-- CRUD_Appointment Modal Ends-->
		<!-- Status Modal -->
		<div class="modal fade" id="patientStatusModal" tabindex="-1" aria-labelledby="patientStatusModalLabel" aria-hidden="false">
			<div class="modal-dialog modal-sm rounded-lg">
				<div class="modal-content">
					<div class="modal-header d-flex">
						<div class="col-11 text-center">
							<p class="modal-title mx-auto fs-3" id="patientStatusModalLabel">Patient Status</p>
						</div>
						<div class="col-1 text-center">
							<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						</div>
					</div>
					<div class="modal-body text-dark text-center">
						<span class="p-2 m-2">${schAptResp}</span>
						<span class="p-2 m-2">${schStatus}</span>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
		<!-- Status Modal -->
		<!--=========================== cards =========================== -->
		<hr>
		<div class="container p-3">
			<p class="text-center fs-3" id="dasbrd">Dashboard</p>
			<hr>
			<div class="row">
				<div class="col-md-6">
					<div class="card card-shadow">
						<div class="card-body">
							<b class="fs-6">User Details</b>
							<hr>
							<small class="card-caption">I'll write something about this card in future.</small>
							<div class="row d-flex">
								<div class="col-md-4 mt-2 avatar p-2">
									<img class="rounded-circle img-fluid mx-auto my-auto position-relative" src="../images/avatar-frame.png" alt="" width="120" height="120"> <img class="rounded-circle position-absolute" src="../images/${userObj.getImage()}" alt="" width="120" height="120" style="margin-left: -120px; z-index: -1;">
								</div>
								<div class="col-md-8 mt-2">
									<div class="row p-1 h6">
										<small class="col-md-4">Name:</small>
										<small class="col-md-8"> ${userObj.name} </small>
									</div>
									<div class="row p-1 h6">
										<small class="col-md-4">Email:</small>
										<small class="col-md-8"> ${userObj.email} </small>
									</div>
									<div class="row p-1 h6">
										<small class="col-md-4">DOB:</small>
										<small class="col-md-8"> ${userObj.dob} </small>
									</div>
									<div class="row p-1 h6">
										<small class="col-md-4">Phone:</small>
										<small class="col-md-8"> ${userObj.phone} </small>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="card card-shadow">
						<div class="card-body">
							<p class="text-center fs-5 border-bottom">Appointments</p>
							<p class="text-center">
								<button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#crudAppointmentModal">Book An Appointment</button>
								<!-- <button type="button" class="btn btn-secondary my-2" data-bs-toggle="modal" data-bs-target="#patientStatusModal">Check Status</button> -->
							</p>
						</div>
					</div>
					<div class="card card-shadow">
						<div class="card-body">
							<p class="text-center fs-5 border-bottom">Status</p>
							<p class="text-center">
								<c:if test="${not empty schStatus}">
								${schStatus}
								</c:if>
								<c:if test="${empty schStatus}">
								You have not scheduled any appointment yet.
								</c:if>
							</p>
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
</body>
</html>