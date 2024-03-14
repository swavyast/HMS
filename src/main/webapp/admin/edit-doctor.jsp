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
<title>Update Doctor Details</title>
</head>
<body style="margin-bottom : 65px;">
	<%
	int id = Integer.parseInt(request.getParameter("id"));
	DoctorDao ddao = new DoctorDao(DatabaseConfiguration.getMySQLConnection());
	Doctor doc = ddao.fetchDoctorById(id);
	session = request.getSession();
	%>
	<header>
		<%@include file="../components/navbar.jsp"%>
	</header>
	<c:if test="${empty adminObj}">
	<c:redirect url="${ctxp}/admin-login.jsp" />
	</c:if>
	<div class="container-fluid mx-auto col-md-8 offset-2">
	<p class="text-center col-md-4 offset-4 bg-dark text-primary p-1 rounded-pill mt-4"><%=doc.getName()%>'s Record</p>		
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
		<div class="card shadow col-md-4 mx-auto md-offset-8">
			<div class="card-body">
				<form action="${ctxp}/HMS/update-doctor" method="post" class="form-inline" enctype="multipart/form-data">
					<header>
						<h2 class="m-4 p-4 text-center text-primary bg-dark border-bottom rounded-pill fs-4">Edit <%=doc.getName()%>'s Record</h2>
					</header>

					<input type="hidden" name="id1" value=<%=doc.getId() %>>
					<div class="form-group">
						<label class="m-1 p-1" for="name">Name</label>
						<input type="text" class="form-control" id="name" name="name" value="<%=doc.getName() %>" placeholder="Enter name" required="required">
					</div>
					<div class="form-group">
						<label class="m-1 p-1" for="dob">Date Of Birth</label>
						<input type="date" class="form-control" id="dob" name="dob" value="<%=doc.getDob() %>" required="required">
					</div>
					<div class="form-group">
						<label class="m-1 p-1" for="qual">Qualification</label>
						<input type="Text" class="form-control" id="qual" name="qual" value="<%=doc.getQual() %>" placeholder="Enter qualification">
					</div>
					<div class="form-group">
						<label class="m-1 p-1" for="spclt">Speciality</label>
						<select id="spclt" name="spclt" class="form-control">
							<!-- <optgroup label="optgrp">Select An Option</optgroup> -->
							<option selected><%=doc.getSpclt().getSp_name() %></option>
							<%
							SpecialityDao sdao = new SpecialityDao(DatabaseConfiguration.getMySQLConnection());
							List<Speciality> list = sdao.listSpeciality();
							for (Speciality s : list) {
							%>
							<option id="speclt-options"><%=s.getSp_name()%></option>
							<%
							}
							%>
						</select>
					</div>
					<div class="form-group">
						<label class="m-1 p-1" for="emial">Email address</label>
						<input type="email" class="form-control" id="email" name="email" value="<%=doc.getEmail() %>" placeholder="Enter email">
					</div>
					<div class="form-group">
						<label class="m-1 p-1" for="password">Password</label>
						<input type="text" class="form-control" id="password" name="password" value="<%=doc.getPassword() %>" placeholder="Password">
					</div>
					<div class="form-group">
						<label class="m-1 p-1" for="phone">Mobile Number</label>
						<input type="tel" class="form-control" id="phone" name="phone" value="<%=doc.getPhone() %>" placeholder="Enter mobile number">
					</div>
					<div class="form-group">
						<label class="m-1 p-1" for="image">Image</label>
						<input type="file" class="form-control" id="image" name="image" value="<%=doc.getImage() %>" >
					</div>
					<div class="form-group">
					<button type="submit" class="btn btn-primary mt-4 text-center w-100">Update</button>
					</div>
				</form>
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