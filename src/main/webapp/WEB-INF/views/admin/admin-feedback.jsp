<%@include file="/WEB-INF/views/include/library.jsp"%>

<body>
	<c:choose>
		<c:when test="${alert == 1}">
			<div class="position-fixed bottom-0 end-0 p-3" style="z-index: 11">
				<div class="  alert alert-success alert-dismissible fade show"
					role="alert">
					Enable Successfully
					<button type="button" class="ms-auto btn-close"
						data-bs-dismiss="alert" aria-label="Close"></button>
				</div>
			</div>

		</c:when>
		<c:when test="${alert == 2}">
			<div class="position-fixed bottom-0 end-0 p-3" style="z-index: 11">
				<div class="  alert alert-success alert-dismissible fade show"
					role="alert">
					Disable Successfully
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
									<h2>Feedback</h2>
									<!-- breacrumb -->
									<nav aria-label="breadcrumb">
										<ol class="breadcrumb mb-0 text-muted fs-6 fw-semibold">
											<li class="breadcrumb-item  "><a
												href="admin/user/dashboard.htm"
												class="text-decoration-none text-success ">Dashboard </a></li>
											<li class="breadcrumb-item active" aria-current="page"
												class="text-decoration-none">Feedback</li>
										</ol>

									</nav>
								</div>

							</div>
						</div>
					</div>
					<!--End Breadcrum -->


					<div class="row  ">
						<div class="col-xl-12 col-12 mb-5">
							<div class=" px-6 py-6 p-4">
								<div class="row justify-content-between">
									<div class="col-xl-2 col-md-4 col-12">
										<div class="dropdown">
											<button class="btn btn-success dropdown-toggle" type="button"
												data-bs-toggle="dropdown" aria-expanded="false">
												<c:if test="${filter == 0 }">All</c:if>
												<c:if test="${filter == 1 }">One</c:if>
												<c:if test="${filter == 2 }">Two</c:if>
												<c:if test="${filter == 3 }">Three</c:if>
												<c:if test="${filter == 4 }">Four</c:if>
												<c:if test="${filter == 5 }">Five</c:if>
											</button>
											<ul class="dropdown-menu">
												<li><a class="dropdown-item"
													href="admin/feedback.htm?filter=0">All</a></li>
												<li><a class="dropdown-item"
													href="admin/feedback.htm?filter=1">One</a></li>
												<li><a class="dropdown-item"
													href="admin/feedback.htm?filter=2">Two</a></li>
												<li><a class="dropdown-item"
													href="admin/feedback.htm?filter=3">Three</a></li>
												<li><a class="dropdown-item"
													href="admin/feedback.htm?filter=4">Four</a></li>
												<li><a class="dropdown-item"
													href="admin/feedback.htm?filter=5">Five</a></li>

											</ul>
										</div>
									</div>
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
									<th>FeedbackId</th>
									<th>Product</th>
									<th>Product Name</th>
									<th>Customer</th>
									<th>Reviews</th>
									<th>Rating</th>
									<th>Date</th>
									<th>Status</th>
									<th>Enable</th>
								</tr>
							</thead>
							<tbody>

								<c:forEach varStatus="status" var="item" items="${list}">
									<tr>
										<td class="align-middle">${item.feedbackId }</td>
										<td class="align-middle"><a
											href="product/detail.htm?productId=${item.product.productId }"><img
												style="width: 100px"
												src="assets/img/products/${item.product.image}" /></a></td>
										<td class="align-middle"><h6>${item.product.productName}</h6></td>
										<td class="align-middle">${item.account.getName()}</td>
										<td class="align-middle"><div class="text-truncate">${item.feedbackContent}</div></td>

										<td class="align-middle"><c:forEach begin="1" end="5"
												varStatus="index">
												<c:choose>
													<c:when test="${index.count <= item.ratingStar}">
														<i class="bi bi-star-fill text-warning"></i>
													</c:when>
													<c:otherwise>
														<i class="bi bi-star-fill " style="color: #e6e6e6;"></i>
													</c:otherwise>
												</c:choose>
											</c:forEach></td>
										<td class="align-middle"><fmt:formatDate
												value="${item.postingDate}" pattern="dd-MM-yyyy" /></td>
										<td class="align-middle"><c:if test="${item.status == 0}">
												<span class="badge bg-danger">Disable</span>
											</c:if> <c:if test="${item.status == 1}">
												<span class="badge bg-success">Enable</span>
											</c:if></td>
										<td class="align-middle"><a
											href="admin/feedback/enable.htm?id=${item.feedbackId }"><button
													class="btn btn-success" type="button">
													<c:choose>
														<c:when test="${item.status == 0}">
															<i class="bi bi-lock-fill "></i>
														</c:when>
														<c:otherwise>
															<i class="bi bi-unlock-fill "></i>
														</c:otherwise>
													</c:choose>
												</button></a></td>


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
			<!--End pagination -->
		</div>
	</div>
</body>
<script src="<c:url value="/assets/js/admin/AlertHandler.js"/>"></script>
</html>