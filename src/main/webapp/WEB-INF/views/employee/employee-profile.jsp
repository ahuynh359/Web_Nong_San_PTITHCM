<%@include file="/WEB-INF/views/include/library.jsp"%>

<body>
	<c:choose>
		<c:when test="${alert == 1}">
			<div class="position-fixed bottom-0 end-0 p-3" style="z-index: 11">
				<div class="  alert alert-danger alert-dismissible fade show"
					role="alert">
					Delete Failed
					<button type="button" class="ms-auto btn-close"
						data-bs-dismiss="alert" aria-label="Close"></button>
				</div>
			</div>

		</c:when>
		<c:when test="${alert == 2}">
			<div class="position-fixed bottom-0 end-0 p-3" style="z-index: 11">
				<div class="  alert alert-success alert-dismissible fade show"
					role="alert">
					Delete Successfully
					<button type="button" class="ms-auto btn-close"
						data-bs-dismiss="alert" aria-label="Close"></button>
				</div>
			</div>

		</c:when>

	</c:choose>
	<div class="row">
		<!-- Sidebar -->
		<div class="col-2 d-none d-lg-inline "><%@include
				file="/WEB-INF/views/employee/employee-header-nav.jsp"%></div>
		<div class="col-10 col-12-sm col-12-md">
			<div id="content-wrapper" class="d-flex flex-column">
				<nav
					class="  navbar navbar-light bg-white mb-4 static-top shadow d-none d-lg-inline">
					<%@include file="/WEB-INF/views/admin/admin-topbar.jsp"%>
				</nav>

				<div class="container">
					<!-- Breadcrum -->
					<div class="row mb-8">
						<div class="col-md-12">
							<div class="d-md-flex justify-content-between align-items-center">
								<div>
									<h2>Profile</h2>
									<!-- breacrumb -->
									<nav aria-label="breadcrumb">
										<ol class="breadcrumb mb-0 text-muted fs-6 fw-semibold">
											<li class="breadcrumb-item  "><a
												href="admin/user/dashboard.htm"
												class="text-decoration-none text-success ">Profile </a></li>

										</ol>

									</nav>
								</div>

							</div>
						</div>
					</div>
					<!--End Breadcrum -->
					<form:form method="post" action="employee/profile.htm"
						modelAttribute="userbean"
						class="border-1 rounded-3 border-success  rounded mt-3"
						style="border: solid" enctype="multipart/form-data">
						<div class="row">
							<form:input type="hidden" path="password" />

							<div class="col-md-8 border-right">
								<div class="p-3 py-5">
									<h4 class="text-right">Profile Settings</h4>
									<div class="row mt-4">
										<div class="col-md-6">
											<label for="lastName" class="labels">Last Name</label>
											<form:input id="lastName" type="text" path="lastName"
												class="form-control" />
											<form:errors class="text-danger" path="lastName" />
										</div>
										<div class="col-md-6 	">
											<label for="firstName" class="labels">First Name</label>
											<form:input id="firstName" type="text" path="firstName"
												class="form-control" />
											<form:errors class="text-danger" path="firstName" />
										</div>
									</div>
									<div class="row mt-3">
										<div class="col-md-12">
											<label for="email" class="labels">Email</label>
											<form:input id="email" type="email" path="email"
												class="form-control" />
											<form:errors class="text-danger" path="email" />
										</div>

										<div class="col-md-12 mt-3">
											<label for="phoneNumber" class="labels">Phone Number</label>
											<form:input id="phoneNumber" type="text" path="phoneNumber"
												class="form-control" />
											<form:errors class="text-danger" path="phoneNumber" />
										</div>

									</div>
									<div class="mt-5 text-center">
										<button class="btn btn-success profile-button" name="update"
											type="submit">Save Profile</button>
										<c:if test="${message eq false }">
											<p class="mt-2 fw-semibold fs-6 text-danger">Failed in
												saving profile</p>
										</c:if>
										<c:if test="${message eq true }">
											<p class="mt-2 fw-semibold fs-6 text-success">Success in
												saving profile</p>
										</c:if>

									</div>
								</div>
							</div>
							<div class="col-md-4 border-right">
								<div
									class="d-flex flex-column align-items-center text-center p-3 py-5">

									<img
										src="<c:url value="/assets/img/account/${account.avatar} "/>"
										id="output" class="mt-2 rounded-circle" width="180px"
										height="180px" class="mv-10" />
								</div>
								<div
									class="d-flex justify-content-center align-items-center mt-3 mb-3">
									<label for="avatar">Avatar:</label>
									<form:input path="avatar" class="form-control" type="file"
										accept="image/*" id="formFile" onchange="loadFile(event)" />
									<form:errors class="text-danger" path="avatar" />
								</div>
							</div>
						</div>
					</form:form>





				</div>





			</div>


		</div>


	</div>
</body>
<script type="text/javascript" src="assets/js/user/account.js"></script>
<script src="<c:url value="/assets/js/admin/AlertHandler.js"/>"></script>
</html>