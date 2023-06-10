<%@include file="/WEB-INF/views/include/library.jsp"%>
<c:if test="${filter == 0}">
	<c:set var="source" value="admin/orders.htm" />
</c:if>
<c:if test="${filter == 1}">
	<c:set var="source" value="admin/orders/unresolve-order.htm" />
</c:if>
<c:if test="${filter == 2}">
	<c:set var="source" value="admin/orders/moving-order.htm" />
</c:if>
<c:if test="${filter == 3}">
	<c:set var="source" value="admin/orders/resolved-order.htm" />
</c:if>
<c:if test="${filter == 4}">
	<c:set var="source" value="admin/orders/cancel-order.htm" />
</c:if>



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
									<h2>Orders</h2>
									<!-- breacrumb -->
									<nav aria-label="breadcrumb">
										<ol class="breadcrumb mb-0 text-muted fs-6 fw-semibold">
											<li class="breadcrumb-item  "><a
												href="admin/user/dashboard.htm"
												class="text-decoration-none text-success ">Dashboard </a></li>
											<li class="breadcrumb-item active" aria-current="page"
												class="text-decoration-none">Orders</li>
										</ol>

									</nav>
								</div>

							</div>
						</div>
					</div>
					<!--End Breadcrum -->


					<div class="row  ">
						<div class="col-xl-12 col-12 mb-3">
								<div class="row justify-content-end">

										<div class="col-xl-2 col-md-4 col-12">
											<div class="dropdown">
												<button class="btn btn-success dropdown-toggle"
													type="button" data-bs-toggle="dropdown"
													aria-expanded="false">
													<c:if test="${filter == 0 }">All</c:if>
													<c:if test="${filter == 1 }">Unresolved</c:if>
													<c:if test="${filter == 2 }">On Moving</c:if>
													<c:if test="${filter == 3 }">Success</c:if>
													<c:if test="${filter == 4 }">Cancel</c:if>
												</button>
												<ul class="dropdown-menu">
													<li><a class="dropdown-item"
														href="admin/orders.htm?filter=0">All</a></li>
													<li><a class="dropdown-item"
														href="admin/orders.htm?filter=1">Unresolved</a></li>
													<li><a class="dropdown-item"
														href="admin/orders.htm?filter=2">On Moving</a></li>
													<li><a class="dropdown-item"
														href="admin/orders.htm?filter=3">Success</a></li>
													<li><a class="dropdown-item"
														href="admin/orders.htm?filter=4">Cancel</a></li>

												</ul>
											</div>
										</div>
									</div>


						</div>

						<!-- End Search  Filter -->
						<!-- table -->
						<div class="table-responsive ">
							<table class="table ">
								<thead class="position-sticky top-0 ">
									<tr class="table-success">
										<th>Detail</th>
										<th>Order ID</th>
										<th>Status</th>
										<th>Date</th>
										<th>Amount</th>
									</tr>
								</thead>
								<tbody>

									<c:forEach varStatus="status" var="item" items="${order}">
										<tr>
											<td class="align-middle"><a
												href="admin/orders/order-detail.htm?orderId=${item.orderId }"><i
													class="bi bi-info-circle"></i></a></td>
											<td class="align-middle"><span style="color: #a8729a;">${item.orderId }</span></td>
											<td class="align-middle"><div class="dropdown">
													<button
														class="btn btn-sm btn-outline-success dropdown-toggle"
														type="button" data-bs-toggle="dropdown"
														aria-expanded="false">
														<c:if test="${item.status == 0 }">Unresolved</c:if>
														<c:if test="${item.status == 1 }">On Moving</c:if>
														<c:if test="${item.status == 2 }">Success</c:if>
														<c:if test="${item.status == 3}">Cancel</c:if>
													</button>
													<ul class="dropdown-menu">
														<li><a
															class="dropdown-item ${(item.status == 2 or item.status == 1 ) ? 'disabled' : '' } "
															href="admin/orders/update-order.htm?id=${item.orderId }&status=0">Unresolved</a></li>
														<li><a
															class="dropdown-item ${item.status == 2 ? 'disabled' : '' }"
															href="admin/orders/update-order.htm?id=${item.orderId }&status=1">On
																Moving</a></li>
														<li><a class="dropdown-item"
															href="admin/orders/update-order.htm?id=${item.orderId }&status=2">Success</a></li>
														<li><a
															class="dropdown-item ${item.status == 2 ? 'disabled' : '' }"
															href="admin/orders/update-order.htm?id=${item.orderId }&status=3">Cancel</a></li>

													</ul>
												</div></td>
											<td class="align-middle"><fmt:formatDate
													value="${item.orderTime}" pattern="dd-MM-yyyy" /></td>
											<td class="align-middle"><fmt:formatNumber
													value="${item.price }" type="currency" currencySymbol="VND"
													maxFractionDigits="0" /></td>


										</tr>
									</c:forEach>
								</tbody>
							</table>


						</div>
					</div>


				</div>

				<div class="d-flex justify-content-center ">

					<!-- nav -->
					<nav>
						<ul class="pagination d-flex justify-content-center ms-2">
							<li class="page-item ${(crrPage == 1) ? 'disabled' : '' }"><a
								class="page-link  mx-1 " aria-label="Previous"
								href="admin/orders.htm?crrPage=${crrPage - 1}"> <span
									aria-hidden="true">&laquo;</span>
							</a></li>
							<c:forEach var="i" begin="1" end="${totalPage }" varStatus="in">

								<li class="page-item "><a
									class="page-link  mx-1 ${(crrPage == in.count) ? 'active' : '' }"
									href="admin/orders.htm?crrPage=${in.count}">${in.count}</a></li>
							</c:forEach>
							<li class="page-item"><a
								class="page-link mx-1 text-body ${(crrPage == totalPage) ? 'disabled' : '' }"
								aria-label="Next" href="admin/orders.htm?crrPage=${crrPage + 1}">
									<span aria-hidden="true">&raquo;</span>
							</a></li>
						</ul>
					</nav>

				</div>
				<!--End pagination -->
			</div>
		</div>
</body>
<script src="<c:url value="/assets/js/admin/AlertHandler.js"/>"></script>
</html>