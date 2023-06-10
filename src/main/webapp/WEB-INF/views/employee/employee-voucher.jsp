<%@include file="/WEB-INF/views/include/library.jsp"%>
<script
	src="<c:url value=" assets/js/employee/EmployeeVoucherFormHandler.js" />"></script>
<style>
.hidden {
	display: none !important;
}
</style>
<body>

	<div class="row">
		<!-- Sidebar -->
		<div class="col-2 d-none d-lg-inline ">
			<%@include file="/WEB-INF/views/employee/employee-header-nav.jsp"%></div>
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
									<h2>Voucher</h2>
									<!-- breacrumb -->
									<nav aria-label="breadcrumb">
										<ol class="breadcrumb mb-0 text-muted fs-6 fw-semibold">
											<li class="breadcrumb-item  "><a
												href="admin/user/dashboard.htm"
												class="text-decoration-none text-success ">Voucher </a></li>

										</ol>

									</nav>
								</div>
								<!-- button -->
								<div>
									<a class="btn btn-success"
										href="employee/vouchers/create-coupon.htm">Add Voucher</a>
								</div>
							</div>
						</div>
					</div>
					<!--End Breadcrum -->


					<!-- End Search  Filter -->

					<div class="table-responsive mt-3 ">
						<table class="table ">
							<thead class="position-sticky top-0 ">
								<tr class="table-success">
									<th>Coupon</th>
									<th>Posting Date</th>
									<th>Expiry Date</th>
									<th>Detail</th>
									<th>Edit</th>
								</tr>
							</thead>
							<tbody>

								<c:forEach varStatus="status" var="item" items="${coupons}">
									<tr>
										<td class="align-middle">
											<h1>
												<fmt:formatNumber type="percent" value="${item.discount }" />
											</h1> <span>${item.name }</span>
										</td>
										<td class="align-middle"><fmt:formatDate type="both"
												value="${item.postingDate}" pattern="dd-MM-yyyy hh:mm" /></td>
										<td class="align-middle"><fmt:formatDate type="both"
												value="${item.expiryDate}" pattern="dd-MM-yyyy hh:mm" /></td>

										<td class="align-middle"><p class="text-truncate"
												style="max-width: 50px;">${item.detail}</p></td>

										<td class="align-middle"><a type="button"
											href="employee/vouchers/update-voucher.htm?id=${item.couponId}"
											class="btn btn-sm me-1 btn-outline-success btn-block">
												Update</a></td>


									</tr>
								</c:forEach>
							</tbody>
						</table>


					</div>


					<div class="d-flex justify-content-center ">

						<!-- nav -->
						<nav>
							<ul class="pagination d-flex justify-content-center ms-2">
								<li class="page-item ${(crrPage == 1) ? 'disabled' : '' }"><a
									class="page-link  mx-1 " aria-label="Previous"
									href="admin/feedback.htm?crrPage=${crrPage - 1}&filter=${filter}">
										<span aria-hidden="true">&laquo;</span>
								</a></li>
								<c:forEach var="i" begin="1" end="${totalPage }" varStatus="in">

									<li class="page-item "><a
										class="page-link  mx-1 ${(crrPage == in.count) ? 'active' : '' }"
										href="admin/feedback.htm?crrPage=${in.count}&filter=${filter}">${in.count}</a></li>
								</c:forEach>
								<li class="page-item"><a
									class="page-link mx-1 text-body ${(crrPage == totalPage) ? 'disabled' : '' }"
									aria-label="Next"
									href="admin/feedback.htm?crrPage=${crrPage + 1}&filter=${filter}">
										<span aria-hidden="true">&raquo;</span>
								</a></li>
							</ul>
						</nav>

					</div>

					<!-- Modal -->


				</div>


			</div>


			<!--End pagination -->
		</div>
	</div>


</body>

<script src="<c:url value="assets/js/admin/AlertHandler.js"/>"></script>
</html>