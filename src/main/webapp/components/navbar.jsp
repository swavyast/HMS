
<%@page import="com.ml.db.DatabaseConfiguration"%>
<%@page import="com.ml.dao.AdminDao"%>
<%
String path = request.getContextPath(); //contextPath of request
ServletContext ctx = pageContext.getServletContext(); //contextPath of servlet
String ctxp = ctx.getContextPath(); //root
session.getAttribute("doctorObj");
%>
<div id="myScrollSpy">
	<!-- Logout Form -->
	<form action="${ctxp}/HMS/logout" method="post" id="logOutForm" class="d-none"></form>
<!-- 	<script>
		const myBtn = document.getElementById('fetchLogoutBtn')
		myBtn.addEventListener('click', function() {
			document.getElementById('logOutForm').submit()
		})
	</script> -->
	<!-- Logout Form -->
</div>
<nav class="navbar bg-black">
	<div class="container-fluid">
		<a class="navbar-brand text-white me-auto" href="index.jsp"> <i class="fa-regular fa-hospital"></i> MediHome
		</a><%@include file="mailto.jsp"%>
		<%-- Logout Button --%>

		<%-- Logout Button --%>
		<button class="navbar-toggler" type="button" data-bs-theme="dark" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
			<div class="offcanvas-header">
				<h5 class="offcanvas-title" id="offcanvasNavbarLabel">
					<a class="navbar-brand p-2" href="index.jsp"> <i class="fa-regular fa-hospital"></i> MediHome
					</a>
				</h5>
				<button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
			</div>
			<div class="col-sm-6 offset-3 dropdown navbar-nav flex-grow-1 pe-0 mx-auto my-5">
				<c:if test="${not empty userObj}">
				<div class="nav-link my-0 pb-0" type="button" data-bs-toggle="dropdown" aria-expanded="false">
				<div class="border shadow-2xl rounded-xl p-2 mx-auto my-100 w-100">
				<img class="rounded-circle shadow-2xl border col-6 offset-3" src="../images/${userObj.getImage()}" alt="" width="56" height="56" style="z-index:1000;">
				<br><span class="text-primary fs-5 px-1 dropdown-toggle">${userObj.name}</span>
				<br><span class="text-black px-1">${userObj.email}</span>				
				</div>
				</div>
					 
							</c:if>
				<c:if test="${not empty adminObj}">
				<div class="nav-link my-0 pb-0" type="button" data-bs-toggle="dropdown" aria-expanded="false">
				<div class="border shadow-2xl rounded-xl p-2 mx-auto my-100 w-100">
				<img class="rounded-circle shadow-2xl border col-6 offset-3" src="../images/${adminObj.getImage()}" alt="" width="56" height="56" style="z-index:1000;">
				<br><span class="text-primary fs-5 px-1 dropdown-toggle">${adminObj.name}</span>
				<br><span class="text-black px-1">${adminObj.email}</span>				
				</div>
				</div>
							</c:if>
				<c:if test="${not empty doctorObj}">
				<div class="nav-link my-0 pb-0" type="button" data-bs-toggle="dropdown" aria-expanded="false">
				<div class="border shadow-2xl rounded-xl p-2 mx-auto my-100 w-100">
				<img class="rounded-circle shadow-2xl border col-6 offset-3" src="../images/${doctorObj.getImage()}" alt="" width="56" height="56" style="z-index:1000;">
				<br><span class="text-primary fs-5 px-1 dropdown-toggle">${doctorObj.name}</span>
				<br><span class="text-black px-1">${doctorObj.email}</span>				
				</div>
				</div>
				</c:if>
				<c:if test="${empty userObj && empty adminObj && empty doctorObj}">
					<a class="nav-link dropdown-toggle rounded-circle myAnchor" type="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fa-solid fa-user p-3 m-0 border border-danger rounded-circle"></i></a>
				</c:if>
				<ul class="dropdown-menu p-0">
					<c:if test="${empty userObj && empty adminObj && empty doctorObj}">
						<li>
							<a class="dropdown-item" href="${ctxp}/HMS/registration.jsp"><i class="fa-solid fa-user-plus"></i> Register</a>
						</li>
						<li>
							<a class="dropdown-item" href="${ctxp}/HMS/user-login.jsp"><i class="fa-solid fa-power-off"></i> Login</a>
						</li>
						<li>
							<a class="dropdown-item" href="appointments.jsp"><i class="fa-solid fa-calendar-days"></i> Appointment</a>
						</li>
					</c:if>
					<c:if test="${not empty userObj || not empty adminObj || not empty doctorObj}">
						<li>
							<a class="dropdown-item" href="${ctxp}/HMS//profile.jsp"><i class="fa-solid fa-id-card"></i> Profile</a>
						</li>
						<li class="dropdown-item">
							<a class="nav-link" href="#"> <i class="fa-solid fa-file-medical"></i> Reports
							</a>
						</li>
						<li>
							<a class="dropdown-item" href="#"><i class="fa-solid fa-gears"></i> Settings</a>
						</li>
						<li>
							<hr class="dropdown-divider">
						</li>
						<li>
							<button type="submit" class="dropdown-item btn btn-sm bg-danger text-white p-2 m-2 my-auto mb-2 mx-auto rounded-pill text-center w-75" form="logOutForm" id="fetchLogoutBtn">
								<i class="fa-solid fa-power-off"></i> Logout
							</button>
						</li>
					</c:if>
				</ul>
			</div>
			<div class="offcanvas-body border-top mb-5" data-bs-theme="dark">
				<form class="d-flex mt-3" role="search">
					<input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
					<button class="btn btn-outline-success" type="submit">Search</button>
				</form>
				<ul class="navbar-nav justify-content-end flex-grow-1 pe-3 m-1 p-1">
					<c:if test="${empty userObj && empty adminObj && empty doctorObj}">
						<li class="nav-item active">
							<a class="nav-link active" aria-current="page" href="${ctxp}/HMS/index.jsp"><i class="fa-solid fa-archway"></i> HOME </a>
						</li>
						<li class="nav-item">
							<a class="nav-link" aria-current="page" href="${ctxp}/HMS/admin-login.jsp"> <i class="fa-solid fa-right-to-bracket"></i> ADMIN
							</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" aria-current="page" href="${ctxp}/HMS/doctor-login.jsp"> <i class="fa-solid fa-user-doctor"></i> DOCTORS
							</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="${ctxp}/HMS/appointments.jsp"> <i class="fa-solid fa-calendar-days"></i> APPOINTMENTS
							</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="${ctxp}/HMS/user-login.jsp"> <i class="fa-solid fa-hospital-user"></i> USER
							</a>
						</li>
					</c:if>

					<c:if test="${not empty userObj}">
						<li class="nav-item active">
							<a class="nav-link active" aria-current="page" href="${ctxp}/HMS/user/index.jsp"><i class="fa-solid fa-archway"></i> HOME </a>
						</li>
						<li class="nav-item">
							<a class="nav-link bs-danger-rgb bs-danger" href="${ctxp}/HMS/user/profile.jsp?id=${userObj.getId()}"> <i class="fa-solid fa-user-doctor"></i> PROFILE
							</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="${ctxp}/HMS/appointments.jsp"> <i class="fa-solid fa-calendar-days"></i> APPOINTMENTS
							</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="#"> <i class="fa-solid fa-book-medical"></i> HISTORY
							</a>
						</li>
						<li class="nav-item active">
							<a class="nav-link" href="#"> <i class="fa-solid fa-receipt"></i> RECIEPT
							</a>
						</li>
						<li class="nav-item active">
							<a class="nav-link" href="#"> <i class="fa-solid fa-bell-concierge"></i> RECEPTION
							</a>
						</li>
					</c:if>
					<c:if test="${not empty adminObj}">
						<%
						session.getAttribute("name");
						%>
						<li class="nav-item active">
							<a class="nav-link active" aria-current="page" href="${ctxp}/HMS/admin/index.jsp"><i class="fa-solid fa-archway"></i> HOME </a>
						</li>
						<li class="nav-item">
							<a class="nav-link bs-danger-rgb bs-danger" href="${ctxp}/HMS/admin/profile.jsp?id=${adminObj.getAdid()}"> <i class="fa-solid fa-user-doctor"></i> PROFILE
							</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="${ctxp}/HMS/admin/doctors.jsp"> <i class="fa-solid fa-user-doctor"></i> DOCTORS
							</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="${ctxp}/HMS/appointments.jsp"> <i class="fa-solid fa-calendar-days"></i> APPOINTMENTS
							</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="${ctxp}/HMS/user-login.jsp"> <i class="fa-solid fa-hospital-user"></i> USER
							</a>
						</li>
						<li>
							<button type="submit" class="dropdown-item btn btn-sm bg-danger text-white p-2 m-2  mx-auto rounded-pill text-center w-75" form="logoutForm">
								<i class="fa-solid fa-power-off"></i> Logout
							</button>
						</li>
					</c:if>
					<c:if test="${not empty doctorObj}">
						<li class="nav-item active">
							<a class="nav-link active" aria-current="page" href="${ctxp}/HMS/doctor/index.jsp"><i class="fa-solid fa-archway"></i> HOME </a>
						</li>
						<li class="nav-item">
							<a class="nav-link bs-danger-rgb bs-danger" href="${ctxp}/HMS/doctor/profile.jsp?id=${doctorObj.getId()}"> <i class="fa-solid fa-user-doctor"></i> PROFILE
							</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="${ctxp}/HMS/appointments.jsp"> <i class="fa-solid fa-calendar-days"></i> APPOINTMENTS
							</a>
						</li>
					</c:if>
				</ul>
			</div>
		</div>
	</div>
</nav>