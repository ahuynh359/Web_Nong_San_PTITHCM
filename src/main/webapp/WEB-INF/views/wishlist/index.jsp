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
										code="wishlist.breadcrumb_1" /> </a></li>
							<li class="breadcrumb-item active" aria-current="page"
								class="text-decoration-none"><s:message
									code="wishlist.breadcrumb_2" /></li>
						</ol>

					</nav>
				</div>
			</div>
		</div>
	</div>

	<section class="mt-8 mb-14">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="mb-8">

						<h1 class="mb-1">
							<s:message code="wishlist.breadcrumb_2" />
						</h1>
						<p class="mb-4">
							<c:if test="${wishlists.size() > 0 }">
								<span>${wishlists.size()}</span>
								<s:message code="wishlist.find" />
							</c:if>
							<c:if test="${wishlists.size() == 0 }">

								<div class="mt-2 alert alert-warning  green-alert section"
									role="alert">
									<s:message code="wishlist.none" />
								</div>
							</c:if>

						</p>
					</div>


				</div>
			</div>
			<c:if test="${wishlists.size() > 0 }">
				<div class="row">
					<!-- table -->
					<div class="col-12">
						<div class="table-responsive">
							<table class="table text-nowrap">
								<thead class="table-success">
									<tr>
										<th><s:message code="wishlist.photo" /></th>
										<th><s:message code="wishlist.des" /></th>
										<th><s:message code="wishlist.price" /></th>
										<th><s:message code="wishlist.action" /></th>
										<th><s:message code="wishlist.remove" /></th>
									</tr>
								</thead>
								<c:forEach var="c" items="${wishlists }">
									<%@include file="/WEB-INF/views/include/listProduct.jsp"%>
								</c:forEach>

							</table>
						</div>
					</div>



				</div>
			</c:if>

		</div>
	</section>
	<!--End wishlist -->
	<%@include file="/WEB-INF/views/include/footer.jsp"%>
	<script type="text/javascript" src="assets/js/user/account.js"></script>

</body>
</html>