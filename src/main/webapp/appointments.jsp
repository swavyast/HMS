<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="components/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="components/allcss.jsp"%>
<title>Book An Appointment</title>
</head>
<body>
	<header>
		<%@include file="components/navbar.jsp"%>
	</header>
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
					<div class="modal-body text-dark"><%@include file="components/modal-templates/appointment-modal-page.jsp"%></div>
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
					<div class="modal-body text-dark text-center"><span class="p-2 m-2">${schAptResp}</span><span class="p-2 m-2">${schStatus}</span></div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
		<!-- Status Modal -->
	<main role="main">
		<section class="jumbotron text-center">
			<div class="container">
				<h1 class="jumbotron-heading">Appointments</h1>
				<p class="lead text-muted">OPD Appointments can be booked from window only. <i class="fa-solid fa-minus p-0 m-0"></i> This portal is meant to serve only IPD patients.</p>
				<p>
					<button type="button" class="btn btn-success my-2" data-bs-toggle="modal" data-bs-target="#crudAppointmentModal">Book An Appointment</button>
					<button type="button" class="btn btn-secondary my-2" data-bs-toggle="modal" data-bs-target="#patientStatusModal">Check Status</button>
				</p>
			</div>
		</section>
		<div class="album py-5 bg-light">
			<div class="container">
				<div class="row">
					<div class="col-md-4">
						<div class="card mb-4 box-shadow">
							<img class="card-img" alt="Card image cap" src="images/chimpmail.png">
							<div class="card-body">
								<p class="card-text">Dr. X is serving their 6th patient today.</p>
								<div class="d-flex justify-content-between align-items-center">
									<div class="btn-group">
										<button type="button" class="btn btn-sm btn-outline-secondary">View</button>
										<button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
									</div>
									<small class="text-muted">9 mins</small>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="card mb-4 box-shadow">
							<img class="card-img" alt="Card image cap" src="images/chimpmail.png">
							<div class="card-body">
								<p class="card-text">Dr. X is serving their 6th patient today.</p>
								<div class="d-flex justify-content-between align-items-center">
									<div class="btn-group">
										<button type="button" class="btn btn-sm btn-outline-secondary">View</button>
										<button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
									</div>
									<small class="text-muted">9 mins</small>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="card mb-4 box-shadow">
							<img class="card-img" alt="Card image cap" src="images/chimpmail.png">
							<div class="card-body">
								<p class="card-text">Dr. X is serving their 6th patient today.</p>
								<div class="d-flex justify-content-between align-items-center">
									<div class="btn-group">
										<button type="button" class="btn btn-sm btn-outline-secondary">View</button>
										<button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
									</div>
									<small class="text-muted">9 mins</small>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="card mb-4 box-shadow">
							<img class="card-img" alt="Card image cap" src="images/chimpmail.png">
							<div class="card-body">
								<p class="card-text">Dr. X is serving their 6th patient today.</p>
								<div class="d-flex justify-content-between align-items-center">
									<div class="btn-group">
										<button type="button" class="btn btn-sm btn-outline-secondary">View</button>
										<button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
									</div>
									<small class="text-muted">9 mins</small>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="card mb-4 box-shadow">
							<img class="card-img" alt="Card image cap" src="images/chimpmail.png">
							<div class="card-body">
								<p class="card-text">Dr. X is serving their 6th patient today.</p>
								<div class="d-flex justify-content-between align-items-center">
									<div class="btn-group">
										<button type="button" class="btn btn-sm btn-outline-secondary">View</button>
										<button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
									</div>
									<small class="text-muted">9 mins</small>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="card mb-4 box-shadow">
							<img class="card-img" alt="Card image cap" src="images/chimpmail.png">
							<div class="card-body">
								<p class="card-text">Dr. X is serving their 6th patient today.</p>
								<div class="d-flex justify-content-between align-items-center">
									<div class="btn-group">
										<button type="button" class="btn btn-sm btn-outline-secondary">View</button>
										<button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
									</div>
									<small class="text-muted">9 mins</small>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="card mb-4 box-shadow">
							<img class="card-img" alt="Card image cap" src="images/chimpmail.png">
							<div class="card-body">
								<p class="card-text">Dr. X is serving their 6th patient today.</p>
								<div class="d-flex justify-content-between align-items-center">
									<div class="btn-group">
										<button type="button" class="btn btn-sm btn-outline-secondary">View</button>
										<button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
									</div>
									<small class="text-muted">9 mins</small>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="card mb-4 box-shadow">
							<img class="card-img" alt="Card image cap" src="images/chimpmail.png">
							<div class="card-body">
								<p class="card-text">Dr. X is serving their 6th patient today.</p>
								<div class="d-flex justify-content-between align-items-center">
									<div class="btn-group">
										<button type="button" class="btn btn-sm btn-outline-secondary">View</button>
										<button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
									</div>
									<small class="text-muted">9 mins</small>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="card mb-4 box-shadow">
							<img class="card-img" alt="Card image cap" src="images/chimpmail.png">
							<div class="card-body">
								<p class="card-text">Dr. X is serving their 6th patient today.</p>
								<div class="d-flex justify-content-between align-items-center">
									<div class="btn-group">
										<button type="button" class="btn btn-sm btn-outline-secondary">View</button>
										<button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
									</div>
									<small class="text-muted">9 mins</small>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>
	<!--=========================== footer =========================== -->
	<%@include file="components/footer.jsp"%>
	<!--=========================== footer =========================== -->
	<%@include file="components/allscripts.jsp"%>
</body>
</html>