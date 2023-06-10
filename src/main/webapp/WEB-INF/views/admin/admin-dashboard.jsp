<%@include file="/WEB-INF/views/include/library.jsp"%>

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

				<div class="container">
					<!-- Breadcrum -->
					<div class="row mb-8">
						<div class="col-md-12">
							<div class="d-md-flex justify-content-between align-items-center">
								<div>
									<h2>Dashboard</h2>
									<!-- breacrumb -->
									<nav aria-label="breadcrumb">
										<ol class="breadcrumb mb-0 text-muted fs-6 fw-semibold">
											<li class="breadcrumb-item  "><a
												href="admin/user/dashboard.htm"
												class="text-decoration-none text-success ">Dashboard </a></li>
										</ol>

									</nav>
								</div>

							</div>
						</div>
					</div>
					<!--End Breadcrum -->

					<div class="row mb-8 mt-3">
						<div class="col-md-12">
							<!-- card -->
							<div class="card bg-light border-0 rounded-4"
								style="background-image: url(assets/img/slide_3.jpg); background-repeat: no-repeat; background-size: cover; background-position: right;">
								<div class="card-body p-lg-12 p-5">
									<h1>Welcome back! FreshCart</h1>
									<p>FreshCart is simple &amp; clean design for developer and
										designer.</p>
									<a href="#" class="btn btn-success"> Create Product </a>
								</div>
							</div>
						</div>
					</div>

					<div class="row mt-5">
						<div class="col-lg-4 col-12 mb-6">
							<!-- card -->
							<div class="card h-100 card-lg">
								<!-- card body -->
								<div class="card-body p-6">
									<!-- heading -->
									<div
										class="d-flex justify-content-between align-items-center mb-6">
										<div>
											<h4 class="mb-0 fs-5">Earnings</h4>
										</div>
										<div
											class="icon-shape icon-md bg-light-danger text-dark-danger rounded-circle">
											<i class="bi bi-currency-dollar fs-5"></i>
										</div>
									</div>
									<!-- project number -->
									<div class="lh-1">
										<h1 class=" mb-2 fw-bold fs-2">
											<fmt:formatNumber value="${totalEarning }" type="currency"
												currencySymbol="VND" maxFractionDigits="0" />
												
										</h1>
										<span>Monthly revenue</span>
										
									</div>
								</div>
							</div>
						</div>

						<div class="col-lg-4 col-12 mb-6">
							<!-- card -->
							<div class="card h-100 card-lg">
								<!-- card body -->
								<div class="card-body p-6">
									<!-- heading -->
									<div
										class="d-flex justify-content-between align-items-center mb-6">
										<div>
											<h4 class="mb-0 fs-5">Orders</h4>
										</div>
										<div
											class="icon-shape icon-md bg-light-warning text-dark-warning rounded-circle">
											<i class="bi bi-cart fs-5"></i>
										</div>
									</div>
									<!-- project number -->
									<div class="lh-1">
										<h1 class=" mb-2 fw-bold fs-2">${totalOrder }</h1>
										<span>Monthly revenue</span>
									</div>
									
								</div>
							</div>
						</div>

						<div class="col-lg-4 col-12 mb-6">
							<!-- card -->
							<div class="card h-100 card-lg">
								<!-- card body -->
								<div class="card-body p-6">
									<!-- heading -->
									<div
										class="d-flex justify-content-between align-items-center mb-6">
										<div>
											<h4 class="mb-0 fs-5">Customer</h4>
										</div>
										<div
											class="icon-shape icon-md bg-light-info text-dark-info rounded-circle">
											<i class="bi bi-people fs-5"></i>
										</div>
									</div>
									<!-- project number -->
									<div class="lh-1">
										<h1 class=" mb-2 fw-bold fs-2">${totalClient }</h1>
										<span>Monthly revenue</span>
									</div>
									
								</div>
							</div>
						</div>
					</div>






				</div>


			</div>


		</div>
	</div>
</body>
<script src="<c:url value="/assets/js/admin/AlertHandler.js"/>"></script>
</html>