<%@include file="/WEB-INF/views/include/library.jsp"%>
<script src="<c:url value="/assets/js/admin/AdminRegister.js"/>"></script>
<title>Register</title>
<base href="${pageContext.servletContext.contextPath }" />
</head>
<style>
#passwordToggler {
	color: #001e2b;
	cursor: pointer;
	font-size: 16px;
	position: absolute;
	right: 20px;
	top: 50%;
	transform: translateY(-50%);
}
</style>

<body>

	<c:choose>
		<c:when test="${alert == 1}">
			<div class="position-fixed bottom-0 end-0 p-3">
				<div class="  alert alert-danger alert-dismissible fade show"
					role="alert">
					Account already exits
					<button type="button" class="ms-auto btn-close"
						data-bs-dismiss="alert" aria-label="Close"></button>
				</div>
			</div>

		</c:when>
		<c:when test="${alert == 2}">
			<div class="position-fixed bottom-0 end-0 p-3">
				<div class="  alert alert-success alert-dismissible fade show"
					role="alert">
					Sign Up Successfully
					<button type="button" class="ms-auto btn-close"
						data-bs-dismiss="alert" aria-label="Close"></button>
				</div>
			</div>

		</c:when>
		
	</c:choose>

	<nav class="navbar shadow-sm p-3 mb-5 bg-body ">
		<div class="container-fluid">
			<a class="navbar-brand "
				href='<c:url value = "index.htm?language=${pageContext.response.locale}"/>'>
				<img src="${company.logoNavImg }" alt="Logo">
			</a>
		</div>
	</nav>

	<section class="my-lg-14 my-8">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row justify-content-center align-items-center">
				<div class="col-12 col-md-6 col-lg-4 order-lg-1 order-2">
					<!-- img -->
					<img src="assets/img/signup-g.svg" alt="" class="img-fluid">
				</div>
				<!-- col -->
				<div class="col-12 col-md-6 offset-lg-1 col-lg-4 order-lg-2 order-1">
					<div class="mb-lg-9 mb-5">
						<h1 class="mb-1 h2 fw-bold">Sign up</h1>
						<p>
							Welcome to <span class="text-warning">Tad Garden!</span> Enter
							your email to get started.
						</p>
					</div>
					<!-- form -->
					<form:form method="post" modelAttribute="userbean"
						enctype="multipart/form-data">
						<div class="row g-3">
							<!-- col -->
							<div class="col">
								<!-- input -->
								<form:input type="text" id="firstName" placeholder="First name"
									class="form-control " path="firstName" />
								<form:errors class="text-danger" path="firstName" />
							</div>
							<div class="col">
								<form:input type="text" id="lastName" placeholder="Last name"
									class="form-control " path="lastName" />
								<form:errors class="text-danger" path="lastName" />

							</div>
							<div class="col-12">

								<form:input type="email" class="form-control"
									placeholder="Email" id="email" path="email" />
								<form:errors class="text-danger" path="email" />
							</div>
							<div class="col-12">
								<div class="password-field position-relative">
									<form:input type="password" class="form-control" id="password"
										placeholder="Enter password" path="password" />
									<span><i onclick="toggleIcon(this)" id="passwordToggler"
										class="bi bi-eye-slash"></i></span>
									<form:errors class="text-danger" path="password" />
								</div>
							</div>
							<div class="col-12">
								<form:input type="text" class="form-control" id="phoneNumber"
									path="phoneNumber" placeholder="Phone Number" />
								<form:errors class="text-danger" path="phoneNumber" />
							</div>
							<div class="col-12">
								<label for="avatar">Avatar:</label>
								<form:input type="file" class="form-control-file" id="avatar"
									path="avatar" accept="image/*" />
								<form:errors class="text-danger" path="avatar" />
							</div>
							<!-- btn -->
							<div class="col-12 d-grid">
								<button name="update" type="submit" class="btn btn-success">Register</button>
							</div>

							<!-- text -->
							<p>
								<small>By continuing, you agree to our <a
									class="link-success" href="#!"> Terms of Service</a> &amp; <a
									class="link-success" href="#!">Privacy Policy</a></small>
							</p>
						</div>
					</form:form>
				</div>
			</div>
		</div>


	</section>
	<script>
		//var x = document.querySelector("#passwordToggler");
		var pass = document.getElementById("password");
		toggleIcon = function(x) {
			x.classList.toggle('bi-eye');
			const type = pass.getAttribute("type") === "password" ? "text"
					: "password";
			password.setAttribute("type", type);
		};
	</script>

	<%@include file="/WEB-INF/views/include/footer.jsp"%>
	<script type="text/javascript" src="assets/js/user/account.js"></script>
</body>
</html>
