<%@include file="/WEB-INF/views/include/library.jsp"%>
<c:if test="${not empty addBean }">
	<c:set var="crrBean" value="${addBean}" />
	<c:set var="nameBean" value="addBean" />
	<c:set var="actionString" value="admin/category/add.htm" />
</c:if>

<c:if test="${not empty updateBean }">
	<c:set var="crrBean" value="${updateBean}" />
	<c:set var="nameBean" value="updateBean" />
	<c:set var="actionString" value="admin/category/update.htm" />
</c:if>
<body>



	<div class="row">

		<!-- Sidebar -->
		<div class="col-2 d-none d-lg-inline "><%@include
				file="/WEB-INF/views/admin/admin-header-nav.jsp"%></div>
		<div class="col-10 col-12-sm col-12-md">
			<div id="content-wrapper" class="d-flex flex-column">
				<nav
					class="  navbar navbar-light bg-white mb-4 static-top shadow d-none d-lg-inline">
					<%@include file="/WEB-INF/views/admin/admin-topbar.jsp"%>
				</nav>
				<!-- Main -->
				<div class="container">
					<div class="row mt-3">

						<div class="col-md-12 mb-4">
							<div class="d-md-flex justify-content-between align-items-center">
								<!-- pageheader -->
								<div>
									<h2>Create Category</h2>
									<!-- breacrumb -->
									<nav aria-label="breadcrumb">
										<ol class="breadcrumb mb-0 text-muted fs-6 fw-semibold">
											<li class="breadcrumb-item  "><a
												href="admin/user/dashboard.htm"
												class="text-decoration-none text-success ">Dashboard </a></li>
											<li class="breadcrumb-item "><a
												href="admin/user/get-employee.htm"
												class="text-decoration-none text-success ">Category </a>
											<li class="breadcrumb-item active" aria-current="page"
												class="text-decoration-none">Create Category</li>
										</ol>

									</nav>
								</div>

							</div>
						</div>

						<div class=" col-md-6 offset-md-3 card p-5 ">
							<form:form action="${actionString }" method="post"
								modelAttribute="${nameBean }" enctype="multipart/form-data">
								<form:input type="hidden" path="id" />
								<div class="form-group ">
									<label for="name-category" class="mb-2 fw-bold">Name
										Category</label>
									<form:input type="text" class="form-control" id="name-category"
										path="name" />
								</div>
								<div class="form-group mt-3">
									<p class="mb-2 fw-bold">Current Image</p>
									<img id="output" class="width-100" style="width: 100px"
										src="<c:url value="
            assets/img/category/${crrBean.image}" />"
										alt="Image not found" />
								</div>


								<div class="form-group mt-3">
									<label for="image" class="mb-2 fw-bold">Change Image</label>
									<form:input id="image" type="file" class="form-control"
										accept="image/*" path="fileImage" onchange="loadFile(event)" />
								</div>
								<button type="submit" class=" mt-3 btn btn-success">Submit</button>
							</form:form>
						</div>
					</div>
				</div>
				<!-- End Main -->
			</div>


		</div>

	</div>





</body>
<script type="text/javascript"
	src="<c:url value="assets/js/user/account.js" />"></script>
</html>
