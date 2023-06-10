<%@include file="/WEB-INF/views/include/library.jsp"%>
<title>Reset Password</title>
</head>
<body>
	<nav class="navbar shadow-sm p-3 mb-5 bg-body ">
		<div class="container-fluid">
			<a class="navbar-brand "
				href='<c:url value = "index.htm?language=${pageContext.response.locale}"/>'>
				<img src="${company.logoNavImg }" alt="Logo">
			</a>
		</div>
	</nav>
	<section>
		<div class="row justify-content-center align-items-center">
			<div class="col-12 col-md-6 col-lg-4 order-lg-1 order-2">
				<!-- img -->
				<img src="assets/img/signin-g.svg" alt="" class="img-fluid">
			</div>
			<!-- col -->
			<div class="col-12 col-md-6 offset-lg-1 col-lg-4 order-lg-2 order-1">
				<div class="mb-lg-9 mb-3">
					<h1 class="mb-1 h2 fw-bold">
						Change password for <span class="text-success">${email } </span>
					</h1>

				</div>

				<form method="post" class="pt-2">
					<div class="row g-3">
						<!-- row -->

						<div class="password-field position-relative">
							<input type="password" name="password" placeholder="New Password"
								class="form-control" />
						</div>
						<div class="password-field position-relative">
							<input type="password" name="confirm-passsword"
								placeholder="Confirm Password" class="form-control" />
						</div>


						<input type="hidden" value="${request.getRequestURL() }"
							name="oldPath" />

						<!-- btn -->
						<div class="d-flex ms-auto">
							<button name="guest-login" class="btn btn-success mb-3 "
								type="submit">Submit</button>
						</div>

					</div>
				</form>
			</div>
		</div>
	</section>
	<%@include file="/WEB-INF/views/include/footer.jsp"%>

</body>
</html>