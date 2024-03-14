<%@page import="com.ml.db.DatabaseConfiguration"%>
<%@page import="com.ml.dao.DoctorDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../components/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="../components/allcss.jsp"%>
<title>Doctors' Dashboard</title>
</head>
<body>
	<%
	DoctorDao ddao = new DoctorDao(DatabaseConfiguration.getMySQLConnection());
	session = request.getSession();
	session.getAttribute("doctorObj");
	%>
	<header>
		<%@include file="../components/navbar.jsp"%>
	</header>
	<div id="map">
		<c:if test="${not empty doctorObj}">
			<span class="text-center bg-dark text-primary p-1 mt-0 position-absolute">${response}<c:if test="${empty response}">${doctorObj.getName()}</c:if>
			</span>
		</c:if>
		<c:remove var="response" scope="session" />
	</div>
	<div class="container-fluid m-0 p-0 overflow-hidden">
		<c:if test="${not empty doctorObj}">
			<div class="container-fluid">
				<div class="container">
					<p class="text-center p-2 m-2 fs-2">${doctorObj.name}'sDashboard</p>
					<div class="row mt-5">
						<div class="col-md-4">
							<div class="card shadow">
								<div class="card-body">
									<p class="text-center p-2 fs-4">
										Appointments Today <i class="fa-solid fa-calendar-check"></i>
									</p>
									<table class="table table-hover table-dark">
										<thead>
											<tr>
												<th scope="col">#</th>
												<th scope="col">First</th>
												<th scope="col">Last</th>
												<th scope="col">Handle</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<th scope="row">1</th>
												<td>Mark</td>
												<td>Otto</td>
												<td>@mdo</td>
											</tr>
											<tr>
												<th scope="row">2</th>
												<td>Jacob</td>
												<td>Thornton</td>
												<td>@fat</td>
											</tr>
											<tr>
												<th scope="row">3</th>
												<td colspan="2">Larry the Bird</td>
												<td>@twitter</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="card shadow">
								<div class="card-body">
									<p class="text-center p-2 fs-4">
										Reports To Be Reviewed <i class="fa-solid fa-file"></i>
									</p>
									<table class="table table-hover table-dark">
										<thead>
											<tr>
												<th scope="col">#</th>
												<th scope="col">First</th>
												<th scope="col">Last</th>
												<th scope="col">Handle</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<th scope="row">1</th>
												<td>Mark</td>
												<td>Otto</td>
												<td>@mdo</td>
											</tr>
											<tr>
												<th scope="row">2</th>
												<td>Jacob</td>
												<td>Thornton</td>
												<td>@fat</td>
											</tr>
											<tr>
												<th scope="row">3</th>
												<td colspan="2">Larry the Bird</td>
												<td>@twitter</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="card shadow">
								<div class="card-body">
									<p class="text-center p-2 fs-4">
										Meetings <i class="fa-solid fa-handshake"></i>
									</p>
									<table class="table table-hover table-dark">
										<thead>
											<tr>
												<th scope="col">#</th>
												<th scope="col">First</th>
												<th scope="col">Last</th>
												<th scope="col">Handle</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<th scope="row">1</th>
												<td>Mark</td>
												<td>Otto</td>
												<td>@mdo</td>
											</tr>
											<tr>
												<th scope="row">2</th>
												<td>Jacob</td>
												<td>Thornton</td>
												<td>@fat</td>
											</tr>
											<tr>
												<th scope="row">3</th>
												<td colspan="2">Larry the Bird</td>
												<td>@twitter</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="container mt-5">
					<header class="m-4 p-4">
						<p class="fs-3 text-center">Slide container heading</p>
					</header>
					<div class="row">
						<div class="col-md-4 card-col">
							<div class="myCard">
								<div class="myCardBody">
									<div class="card-holder">
										<img class="card-image" src="../images/blue-card.png" width="350">
										<p class="card-image-info">I'm card info. You can write something about me here. Like what sort of information am I supposed to provide and all. I'm card info. You can write something about me here. Like what sort of information am I supposed to provide and all. I'm card info. You can write something about me here. Like what sort of information am I supposed to provide and all.</p>
									</div>
									<p class="cardNavBar text-center">
										<span class="card-bt bt-bg-black">
											<a href="">Add</a>
										</span>
										<span class="card-bt bt-bg-black">
											<a href="">Edit</a>
										</span>
									</p>
								</div>
							</div>
						</div>
						<div class="col-md-4 card-col">
							<div class="myCard">
								<div class="myCardBody">
									<div class="card-holder">
										<img class="card-image" src="../images/blue-card.png" width="350">
										<p class="card-image-info">I'm card info. You can write something about me here. Like what sort of information am I supposed to provide and all. I'm card info. You can write something about me here. Like what sort of information am I supposed to provide and all. I'm card info. You can write something about me here. Like what sort of information am I supposed to provide and all.</p>
									</div>
									<p class="cardNavBar cardNavBar-cc text-center">
										<span class="card-bt bt-bg-black bt-red">
											<a href="">Add</a>
										</span>
										<span class="card-bt bt-bg-black bt-green">
											<a href="">Edit</a>
										</span>
									</p>
								</div>
							</div>
						</div>
						<div class="col-md-4 card-col">
							<div class="myCard">
								<div class="myCardBody">
									<div class="card-holder">
										<img class="card-image" src="../images/blue-card.png" width="350">
										<p class="card-image-info">I'm card info. You can write something about me here. Like what sort of information am I supposed to provide and all. I'm card info. You can write something about me here. Like what sort of information am I supposed to provide and all. I'm card info. You can write something about me here. Like what sort of information am I supposed to provide and all.</p>
									</div>
									<p class="cardNavBar text-center">
										<span class="card-bt bt-bg-black">
											<a href="">Add</a>
										</span>
										<span class="card-bt bt-bg-black">
											<a href="">Edit</a>
										</span>
									</p>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-4 card-col">
							<div class="myCard">
								<div class="myCardBody">
									<div class="card-holder">
										<img class="card-image" src="../images/blue-card.png" width="350">
										<p class="card-image-info">I'm card info. You can write something about me here. Like what sort of information am I supposed to provide and all. I'm card info. You can write something about me here. Like what sort of information am I supposed to provide and all. I'm card info. You can write something about me here. Like what sort of information am I supposed to provide and all.</p>
									</div>
									<p class="cardNavBar text-center">
										<span class="card-bt bt-bg-black">
											<a href="">Add</a>
										</span>
										<span class="card-bt bt-bg-black">
											<a href="">Edit</a>
										</span>
									</p>
								</div>
							</div>
						</div>
						<div class="col-md-4 card-col">
							<div class="myCard">
								<div class="myCardBody">
									<div class="card-holder">
										<img class="card-image" src="../images/blue-card.png" width="350">
										<p class="card-image-info">I'm card info. You can write something about me here. Like what sort of information am I supposed to provide and all. I'm card info. You can write something about me here. Like what sort of information am I supposed to provide and all. I'm card info. You can write something about me here. Like what sort of information am I supposed to provide and all.</p>
									</div>
									<p class="cardNavBar cardNavBar-cc text-center">
										<span class="card-bt bt-bg-black">
											<a href="">Add</a>
										</span>
										<span class="card-bt bt-bg-black">
											<a href="">Edit</a>
										</span>
									</p>
								</div>
							</div>
						</div>
						<div class="col-md-4 card-col">
							<div class="myCard">
								<div class="myCardBody">
									<div class="card-holder">
										<img class="card-image" src="../images/blue-card.png" width="350">
										<p class="card-image-info">I'm card info. You can write something about me here. Like what sort of information am I supposed to provide and all. I'm card info. You can write something about me here. Like what sort of information am I supposed to provide and all. I'm card info. You can write something about me here. Like what sort of information am I supposed to provide and all.</p>
									</div>
									<p class="cardNavBar text-center">
										<span class="card-bt bt-bg-black">
											<a href="">Add</a>
										</span>
										<span class="card-bt bt-bg-black">
											<a href="">Edit</a>
										</span>
									</p>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-4 card-col">
							<div class="myCard">
								<div class="myCardBody">
									<div class="card-holder">
										<img class="card-image" src="../images/blue-card.png" width="350">
										<p class="card-image-info">I'm card info. You can write something about me here. Like what sort of information am I supposed to provide and all. I'm card info. You can write something about me here. Like what sort of information am I supposed to provide and all. I'm card info. You can write something about me here. Like what sort of information am I supposed to provide and all.</p>
									</div>
									<p class="cardNavBar text-center">
										<span class="card-bt bt-bg-black">
											<a href="">Add</a>
										</span>
										<span class="card-bt bt-bg-black">
											<a href="">Edit</a>
										</span>
									</p>
								</div>
							</div>
						</div>
						<div class="col-md-4 card-col">
							<div class="myCard">
								<div class="myCardBody">
									<div class="card-holder">
										<img class="card-image" src="../images/blue-card.png" width="350">
										<p class="card-image-info">I'm card info. You can write something about me here. Like what sort of information am I supposed to provide and all. I'm card info. You can write something about me here. Like what sort of information am I supposed to provide and all. I'm card info. You can write something about me here. Like what sort of information am I supposed to provide and all.</p>
									</div>
									<p class="cardNavBar cardNavBar-cc text-center">
										<span class="card-bt bt-bg-black">
											<a href="">Add</a>
										</span>
										<span class="card-bt bt-bg-black">
											<a href="">Edit</a>
										</span>
									</p>
								</div>
							</div>
						</div>
						<div class="col-md-4 card-col">
							<div class="myCard">
								<div class="myCardBody">
									<div class="card-holder">
										<img class="card-image" src="../images/blue-card.png" width="350">
										<p class="card-image-info">I'm card info. You can write something about me here. Like what sort of information am I supposed to provide and all. I'm card info. You can write something about me here. Like what sort of information am I supposed to provide and all. I'm card info. You can write something about me here. Like what sort of information am I supposed to provide and all.</p>
									</div>
									<p class="cardNavBar text-center">
										<span class="card-bt bt-bg-black">
											<a href="">Add</a>
										</span>
										<span class="card-bt bt-bg-black">
											<a href="">Edit</a>
										</span>
									</p>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-4 card-col">
							<div class="myCard">
								<div class="myCardBody">
									<div class="card-holder">
										<img class="card-image" src="../images/blue-card.png" width="350">
										<p class="card-image-info">I'm card info. You can write something about me here. Like what sort of information am I supposed to provide and all. I'm card info. You can write something about me here. Like what sort of information am I supposed to provide and all. I'm card info. You can write something about me here. Like what sort of information am I supposed to provide and all.</p>
									</div>
									<p class="cardNavBar text-center">
										<span class="card-bt bt-bg-black">
											<a href="">Add</a>
										</span>
										<span class="card-bt bt-bg-black">
											<a href="">Edit</a>
										</span>
									</p>
								</div>
							</div>
						</div>
						<div class="col-md-4 card-col">
							<div class="myCard">
								<div class="myCardBody">
									<div class="card-holder">
										<img class="card-image" src="../images/blue-card.png" width="350">
										<p class="card-image-info">I'm card info. You can write something about me here. Like what sort of information am I supposed to provide and all. I'm card info. You can write something about me here. Like what sort of information am I supposed to provide and all. I'm card info. You can write something about me here. Like what sort of information am I supposed to provide and all.</p>
									</div>
									<p class="cardNavBar cardNavBar-cc text-center">
										<span class="card-bt bt-bg-black">
											<a href="">Add</a>
										</span>
										<span class="card-bt bt-bg-black">
											<a href="">Edit</a>
										</span>
									</p>
								</div>
							</div>
						</div>
						<div class="col-md-4 card-col">
							<div class="myCard">
								<div class="myCardBody">
									<div class="card-holder">
										<img class="card-image" src="../images/blue-card.png" width="350">
										<p class="card-image-info">I'm card info. You can write something about me here. Like what sort of information am I supposed to provide and all. I'm card info. You can write something about me here. Like what sort of information am I supposed to provide and all. I'm card info. You can write something about me here. Like what sort of information am I supposed to provide and all.</p>
									</div>
									<p class="cardNavBar text-center">
										<span class="card-bt bt-bg-black">
											<a href="">Add</a>
										</span>
										<span class="card-bt bt-bg-black">
											<a href="">Edit</a>
										</span>
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="container-fluid" id="footer-block">
				<div class="container" id="footer-block-container-1">
					<div class="row mt-5 clearfix d-flex" id="social-liks">
						<div class="col-4 floatleft nav navbar">
							<ul class="navbar-nav ms-auto mb-2 mb-lg-0 d-block">
								<li class="nav-item d-inline">
									<a class="nav-link text-light m-2 p-2 d-inline-block btn bg-success px-4" href="#">News</a>
								</li>
								<li class="nav-item d-inline">
									<a class="nav-link text-light m-2 p-2 d-inline-block btn bg-success px-4" href="#">Media</a>
								</li>
								<li class="nav-item d-inline">
									<a class="nav-link text-light m-2 p-2 d-inline-block btn bg-success" href="#">Press Release</a>
								</li>
							</ul>
							<hr>
						</div>
						<div class="col-4 mx-auto nav navbar">
							<ul class="navbar-nav ms-auto mb-2 mb-lg-0 d-block">
								<li class="nav-item d-inline">
									<a class="nav-link text-light m-2 p-2 d-inline-block btn bg-danger px-4" href="#">Home</a>
								</li>
								<li class="nav-item d-inline">
									<a class="nav-link text-light m-2 p-2 d-inline-block btn bg-danger px-4" href="#">About</a>
								</li>
								<li class="nav-item d-inline">
									<a class="nav-link text-light m-2 p-2 d-inline-block btn bg-danger" href="#">Contacts</a>
								</li>
							</ul>
							<hr>
						</div>
						<div class="col-4 mt-5 mb-5 text-center">
							<span class="circle p-5 mx-auto" id="icon-r-1">
								<a class="btn border shadow nav-item" href="facebook.com"><i class="fa-brands fa-facebook fs-3 text-light"></i> </a>
							</span>
							<br>
							<span class="circle p-5 mx-auto">
								<a class="btn border shadow nav-item" href="facebook.com"><i class="fa-brands fa-facebook fs-3 text-light"></i> </a>
							</span>
							<span class="circle p-5">
								<a class="btn border shadow nav-item" href="facebook.com"><i class="fa-brands fa-instagram fs-3 text-light"></i> </a>
							</span>
							<span class="circle p-5">
								<a class="btn border shadow nav-item" href="facebook.com"><i class="fa-brands fa-telegram fs-3 text-light"></i> </a>
							</span>
						</div>
					</div>
					<div class="container" id="footer-block-container-2">
						<hr>
						<div class="row mt-5 clearfix my-auto d-flex">
							<div class="col-5 floatleft mt-5">
								<div class="mt-5">
									<span class="mt-5">
										<img src="../images/crimson-star.png" alt="crimson-star" width="110">
									</span>
									<span class="mt-5">
										<img src="../images/crimson-star.png" alt="crimson-star" width="110">
									</span>
									<span class="mt-5">
										<img src="../images/crimson-star.png" alt="crimson-star" width="110">
									</span>
								</div>
								<div class="mt-5">
									<p class="mt-5 fs-4 text-center">I am a set of crimson-red-star and here by my side, it's an avatar-frame.</p>
								</div>
							</div>
							<div class="mx-auto col-2"></div>
							<div class="col-5 my-auto mx-auto rounded-circle floatright d-flex">
								<img class="img-fluid rounded-circle position-absolute px-5 shadow" id="avatar-frame" src="../images/avatar-frame.png" alt="avatar-frame" width="400"> <img class="img-fluid position-relative rounded-circle" id="avatarfoot" alt="avatar" src="../images/dpwbg.png">
							</div>
						</div>
						<hr>
						<div class="row mt-5 clearfix">
							<div class="col floatleft">
								<p>jhvbqhjdbvlhedbvjdbkjvdkjvkjvkjdvkjdvkjndkjvnjkdfnvkjdnkjdnvkjnfxvkj</p>
								<p>jhvbqhjdbvlhedbvjdbkjvdkjvkjvkjdvkjdvkjndkjvnjkdfnvkjdnkjdnvkjnfxvkj</p>
								<p>jhvbqhjdbvlhedbvjdbkjvdkjvkjvkjdvkjdvkjndkjvnjkdfnvkjdnkjdnvkjnfxvkj</p>
								<p>jhvbqhjdbvlhedbvjdbkjvdkjvkjvkjdvkjdvkjndkjvnjkdfnvkjdnkjdnvkjnfxvkj</p>
								<p>jhvbqhjdbvlhedbvjdbkjvdkjvkjvkjdvkjdvkjndkjvnjkdfnvkjdnkjdnvkjnfxvkj</p>
							</div>
							<div class="col floatright">
								<p>jhvbqhjdbvlhedbvjdbkjvdkjvkjvkjdvkjdvkjndkjvnjkdfnvkjdnkjdnvkjnfxvkj</p>
								<p>jhvbqhjdbvlhedbvjdbkjvdkjvkjvkjdvkjdvkjndkjvnjkdfnvkjdnkjdnvkjnfxvkj</p>
								<p>jhvbqhjdbvlhedbvjdbkjvdkjvkjvkjdvkjdvkjndkjvnjkdfnvkjdnkjdnvkjnfxvkj</p>
								<p>jhvbqhjdbvlhedbvjdbkjvdkjvkjvkjdvkjdvkjndkjvnjkdfnvkjdnkjdnvkjnfxvkj</p>
								<p>jhvbqhjdbvlhedbvjdbkjvdkjvkjvkjdvkjdvkjndkjvnjkdfnvkjdnkjdnvkjnfxvkj</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- ==============================quicklinks============================== -->
			<%@include file="/components/quicklinks.jsp"%>
			<!-- ==============================quicklinks============================== -->
			<!--=========================== footer =========================== -->
			<%@include file="../components/footer.jsp"%>
			<!--=========================== footer =========================== -->
	</div>
	<%@include file="../components/allscripts.jsp"%>
	</c:if>
	<c:if test="${empty doctorObj}">
		<c:redirect url="${ctxp}/HMS/doctor-login.jsp" />
	</c:if>
</body>
</html>