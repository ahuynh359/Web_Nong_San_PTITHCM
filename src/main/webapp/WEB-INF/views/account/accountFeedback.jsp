<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<base href="${pageContext.servletContext.contextPath}/">
<%@include file="/WEB-INF/views/include/library.jsp"%>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<br>
<link rel="stylesheet" href="assets/css/user/rating.css" type="text/css">
<div class="container">
	<div class="row">
		<div class="col-3">
			<%@include file="/WEB-INF/views/account/menuProfile.jsp"%>
		</div>

		<div class="col-9 p-3">
			<div class="h4 text-uppercase">Đánh giá sản phẩm</div>
			<hr>
			<div class="col text-end">
				<div>
					<c:if test="${message == 1 }">
						<span class="badge bg-success"> Đã Đánh Giá </span>
					</c:if>
					<c:if test="${message == 2}">
						<span class="badge bg-danger"> Chưa Đánh Giá </span>
					</c:if>
				</div>

			</div>




			<form:form action="account/feedback.htm?productId=${p.productId }"
				method="post" modelAttribute="feedback">
				<h1>${result }</h1>
				<div class="row">

					<div class="col-12">
						<a target="_blank"
							href="product/detail.htm?productId=${p.productId}"> <img
							src="<c:url value="/assets/img/products/${p.image} "/>"
							style="width: 80px; height: 80px;">

						</a>
						<h3>${p.productName }</h3>
					</div>



					<c:if test="${message == 1 }">

						<div class="col-12  mb-2">
							<c:forEach begin="1" end="5" varStatus="index">
								<c:choose>
									<c:when test="${index.count <= feedback.ratingStar}">
										<i class="bi bi-star-fill text-warning"></i>
									</c:when>
									<c:otherwise>
										<i class="bi bi-star-fill " style="color: #e6e6e6;"></i>
									</c:otherwise>
								</c:choose>
							</c:forEach>

						</div>
						<div class="col-12 mt-2  text-muted text-sm	">
							<fmt:formatDate value="${feedback.postingDate}"
								pattern="dd-MM-yyyy" />
						</div>

						<div class="col-12  mt-2">

							<label>${feedback.feedbackContent }</label>


						</div>
					</c:if>
					<c:if test="${message == 2 }">

						<div class="col-12	">
							<div class="h5">${order.product.productName }</div>
							<label class="col-sm-3 col-form-label text-start">Stars:
							</label>
							<div class="col-sm-9">
								<form:input type="number" id="star-input" class="form-control"
									path="ratingStar" min="1" max="5"></form:input>
							</div>
							<label class="col-sm-3 col-form-label text-start mt-2">Feedback:
							</label>
							<div class="col-sm-9">
								<div class="form-floating">
									<form:textarea class="form-control my-2" path="feedbackContent"
										placeholder="Leave a comment here" id="description"
										style="height: 100px"></form:textarea>
								</div>
							</div>
						</div>
						<div class="text-start mt-2">
							<button name="btnAdd" class="btn btn-success text-white">Thêm</button>
						</div>

					</c:if>

				</div>


			</form:form>

		</div>

	</div>
</div>

<script type="text/javascript" src="assets/ckeditor/ckeditor.js">
	
</script>

<script>
	CKEDITOR.replace('description');
</script>

<%@include file="/WEB-INF/views/include/footer.jsp"%>tml>
