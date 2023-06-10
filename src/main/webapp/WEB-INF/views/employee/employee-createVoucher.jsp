<%@include file="/WEB-INF/views/include/library.jsp"%>
<body>



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
				<!-- Main -->
				<div class="container">
					<div class="row mt-3">

						<div class="col-md-12 mb-4">
							<div class="d-md-flex justify-content-between align-items-center">
								<!-- pageheader -->
								<div>
									<h2>Create Voucher</h2>
									<!-- breacrumb -->
									<nav aria-label="breadcrumb">
										<ol class="breadcrumb mb-0 text-muted fs-6 fw-semibold">
											<li class="breadcrumb-item "><a
												href="admin/products.htm"
												class="text-decoration-none text-success ">Voucher </a>
											<li class="breadcrumb-item active" aria-current="page"
												class="text-decoration-none">${mess == 1 ? 'Create Voucher' : 'Update Voucher'}</li>
										</ol>

									</nav>
								</div>

							</div>
						</div>

						<div class=" col-md-6 offset-md-3 card p-5 ">
							${message }
							<form:form id="voucher-form" method="post"
								action="${mess == 2 ? 'employee/vouchers/update-voucher.htm' : 'employee/vouchers/create-coupon.htm'}"
								modelAttribute="couponBean" class="row m-3"
								enctype="multipart/form-data">
								<div class="col-md-12 mt-2">
									<label for="inputNameDiscount" class="form-label">Name
										Coupon</label>
									<form:input path="name" class="form-control"
										id="inputNameDiscount" />
								</div>
								<div class="col-md-12 mt-2">
									<label for="percentDiscount">Discount percent</label>
									<form:input id="percentDiscount" class="form-control"
										type="text" path="discount" />
								</div>
								<div class="col-md-12 mt-2">
									<label for="inputDate" class="form-label">Date Posting</label>
									<form:input type="date" class="form-control" id="inputDate"
										path="postingDate" />
								</div>
								<div class="col-md-12 mt-2">
									<label for="expiryDate" class="form-label">Expriy Date</label>
									<form:input type="date" class="form-control" id="expiryDate"
										path="expiryDate" />
								</div>
								<div class="col-md-12 mt-2">
									<div class="form-floating mb-3">
										<form:input type="text" class="form-control" path="detail"
											placeholder="Leave a detail here" id="inputDetail"
											style="height: 100px" />
										<label for="inputDetail">Detail</label>
									</div>
								</div>
								<div
									class="col-12 mt-2 d-flex align-items-center justify-content-center">
									<button type="submit" class="btn btn-primary">Submit</button>
								</div>
							</form:form>
						</div>


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
