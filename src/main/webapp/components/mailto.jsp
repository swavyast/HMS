<a href="tel:7275855535" class="btn btn-sm bg-dark text-primary rounded-lg p-1 m-1" role="button"><i class="fa-solid fa-mobile-retro p-1 text-warning"></i> Call Me</a>
<a href="sms:7275855535" class="btn btn-sm bg-dark text-primary rounded-lg p-1 m-1" role="button"><i class="fa-solid fa-comment-medical p-1 text-warning"></i> Message Me</a>
<a href="mailto:swavyast@gmail.com" class="btn btn-sm bg-dark text-primary rounded-lg p-1 m-1 me-auto" role="button"><i class="fa-solid fa-at p-1 text-warning"></i> Email Me</a>
<c:if test="${not empty userObj || not empty adminObj || not empty doctorObj}">
<div class="m-0 p-0 my-auto mt-1">
<button type="submit" class="dropdown-item btn btn-sm bg-danger text-white p-2 m-2 my-auto mb-2 mx-auto rounded-pill text-center " form="logOutForm" id="fetchLogoutBtn">
	<i class="fa-solid fa-power-off"></i> Logout
</button>
</div>
</c:if>
<!-- 




<c:if test="${not empty adminObj || not empty doctorObj || not empty userObj}">
	<div class="m-0 p-0 bg-black">
<button type="submit" class="btn btn-sm bg-danger text-white text-center p-2 m-2" form="logOutForm">Logout</button>
<button type="submit" class="dropdown-item btn btn-sm bg-danger text-white rounded-pill text-center m-2 p-2 mx-auto" id="fetchLogoutBtn">
	<i class="fa-solid fa-power-off"></i> Logout
</button>
</div>
</c:if>
-->
