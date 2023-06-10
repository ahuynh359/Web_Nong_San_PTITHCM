<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/library.jsp"%>
<%@include file="/WEB-INF/views/include/header.jsp"%>


<link href="assets/css/user/product.css" rel="stylesheet" />
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
<div class="my-4">
	<div class="container">
		<div class="row ">
			<div class="col-12">
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb mb-0 text-muted fs-6 fw-semibold">
						<li class="breadcrumb-item  "><a href="index.htm"
							class="text-decoration-none text-success "><s:message
									code="product.breadcrumb_1" /> </a></li>
						<li class="breadcrumb-item  "><a
							href="product/index.htm?categoryId=${currentCategoryId}"
							class="text-decoration-none text-success "><s:message
									code="product.breadcrumb_2" /> </a></li>
						<li class="breadcrumb-item active" aria-current="page"
							class="text-decoration-none"><s:message
								code="product.breadcrumb_3" /></li>
					</ol>

				</nav>
			</div>
		</div>
	</div>
</div>


<div class=" mt-8 mb-lg-14 mb-8">
	<div class="container">
		<div class="row gx-10">

			<%@include file="/WEB-INF/views/product/productDetail.jsp"%>
			<%@include file="/WEB-INF/views/product/rating.jsp"%>
			<%@include file="/WEB-INF/views/product/relatedItems.jsp"%>
		</div>



	</div>
</div>



<%@include file="/WEB-INF/views/include/footer.jsp"%>
<script type="text/javascript" src="assets/js/user/product.js"></script>
<script type="text/javascript" src="assets/js/user/account.js"></script>

</body>
</html>


</html>