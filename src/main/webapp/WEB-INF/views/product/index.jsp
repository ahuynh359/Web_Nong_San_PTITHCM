<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/library.jsp"%>
<%@include file="/WEB-INF/views/include/header.jsp"%>

<c:if test="${not empty alert}">
	<c:choose>
		<c:when test="${alert == 1}">

			<div class="position-fixed bottom-0 end-0 p-3"  style="z-index: 11">
				<div class="  alert alert-success alert-dismissible fade show"
					role="alert">
					Thêm vào giỏ hàng thành công
					<button type="button" class="ms-auto btn-close"
						data-bs-dismiss="alert" aria-label="Close"></button>
				</div>

			</div>


		</c:when>
		<c:when test="${alert == 2}">
			<div class="position-fixed bottom-0 end-0 p-3"  style="z-index: 11">
				<div class="  alert alert-success alert-dismissible fade show"
					role="alert">
					Thêm vào danh sách yêu thích thành công
					<button type="button" class="ms-auto btn-close"
						data-bs-dismiss="alert" aria-label="Close"></button>
				</div>

			</div>
		</c:when>
	</c:choose>
</c:if>

<div class="my-4">
	<div class="container">
		<div class="row ">
			<div class="col-12">
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb mb-0 text-muted fs-6 fw-semibold">
						<li class="breadcrumb-item  "><a href="index.htm"
							class="text-decoration-none text-success "><s:message
									code="product.breadcrumb_1" /> </a></li>
						<li class="breadcrumb-item active" aria-current="page"
							class="text-decoration-none"><s:message
								code="product.breadcrumb_2" /></li>
					</ol>

				</nav>
			</div>
		</div>
	</div>
</div>



<div class=" mt-8 mb-lg-14 mb-8">
	<div class="container">
		<div class="row gx-10">
			<%@include file="/WEB-INF/views/product/productAsideBar.jsp"%>
			<section class="col-lg-9 col-md-12 ">
				<!-- card -->
				<div class="card mb-4 bg-light border-0">
					<!-- card body -->
					<div class=" card-body p-9">
						<h2 class="mb-0 fs-1 ">${currentCategory.name }</h2>
					</div>
				</div>
				<!-- list icon -->
				<div class="d-lg-flex justify-content-between align-items-center">
					<h5 class="mb-3 mb-lg-0 text-success">
						<c:choose>
							<c:when test="${filterPrice==0}">
								<s:message code="product.all" />
							</c:when>
							<c:when test="${filterPrice==1}">
								<s:message code="product.price_below" />
								<fmt:formatNumber value="100000" type="currency"
									currencySymbol="VND" maxFractionDigits="0" />
							</c:when>
							<c:when test="${filterPrice==2}">
								<fmt:formatNumber value="100000" type="currency"
									currencySymbol="VND" maxFractionDigits="0" /> - <fmt:formatNumber
									value="200000" type="currency" currencySymbol="VND"
									maxFractionDigits="0" />
							</c:when>
							<c:when test="${filterPrice==3}">
								<fmt:formatNumber value="200000" type="currency"
									currencySymbol="VND" maxFractionDigits="0" /> - <fmt:formatNumber
									value="300000" type="currency" currencySymbol="VND"
									maxFractionDigits="0" />
							</c:when>
							<c:when test="${filterPrice==4}">
								<fmt:formatNumber value="300000" type="currency"
									currencySymbol="VND" maxFractionDigits="0" />-<fmt:formatNumber
									value="500000" type="currency" currencySymbol="VND"
									maxFractionDigits="0" />
							</c:when>
							<c:when test="${filterPrice==5}">
								<fmt:formatNumber value="500000" type="currency"
									currencySymbol="VND" maxFractionDigits="0" />-<fmt:formatNumber
									value="1000000" type="currency" currencySymbol="VND"
									maxFractionDigits="0" />
							</c:when>
							<c:when test="${filterPrice==6}">
								<s:message code="product.price_above" />
								<fmt:formatNumber value="1000000" type="currency"
									currencySymbol="VND" maxFractionDigits="0" />
							</c:when>
							<c:otherwise>
							AHIH
							</c:otherwise>

						</c:choose>
					</h5>


					<div class="d-md-flex justify-content-between align-items-center">

						<div>

							<!-- select option -->
							<div class="dropdown">
								<button class="btn btn-success dropdown-toggle" type="button"
									data-bs-toggle="dropdown" aria-expanded="false">
									<c:choose>
										<c:when test="${index==0}">
											<s:message code="product.filter_0" />
										</c:when>
										<c:when test="${index==1}">
											<s:message code="product.filter_1" />
										</c:when>
										<c:when test="${index==2}">
											<s:message code="product.filter_2" />
										</c:when>
										<c:when test="${index==3}">
											<s:message code="product.filter_3" />
										</c:when>

									</c:choose>
								</button>
								<ul class="dropdown-menu">
									<li><a class="dropdown-item"
										href="product/index.htm?index=0&categoryId=${currentCategory.categoryId }&currentPage=${1 }">
											<s:message code="product.filter_0" />
									</a></li>
									<li><a class="dropdown-item"
										href="product/index.htm?index=1&categoryId=${currentCategory.categoryId }&currentPage=${1 }"><s:message
												code="product.filter_1" /></a></li>
									<li><a class="dropdown-item"
										href="product/index.htm?index=2&categoryId=${currentCategory.categoryId }&currentPage=${1 }"><s:message
												code="product.filter_2" /></a></li>
									<li><a class="dropdown-item"
										href="product/index.htm?index=3&categoryId=${currentCategory.categoryId }&currentPage=${1 }"><s:message
												code="product.filter_3" /></a></li>

								</ul>
							</div>

						</div>




					</div>
				</div>

				<c:if test="${productsFilterWithCategory.size() == 0 }">
					<div class="mt-2 alert alert-warning  green-alert section"
						role="alert">
						<s:message code="product.none" />
					</div>
				</c:if>
				<div
					class="row g-4 row-cols-xl-4 row-cols-lg-3 row-cols-2 row-cols-md-2 mt-2">
					<c:forEach var="p" items="${productsFilterWithCategory }">
						<!-- col -->
						<%@include file="/WEB-INF/views/include/listProduct1.jsp"%>
					</c:forEach>


				</div>
			</section>
		</div>
		<!-- </div> -->
	</div>
</div>


<!-- Phan trang -->
<div class="row mt-5 ">

	<!-- nav -->
	<nav>
		<ul class="pagination d-flex justify-content-center ms-2">
			<li class="page-item ${(currentPage == 1) ? 'disabled' : '' }"><a
				class="page-link  mx-1 " aria-label="Previous"
				href="product/index.htm?index=${currentPage - 1 }&currentPage=${in.count  }&categoryId=${currentCategory.categoryId }&filterPrice=${filterPrice}">
					<span aria-hidden="true">&laquo;</span>
			</a></li>
			<c:forEach var="i" begin="1" end="${totalPage	 }" varStatus="in">

				<li class="page-item "><a
					class="page-link  mx-1 ${(currentPage == in.count) ? 'active' : '' }"
					href="product/index.htm?index=${index }&currentPage=${in.count  }&categoryId=${currentCategory.categoryId }&filterPrice=${filterPrice}">${in.count}</a></li>
			</c:forEach>
			<li class="page-item"><a
				class="page-link mx-1 text-body ${(currentPage == totalPage) ? 'disabled' : '' }"
				aria-label="Next"
				href="product/index.htm?index=${index}&currentPage=${currentPage + 1  }&categoryId=${currentCategory.categoryId }&filterPrice=${filterPrice}">
					<span aria-hidden="true">&raquo;</span>
			</a></li>
		</ul>
	</nav>



</div>

<%@include file="/WEB-INF/views/include/footer.jsp"%>
<script type="text/javascript" src="assets/js/user/product.js"></script>
<script type="text/javascript" src="assets/js/user/account.js"></script>

</body>
</html>

