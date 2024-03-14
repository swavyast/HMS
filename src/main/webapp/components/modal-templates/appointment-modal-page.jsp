<%@page import="com.ml.db.DatabaseConfiguration"%>
<%@page import="com.ml.dao.DoctorDao"%>
<%@page import="com.ml.entity.Doctor"%>
<%@page import="com.ml.entity.Appointment"%>
<%@page import="java.sql.Date"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.Instant"%>
<%@page import="com.ml.entity.Disease"%>
<%@page import="com.ml.entity.Gender"%>
<%@page import="java.time.ZoneId"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.Period"%>
<%@page import="java.sql.Date"%>
<%@page import="com.ml.entity.User"%>
<%@include file="../../components/taglibs.jsp"%>
<%
User u = (User) session.getAttribute("userObj");
//Appointment appt = AppointmentDao().getAppointmentNumber();
%>
<c:if test="${empty userObj}">
<c:redirect url="${ctxp}/user-login.jsp" />
</c:if>
<div class="container-fluid">
	<div class="jumbotran-fluid">
		<div class="jumbotran">
			<p class="fs-1 text-center">Appointment Booking Window</p>
			<p class="text-center text-muted pb-5">
				<em><small>Valid documents for verification during appointment : AADHAR, Pan, VoterId, Passport, ration card etc.</small></em>
			</p>
			<div class="container-fluid" style="margin-top: 50px;">
				<c:if test="${not empty schAptResp}">
					<p class="text-center col-md-4 offset-4 bg-dark text-primary p-1 rounded-pill mt-4">${schAptResp}</p>
					<span class="bg-primary text-dark">Status : ${schStatus}</span>
					<c:remove var="response" scope="session" />
				</c:if>
			</div>
		</div>
		<div class="container-fluid border-top px-5">
			<form action="${ctxp}/HMS/appointment" method="post" enctype="multipart/form-data" class="mx-5">
			<input type="hidden" name="uid" value="<%=u.getId()%>">
				<div class="row mb-3 g-3  my-auto">
					<label for="input-F-Name" class="col-sm-5 px-4 col-form-label">Full Name : </label>
					<div class="col-sm-5">
						<input class="p-2 mt-2 w-75 form-control text-center border-black" id="inputName" readonly value="${userObj.name}" type="text" name="fullname" required>
					</div>
				</div>
				<div class="row mb-3 g-3 my-auto">
					<label for="inputAge" class="col-sm-5 px-4 col-form-label">Age : </label>
					<div class="col-sm-5">
						<input class="p-2 mt-2 w-75 form-control text-center border-black" id="inputAge" type="text" name="age" required>
					</div>
				</div>
				<div class="row mb-3 g-3 my-auto">
					<label for="gender" class="col-sm-5 px-4 col-form-label">Gender : </label>
					<div class="col-sm-5" id="gender">
						<table class="me-auto">
							<thead class="thead-dark">
								<tr>
									<th scope="col" class="text-center p-1">
										<label for="male">Male </label>
									</th>
									<th scope="col" class="text-center p-1">
										<label for="male">Female </label>
									</th>
									<th scope="col" class="text-center p-1">
										<label for="male">Others </label>
									</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>
										<input class="form-control-radio" id="male" value="<%=Gender.MALE.name()%>" type="radio" name="gender" required>
									</td>
									<td>
										<input class="form-control-radio" id="female" value="<%=Gender.FEMALE.name()%>" type="radio" name="gender" required style="margin-left: 10px;">
									</td>
									<td>
										<input class="form-control-radio" id="others" value="<%=Gender.OTHERS.name()%>" type="radio" name="gender" required style="margin-left: 10px;">
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div class="row mb-3 g-3 my-auto">
					<label for="disease" class="col-sm-5 px-4 col-form-label">Disease : </label>
					<div class="col-sm-5" id="disease">
						<select class="p-2 mt-2 text-center border-1 bg-white w-75 form-select border-black" name="disease">
							<option selected>Select</option>
							<%
							for (Disease d : Disease.values()) {
							%>
							<option><%=d.name()%></option>
							<%
							}
							%>
						</select>
					</div>
				</div>
				<div class="row mb-3 g-3  my-auto">
					<label for="patientNumber" class="col-sm-5 px-4 col-form-label">Doctor : </label>
					<div class="col-sm-5">
						<select class="p-2 mt-2 text-center border-1 bg-white w-75 form-select border-black" name="doctor">
						<option selected>Select</option>
						<%for(Doctor d: new DoctorDao(DatabaseConfiguration.getMySQLConnection()).fetchDoctorList()){%>
							<option><%=d.getName() %></option>
							<%} %>
						</select>
					</div>
				</div>
				<div class="row mb-3 g-3 my-auto">
					<label for="regDate" class="col-sm-5 px-4 col-form-label">Date of Registration : </label>
					<div class="col-sm-5">
						<input class="p-2 mt-2 w-75 form-control text-center border-black" id="regDate" readonly value="<%=Date.valueOf(LocalDate.now())%>" type="date" name="regDate">
					</div>
				</div>
				<div class="row mb-3 g-3 my-auto">
					<label for="regDate" class="col-sm-5 px-4 col-form-label">Date of Appointment : </label>
					<div class="col-sm-5">
						<input class="p-2 mt-2 w-75 form-control text-center border-black" id="regDate" readonly value="<%=Date.valueOf(LocalDate.now())%>" type="date" name="apptDate">
					</div>
					<div class="text-center mx-5">
						<p class="col-sm-6 offset-3 text-muted">
							<em><small>As of now, both dates(date of registration as well as date of appointment) are same as per the management decision.</small></em>
						</p>
					</div>
				</div>
				<div class="row mb-3 g-3  my-auto">
					<label for="patientNumber" class="col-sm-5 px-4 col-form-label">Patient Number : </label>
					<div class="col-sm-5">
						<input class="p-2 mt-2 w-75 form-control text-center border-black" id="patientNumber" readonly value="1" type="number" name="patientNumber" placeholder="00000000" required>
					</div>
				</div>
				<div class="row mb-3 g-3  my-auto">
					<label for="patientStatus" class="col-sm-5 px-4 col-form-label">Status : </label>
					<div class="col-sm-5">
						<input class="p-2 mt-2 w-75 form-control text-center border-black" id="patientStatus" readonly value="" type="text" name="patientStatus" placeholder="Registration In Process" required>
					</div>
				</div>
				<div class="row mb-3 g-3  my-auto">
					<label for="patientStatus" class="col-sm-5 px-4 col-form-label">Address : </label>
					<div class="col-sm-3">
						<input class="p-2 mt-2 form-control text-center border-black" id="patientStreet" value="" type="text" name="street" placeholder="Vill. or Local Street Name" required>
						<input class="p-2 mt-2 form-control text-center border-black" id="patientCity" value="" type="text" name="city" placeholder="Name of your City" required>
					</div>
					<div class="col-sm-3">
						<input class="p-2 mt-2 form-control text-center border-black" id="patientState" value="" type="text" name="state" placeholder="Name of Your State" required>
						<input class="p-2 mt-2 form-control text-center border-black" id="patientCountry" value="" type="text" name="country" placeholder="Name of Your Country" required>
					</div>
					<div class="col-sm-2 offset-5">
						<input class="p-2 mt-2 form-control text-center border-black" id="patientPin" value="" type="text" name="pin" placeholder="Your Postal Code" required>
					</div>
				</div>
				<div class="row mb-3 g-3 mx-auto mt-3 my-auto">
					<div class="col-sm-6 d-flex">
						<em><small class="form-text text-muted form-control"> You can attach your hospital record here.</small></em><img class="mx-2" src="${ctxp}/HMS/images/arrow-right.svg" alt="arrow-right" width="36">
					</div>
					<div class="col-sm-6">
						<input class="form-control-file mt-3 mx-0" value="" type="file" name="reportCard" id="attach-file">
					</div>
				</div>
				<div class="col-7 mx-auto  my-auto">
					<input class="btn bg-black text-white col-12 p-2 mt-2 form-submit" type="submit" name="submit" value="Schedule">
				</div>
			</form>
		</div>
	</div>
</div>