<%@include file="/WEB-INF/views/include/library.jsp"%>
<script
	src="<c:url value="/assets/js/employee/EmployeeProductFormHandler.js"/>"></script>
<style>
.hidden {
	display: none !important;
}
</style>
<body>
	<c:choose>

		<c:when test="${alert == 3}">
			<div class="position-fixed bottom-0 end-0 p-3" style="z-index: 11">
				<div class="  alert alert-success alert-dismissible fade show"
					role="alert">
					Add Successfully
					<button type="button" class="ms-auto btn-close"
						data-bs-dismiss="alert" aria-label="Close"></button>
				</div>
			</div>

		</c:when>
		<c:when test="${alert == 4}">
			<div class="position-fixed bottom-0 end-0 p-3" style="z-index: 11">
				<div class="  alert alert-success alert-dismissible fade show"
					role="alert">
					Update Successfully
					<button type="button" class="ms-auto btn-close"
						data-bs-dismiss="alert" aria-label="Close"></button>
				</div>
			</div>

		</c:when>

	</c:choose>
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
									<h2>Product</h2>
									<!-- breacrumb -->
									<nav aria-label="breadcrumb">
										<ol class="breadcrumb mb-0 text-muted fs-6 fw-semibold">
											<li class="breadcrumb-item  "><a
												href="employee/products.htm"
												class="text-decoration-none text-success ">Product </a></li>

										</ol>

									</nav>
								</div>
								<!-- button -->
								<div>
									<a type="button" href="employee/products/create-product.htm"
										class="btn btn-success">Add Products</a>
								</div>
							</div>
						</div>
					</div>
					<!--End Breadcrum -->


					<div class="row  ">
						<div class="col-xl-12 col-12 mb-5">
							<div class=" px-6 py-6 p-4">
								<div class="row justify-content-between">
									<div class="col-lg-4 col-md-6 col-12 mb-2 mb-md-0">
										<form class="d-flex" role="search"
											action="employee/products/searchProduct.htm">
											<input class="form-control" type="search"
												placeholder="Search Category" aria-label="Search"
												name="search">
										</form>
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
									<th>Image</th>
									<th>Name</th>
									<th>Category</th>
									<th>Posting Date</th>
									<th>Quantity</th>
									<th>Detail</th>
									<th>Price</th>
									<th>Edit</th>

								</tr>
							</thead>
							<tbody>

								<c:forEach varStatus="status" var="item" items="${products}">
									<tr>
										<td class="align-middle"><a
											href="product/detail.htm?productId=${item.productId }"> <img
												src="<c:url value="
                                                        assets/img/products/${item.image}" />"
												alt="Product Name" style="width: 80px"></a></td>
										<td class="align-middle"><a
											href="product/detail.htm?productId=${item.productId }"
											class="text-dark">${item.productName}</a></td>
										<td class="align-middle"><input type="hidden"
											id="categoryId${item.productId }" value="${item.categoryId }">
											<span>${item.categoryName }</span></td>

										<td class="align-middle"><fmt:formatDate
												value="${item.postingDate}" pattern="dd-MM-yyyy" /><input
											type="hidden" id="postingDate${item.productId }"
											value="${item.postingDate }"></td>
										<td class="align-middle"><span>${item.quantity } </span></td>
										<td class="align-middle"><p class="text-truncate"
												style="max-width: 50px;">${item.detail}</p> <input
											type="hidden" id="detail${item.productId }"
											value="${item.detail}" /></td>
										<td class="align-middle"><c:if
												test="${item.discount > 0}">
												<span class="text-dark fw-bold"><fmt:formatNumber
														value="${item.price - (item.price * item.discount)}"
														type="currency" currencySymbol="VND" maxFractionDigits="0" /></span>
												<span class="text-decoration-line-through text-muted">
													<fmt:formatNumber value="${item.price }" type="currency"
														currencySymbol="VND" maxFractionDigits="0" />
												</span>
											</c:if> <c:if test="${item.discount == 0}">
												<span class="text-dark fw-bold"> <fmt:formatNumber
														value="${item.price }" type="currency"
														currencySymbol="VND" maxFractionDigits="0" />
												</span>
											</c:if></td>
										<td class="align-middle"><a
											href="employee/products/update-product.htm?id=${item.productId }"
											class="btn btn-primary btn-sm" type="button">Update</a></td>



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
							href="employee/products.htm?crrPage=${crrPage - 1}&filter=${filter}">
								<span aria-hidden="true">&laquo;</span>
						</a></li>
						<c:forEach var="i" begin="1" end="${totalPage }" varStatus="in">

							<li class="page-item "><a
								class="page-link  mx-1 ${(crrPage == in.count) ? 'active' : '' }"
								href="employee/products.htm?crrPage=${in.count}&filter=${filter}">${in.count}</a></li>
						</c:forEach>
						<li class="page-item"><a
							class="page-link mx-1 text-body ${(crrPage == totalPage) ? 'disabled' : '' }"
							aria-label="Next"
							href="employee/products.htm?crrPage=${crrPage + 1}&filter=${filter}">
								<span aria-hidden="true">&raquo;</span>
						</a></li>
					</ul>
				</nav>

			</div>
			<!--End pagination -->
		</div>

	</div>


</body>


<script src="<c:url value="assets/js/admin/AlertHandler.js"/>"></script>
</html>