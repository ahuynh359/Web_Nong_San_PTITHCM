<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/library.jsp"%>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<c:if test="${not empty alert}">
	<c:choose>
		<c:when test="${alert == 1}">

			<div class="position-fixed bottom-0 end-0 p-3" style="z-index: 11">
				<div class="  alert alert-success alert-dismissible fade show"
					role="alert">
					Thêm vào giỏ hàng thành công
					<button type="button" class="ms-auto btn-close"
						data-bs-dismiss="alert" aria-label="Close"></button>
				</div>

			</div>


		</c:when>
		<c:when test="${alert == 2}">
			<div class="position-fixed bottom-0 end-0 p-3" style="z-index: 11">
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
<body>

	<div class="my-5">
		<div class="container">
			<div class="row ">
				<div class="col-12">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb mb-0 text-muted fs-6 fw-semibold">
							<li class="breadcrumb-item  "><a href="index.htm"
								class="text-decoration-none text-success "><s:message
										code="search.breadcrumb_1" /> </a></li>
							<li class="breadcrumb-item active" aria-current="page"
								class="text-decoration-none"><s:message
									code="search.breadcrumb_2" /></li>
						</ol>

					</nav>
				</div>
			</div>
		</div>
	</div>

	<div class="container mb-5">

		<h5 class="py-4 text-success">
			<c:if test="${total == 0}">
				<span><s:message code="search.none" /></span>
			</c:if>
			<c:if test="${total > 0}">
				${total} <span><s:message code="search.find" /></span>
			</c:if>

		</h5>

		<div class="row row-cols-2 row-cols-md-4  g-4">
			<c:forEach var="p" items="${products }">
				<%@include file="/WEB-INF/views/include/listProduct1.jsp"%>
			</c:forEach>
		</div>


	</div>

	<!-- Phan trang -->
	<div class="row mt-5 ">

		<!-- nav -->
		<nav>
			<ul class="pagination d-flex justify-content-center ms-2">
				<li class="page-item ${(currentPage == 1) ? 'disabled' : '' }"><a
					class="page-link  mx-1 " aria-label="Previous"
					href="searchFood.htm?index=${currentPage - 1 }&currentPage=${in.count  }&search=${search }">
						<span aria-hidden="true">&laquo;</span>
				</a></li>
				<c:forEach var="i" begin="1" end="${totalPage}" varStatus="in">

					<li class="page-item "><a
						class="page-link  mx-1 ${(currentPage == in.count) ? 'active' : '' }"
						href="searchFood.htm?currentPage=${in.count  }&search=${search}">${in.count}</a></li>
				</c:forEach>
				<li class="page-item"><a
					class="page-link mx-1 text-body ${(currentPage == totalPage) ? 'disabled' : '' }"
					aria-label="Next"
					href="searchFood.htm?currentPage=${currentPage + 1  }&search=${search }">
						<span aria-hidden="true">&raquo;</span>
				</a></li>
			</ul>
		</nav>



	</div>

<script type="text/javascript" src="assets/js/user/account.js"></script>

	<%@include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>