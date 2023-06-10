<%@include file="/WEB-INF/views/include/library.jsp"%>

<c:set var="path" value="${pageContext.request.contextPath}" />
<style>
.navbar-brand img {
	max-width: 150px;
}

#passwordToggler {
	color: #001e2b;
	cursor: pointer;
	font-size: 16px;
	position: absolute;
	right: 20px;
	top: 50%;
	transform: translateY(-50%);
}

input[type='checkbox']:checked {
	background-color: green;
}
</style>

<body>
	<nav class="navbar shadow-sm p-3 mb-5 bg-body ">
		<div class="container-fluid">
			<a class="navbar-brand "
				href='<c:url value = "index.htm?language=${pageContext.response.locale}"/>'>
				<img src="assets/img/logo.png" alt="Logo">
			</a>
		</div>
	</nav>

	<section class="my-lg-14 my-5">
		<div class="container">
			<c:choose>
				<c:when test="${alert == 1}">
					<div class="position-fixed bottom-0 end-0 p-3">
						<div class="  alert alert-danger alert-dismissible fade show"
							role="alert">
							Wrong email or password
							<button type="button" class="ms-auto btn-close"
								data-bs-dismiss="alert" aria-label="Close"></button>
						</div>
					</div>

				</c:when>
				<c:when test="${alert == 3}">
					<div class="position-fixed bottom-0 end-0 p-3">
						<div class="  alert alert-danger alert-dismissible fade show"
							role="alert">
							Error when sending reset password link to Email
							<button type="button" class="ms-auto btn-close"
								data-bs-dismiss="alert" aria-label="Close"></button>
						</div>
					</div>

				</c:when>
				<c:when test="${alert == 2}">
					<div class="position-fixed bottom-0 end-0 p-3">
						<div class="  alert alert-success alert-dismissible fade show"
							role="alert">
							Send password reset succesfully ! Check your email
							<button type="button" class="ms-auto btn-close"
								data-bs-dismiss="alert" aria-label="Close"></button>
						</div>
					</div>

				</c:when>
				<c:when test="${alert == 4}">
					<div class="position-fixed bottom-0 end-0 p-3">
						<div class="  alert alert-danger alert-dismissible fade show"
							role="alert">
							Capcha do not match
							<button type="button" class="ms-auto btn-close"
								data-bs-dismiss="alert" aria-label="Close"></button>
						</div>
					</div>

				</c:when>
				<c:when test="${alert == 5}">
					<div class="position-fixed bottom-0 end-0 p-3">
						<div class="  alert alert-success alert-dismissible fade show"
							role="alert">
							Change password successfully !
							<button type="button" class="ms-auto btn-close"
								data-bs-dismiss="alert" aria-label="Close"></button>
						</div>
					</div>

				</c:when>
				<c:when test="${alert == 6}">
					<div class="position-fixed bottom-0 end-0 p-3">
						<div class="  alert alert-warning alert-dismissible fade show"
							role="alert">
							This account is locked, contact Admin !
							<button type="button" class="ms-auto btn-close"
								data-bs-dismiss="alert" aria-label="Close"></button>
						</div>
					</div>

				</c:when>
			</c:choose>



			<!-- row -->
			<div class="row justify-content-center align-items-center">
				<div class="col-12 col-md-6 col-lg-4 order-lg-1 order-2">
					<!-- img -->
					<img src="assets/img/signin-g.svg" alt="" class="img-fluid">
				</div>
				<!-- col -->
				<div class="col-12 col-md-6 offset-lg-1 col-lg-4 order-lg-2 order-1">
					<div class="mb-lg-9 mb-3">
						<h1 class="mb-1 h2 fw-bold">
							Sign in to <span class="text-success">Tad Garden </span>
						</h1>
						<p>Welcome back to Tad Garden! Enter your email to get
							started.</p>
					</div>

					<form:form method="post" action="guest.htm"
						modelAttribute="userbean" class="pt-2">
						<div class="row g-3">
							<!-- row -->

							<div class="col-12">
								<!-- input -->
								<form:input placeholder="Email address" type="email"
									class="form-control" path="username" id="username" />
							</div>
							<div class="col-12">
								<!-- input -->
								<div class="password-field position-relative">
									<form:input type="password" placeholder="Password"
										class="form-control" path="password" id="password" />
									<i id="passwordToggler" onclick="toggleIcon(this)"
										class="bi bi-eye-slash"></i>
								</div>

							</div>
							<div class="d-flex justify-content-between">
								<!-- form check -->
								<div class="form-check">
									<form:checkbox class="form-check-input" path="isRemember"
										id="flexCheckDefault"/>
									<!-- label -->
									<label class="form-check-label" for="flexCheckDefault">
										Remember me </label>
								</div>
								<div>
									<a data-bs-toggle="modal" data-bs-target="#exampleModal"
										class="text-muted" href="#">Forgot password?</a>
								</div>
							</div>
							<!-- btn -->
							<div class="col-12 d-grid">
								<button name="guest-login"
									class="btn btn-success btn-block  mb-3" type="submit">Log
									in</button>
							</div>
							<!-- link -->
							<div>
								Do not have an account? <a href="guest/guest-register.htm"
									class="link-success ">Create new</a>
							</div>
						</div>
					</form:form>
				</div>
			</div>

		</div>
	</section>

	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">

					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<form action="guest/resend-password.htm" method="post">
					<div class="modal-body">
						<div class="card text-center w-100">
							<div class="card-body px-5">
								<div class="mb-lg-9 mb-3">
									<!-- heading -->
									<h1 class="mb-2 h2 fw-bold ">Forgot your password?</h1>
									<p>Please enter the email address associated with your
										account and We will email you a link to reset your password.</p>
								</div>
								<div class="form-outline d-flex align-items-center ">
									<label class="form-label me-5" for="typeEmail">Email:</label> <input
										name="email" type="email" id="typeEmail"
										class="form-control my-3" />
								</div>

								<img src="${path }/captcha-image.htm" alt="Captcha Image"><br>
								<div class="form-outline d-flex align-items-center">
									<label class="form-label me-4" for="captcha">Captcha:</label><input
										type="text" id="captcha" name="captcha"
										class="form-control my-3" />
								</div>
								<div class="d-flex justify-content-end">
									<button class="btn btn-success " type="submit">Reset</button>
								</div>

							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>

	<%@include file="/WEB-INF/views/include/footer.jsp"%>
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
	<script type="text/javascript" src="assets/js/user/account.js"></script>
</body>


</html>