<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="components/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="components/allcss.jsp"%>
<meta charset="UTF-8">
<title>User Registration</title>
</head>
<body>
	<!--=========================== header =========================== -->
	<header>
		<%@include file="components/navbar.jsp"%>
	</header>
	<!--=========================== header =========================== -->
	<div class="container-fluid">
		<div class="mt-4">
			<div class="card shadow-lg col-sm-6 mx-auto m-2 p-5 my-auto">
				<p class="fs-5 text-center mt-5 mb-5 text-danger">
					Registered already? <a class="text-light bg-dark px-4 p-2 mx-4 text-decoration-none rounded-pill" href="user-login.jsp"><i class="fa-solid fa-power-off"></i> Login</a>
				</p>
				<form id="registration" action="registration" method="post" enctype="multipart/form-data">
					<span class="fs-6 text-danger">
						<c:if test="${not empty response}">
          						${response}
          						<c:remove var="response" scope="session" />
						</c:if>
					</span>
					<div class="row mb-3 g-3  my-auto">
						<label for="input-F-Name" class="col-sm-5 px-4 col-form-label">First Name : </label>
						<div class="col-sm-5">
							<input class="p-2 px-5 mt-2" id="input-F-Name" value="" type="text" name="fname" placeholder="First Name" required>
						</div>
					</div>
					<div class="row mb-3 g-3 my-auto">
						<label for="input-L-Name" class="col-sm-5 px-4 col-form-label">Last Name : </label>
						<div class="col-sm-5">
							<input class="p-2 px-5 mt-2" id="input-L-Name" value="" type="text" name="lname" placeholder="Last Name" required>
						</div>
					</div>
					<div class="row mb-3 g-3 my-auto">
						<label for="input-DOB" class="col-sm-5 px-4 col-form-label">Date of birth : </label>
						<div class="col-sm-5">
							<input class="p-2 px-5 mt-2" id="input-DOB" value="" type="date" name="dob" required>
						</div>
					</div>
					<div class="row mb-3 g-3 my-auto">
						<label for="input-phone" class="col-sm-5 px-4 col-form-label">Contact Number : </label>
						<div class="col-sm-5">
							<input class="p-2 px-5 mt-2" id="input-phone" value="" type="tel" name="phone" placeholder="Your Contact Number" required>
						</div>
					</div>
					<div class="row mb-3 g-3 my-auto">
						<label for="input-email" class="col-sm-5 px-4 col-form-label">Email address : </label>
						<div class="col-sm-5">
							<input class="p-2 px-5 mt-2" id="input-email" value="" type="email" name="email" placeholder="Enter Your Email" required>
						</div>
					</div>
					<div class="row mb-3 g-3 my-auto">
						<label for="confirm-input-email" class="col-sm-5 px-4 col-form-label">Confirm Email address : </label>
						<div class="col-sm-5">
							<input class="p-2 px-5 mt-2" id="confirm-input-email" value="" type="email" name="confirmemail" placeholder="Confirm Email" required>
						</div>
					</div>
					<div class="row mb-3 g-3 my-auto">
						<label for="input-password" class="col-sm-5 px-4 col-form-label">Set a password : </label>
						<div class="col-sm-5">
							<input class="p-2 px-5 mt-2" id="input-password" value="" type="password" name="pwd" placeholder="Enter Your Password" required>
						</div>
					</div>
					<div class="row mb-3 g-3 my-auto">
						<label for="confirm-input-password" class="col-sm-5 px-4 col-form-label">Re-type your password : </label>
						<div class="col-sm-5">
							<input class="p-2 px-5 mt-2" id="confirm-input-password" value="" type="password" name="confirmpwd" placeholder="Confirm Password" required>
						</div>
					</div>
					<div class="row mb-3 g-3 d-flex mt-3 my-auto">
						<div class="col-sm-6">
							<small class="form-text text-muted w-75"> You can attach your profile picture here, preferred size is 400x400 </small>
						</div>
						<div class="col-sm-6">
							<input class="form-control-file mt-2" value="" type="file" name="image" id="attach-file">
						</div>
					</div>
					<div class="col-7 mx-auto  my-auto">
						<input class="btn btn-prmary bg-black text-white col-12 p-2 mt-2" type="submit" name="submit" value="Register">
					</div>
				</form>
			</div>
		</div>
	</div>
	<div style="min-height:30px;"></div>
	<!--=========================== footer =========================== -->
	<%@include file="components/footer.jsp"%>
	<!--=========================== footer =========================== -->
	<!--=========================== scripts =========================== -->
	<%@include file="components/allscripts.jsp"%>
	<!--=========================== scripts =========================== -->
</body>
</html>