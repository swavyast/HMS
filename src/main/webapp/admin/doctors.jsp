<%@page import="java.util.Date"%>
<%@page import="com.ml.entity.Doctor"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.ml.dao.DoctorDao"%>
<%@page import="com.ml.entity.Speciality"%>
<%@page import="java.util.List"%>
<%@page import="com.ml.db.DatabaseConfiguration"%>
<%@page import="com.ml.dao.SpecialityDao"%>
<%@include file="../components/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../components/allcss.jsp"%>
<title>MediHome Doctors</title>
</head>
<body style="margin-bottom : 60px;">
	<%
	DoctorDao ddao = new DoctorDao(DatabaseConfiguration.getMySQLConnection());
	session = request.getSession();
	session.getAttribute("addDoctorResp");
	%>
	<c:if test="${empty adminObj}">
	<c:redirect url="${ctxp}/admin-login.jsp" />
	</c:if>
	<header>
		<%@include file="../components/navbar.jsp"%>
	</header>
	<div class="container-fluid" style="margin-top:50px;">
		<c:if test="${not empty addDoctorResp}">
			<p class="text-center col-md-4 offset-4 bg-dark text-primary p-1 rounded-pill mt-4">${addDoctorResp}</p>
			<!-- FIXME -->
		</c:if>
	</div>
	<div class="container-fluid text-center myjumbo mp-0">
		<div class="jumbotron jumbotron-fluid border shadow-lg m-2 p-2 mx-auto">
			<div class="container">
				<h1 class="display-4">Doctor's Control Panel</h1>
				<div class="card rounded-pill bg-danger">
					<div class="card-body shadow d-flex">
						<p class="col-5 fs-3 me-auto text-info my-auto">
							Query database <i class="fa-solid fa-arrow-right"></i>
						</p>
						<p class="col-7 floatright d-flex ms-auto my-auto">
							<input class="form-control border-2 h-75" value="" name="query" type="text" placeholder="You can search here">
							<a href="${ctxp }/HMS/search" class="nav-link" onclick="query"><i class="fa-solid fa-magnifying-glass bg-secondary shadow-lg shadow-dark rounded-circle  p-2 m-1"></i></a>
						</p>
					</div>
				</div>
				<p class="lead mt-4">This control panel will facilitate operations on doctor entities. Operations such as add a doctor/remove a doctor or fetch a list of all doctors and group them by their departments/speciality etc.</p>
			</div>
		</div>
	</div>
	<div class="container-fluid d-flex p-2">
		<div class="card shadow w-25 m-1 p-1">
			<div class="card-body">
				<form action="${ctxp}/HMS/addDoctor" method="post" enctype="multipart/form-data">
					<header>
						<h2 class="m-3 p-3 text-center">Add Doctor</h2>
					</header>
					<div class="form-group">
						<label class="m-1 p-1" for="name">Name</label>
						<input type="text" class="form-control" id="name" name="name" placeholder="Enter name" required="required">
					</div>
					<div class="form-group">
						<label class="m-1 p-1" for="dob">Date Of Birth</label>
						<input type="date" class="form-control" id="dob" name="dob" required="required">
					</div>
					<div class="form-group">
						<label class="m-1 p-1" for="qual">Qualification</label>
						<input type="Text" class="form-control" id="qual" name="qual" placeholder="Enter qualification">
					</div>
					<div class="form-group">
						<label class="m-1 p-1" for="spclt">Speciality</label>
						<select id="spclt" name="spclt" class="form-control">
							<!-- <optgroup label="optgrp">Select An Option</optgroup> -->
							<option>---Select---</option>
							<%
							SpecialityDao sdao = new SpecialityDao(DatabaseConfiguration.getMySQLConnection());
							List<Speciality> list = sdao.listSpeciality();
							for (Speciality s : list) {
							%>
							<option><%=s.getSp_name()%></option>
							<%
							}
							%>
						</select>
					</div>
					<div class="form-group">
						<label class="m-1 p-1" for="emial">Email address</label>
						<input type="email" class="form-control" id="email" name="email" placeholder="Enter email">
					</div>
					<div class="form-group">
						<label class="m-1 p-1" for="password">Password</label>
						<input type="password" class="form-control" id="password" name="password" placeholder="Password">
					</div>
					<div class="form-group">
						<label class="m-1 p-1" for="phone">Mobile Number</label>
						<input type="tel" class="form-control" id="phone" name="phone" placeholder="Enter mobile number">
					</div>
					<div class="form-group">
						<label class="m-1 p-1" for="image">Image</label>
						<input type="file" class="form-control" id="image" name="image">
					</div>
					 					<!--<div class="form-check">
						<input type="checkbox" class="form-check-input" id="exampleCheck1">
						<label class="form-check-label" for="exampleCheck1">Check me out</label>
					</div> -->
					<button type="submit" class="btn btn-primary mt-4 mx-auto d-flex">Submit</button>
				</form>
			</div>
		</div>
		<div class="card w-75 shadow m-1 p-1" id="doc-table">
			<header>
				<h2 class="m-3 p-3 text-center">Doctor Details</h2>
			</header>
			<div class="caption text-center">
				<c:if test="${not empty updateDoctor}">
					<span class="text-success fs-4">${updateDoctor}</span>
				</c:if>
				<c:remove var="updateDoctor" scope="session" />
			</div>
			<div class="card-body m-1 p-1">
				<table class="table-bordered p-1 text-left mx-auto">
					<thead class="thead-dark">
						<tr>
							<th scope="col" style="height: 36px;" class="text-center p-1">#</th>
							<th scope="col" style="height: 36px;" class="text-center p-1">Name</th>
							<th scope="col" style="height: 36px;" class="text-center p-1">DOB</th>
							<th scope="col" style="height: 36px;" class="text-center p-1">Qualification</th>
							<th scope="col" style="height: 36px;" class="text-center p-1">Speciality</th>
							<th scope="col" style="height: 36px;" class="text-center p-1">EMAIL</th>
							<th scope="col" style="height: 36px;" class="text-center p-1">PHONE</th>
							<th scope="col" style="height: 36px;" class="text-center p-1">IMAGE</th>
							<th scope="col" style="height: 36px;" class="text-center p-1">ACTION</th>
						</tr>
					</thead>
					<tbody>
						<%
						DoctorDao d_dao = new DoctorDao(DatabaseConfiguration.getMySQLConnection());

						List<Doctor> dr_list = d_dao.fetchDoctorList();
						int i = 1;
						for (Doctor d : dr_list) {
						%>
						<tr>
							<td class="m-1 p-1"><%=i%></td>
							<td class="m-1 p-1" class="text-wrap" style="width: 8rem;"><%=d.getName()%></td>
							<td class="m-1 p-1"><%=d.getDob()%></td>
							<td class="m-1 p-1" class="text-wrap text-center" style="width: 3rem;"><%=d.getQual()%></td>
							<td class="m-1 p-1" class="text-wrap text-center" style="width: 3rem;"><%=d.getSpclt().getSp_name()%></td>
							<td class="m-1 p-1"><%=d.getEmail()%></td>
							<td class="m-1 p-1"><%=d.getPhone()%></td>
							<td class="m-1 p-1"><%=d.getImage()%></td>
							<td class="m-1 p-1" class="d-flex">
								<a class="btn btn-sm btn-primary m-1 px-3 py-1" href="edit-doctor.jsp?id=<%=d.getId()%>">Edit</a>
								<a class="btn btn-sm btn-danger m-1 p-1" href="${ctxp}/HMS/delete-doctor?id=<%=d.getId()%>">Delete</a>
							</td>
						</tr>
						<%
						i++;
						}
						%>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<!--=========================== footer =========================== -->
	<%@include file="/components/footer.jsp"%>
	<!--=========================== footer =========================== -->
	<!--=========================== scripts =========================== -->
	<%@include file="/components/allscripts.jsp"%>
	<!--=========================== scripts =========================== -->
</body>
</html>