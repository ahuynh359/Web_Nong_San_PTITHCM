<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--JSTL  -->

<section class="">
	<div class="container">
		<div class="row">

			<div class="col-md-6 mt-3">
				<!-- img slide -->
				<img src="<c:url value="/assets/img/products/${product.image}"/>"
					class="img-thumbnail" style="width: 400px; height: 400px">

			</div>
			<div class="col-md-6">
				<div class="ps-lg-10 mt-6 mt-md-0">

					<!-- heading -->
					<h1 class="mb-1 text-success">${product.productName}</h1>
					<div class="mb-4">
						<!-- rating -->
						<c:forEach begin="1" end="5" varStatus="index">
							<c:choose>
								<c:when test="${index.count <= avgStar}">
									<i class="bi bi-star-fill text-warning"></i>
								</c:when>
								<c:otherwise>
									<i class="bi bi-star-fill " style="color: #e6e6e6;"></i>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<span class="ms-2 text-success">(${feedbacks.size()}
							reviews)</span>
					</div>
					<div class="fs-4">

						<!-- price -->
						<c:if
							test="${product.coupon != null and product.coupon.checkVaildCoupon() == true}">
							<span class="fw-bold text-dark"><fmt:formatNumber
									value="${product.price - product.price * product.coupon.discount}"
									type="currency" currencySymbol="đ" maxFractionDigits="0" /></span>

							<span class="text-decoration-line-through text-muted"><fmt:formatNumber
									value="${product.price}" type="currency" currencySymbol="đ"
									maxFractionDigits="0" /></span>
							<span><small class="fs-6 ms-2 text-danger"><fmt:formatNumber
										value="${product.coupon.discount}" type="percent" /> <span>
										Off</span></small></span>
						</c:if>
						<c:if
							test="${product.coupon.discount == null or  product.coupon.checkVaildCoupon() == false}">
							<span class="fw-bold text-dark"><fmt:formatNumber
									value="${product.price}" type="currency" currencySymbol="đ"
									maxFractionDigits="0" /></span>
						</c:if>
					</div>


					<hr class="my-6">


				</div>

				<div class="mt-3 row justify-content-start g-2 align-items-center">

					<div class="col-xxl-4 col-lg-4 col-md-5 col-5 d-grid">
						<!-- button -->
						<!-- btn -->
						<a href="product/addToCart.htm?productId=${product.productId }"
							class="btn btn-success btn-lg  ${(product.quantity == 0) ? 'disabled' : '' }">
							<c:if test="${(product.quantity == 0) }">
								<s:message code="wishlist.out_of_item" />
							</c:if> <c:if test="${(product.quantity > 0) }">
								<s:message code="wishlist.add_to_cart" />
							</c:if>
						</a>



					</div>
					<div class="col-md-4 col-4">
						<!-- btn -->
						<a
							href='<c:url value = "product/addToWishlist.htm?productId=${product.productId }"/>'
							class="btn btn-light  ${(product.quantity == 0) ? 'disabled' : '' } "><i
							class="bi bi-heart"></i></a>

					</div>
				</div>
				<!-- hr -->
				<hr class="my-6">
				<div>
					<!-- table -->
					<table class="table  table-borderless mb-0">

						<tbody>
							<tr>
								<td class="fw-bold">ID:</td>
								<td>${product.productId }</td>

							</tr>

							<tr>
								<td class="fw-bold"><s:message code="product.category" />:</td>
								<td>${product.category.name }</td>

							</tr>

							<tr>
								<td class="fw-bold"><s:message code="product.total" />:</td>
								<c:if test="${(product.quantity == 0) }">
									<td><s:message code="wishlist.out_of_item" /></td>

								</c:if>
								<c:if test="${(product.quantity > 0) }">
									<td>${product.quantity }${product.unit }</td>
								</c:if>


							</tr>
							<tr>
								<td class="fw-bold"><s:message code="product.des" />:</td>
								<td>${product.detail }</td>

							</tr>
							<tr>
								<td class="fw-bold"><s:message code="product.unit" />:</td>
								<td>${product.unit }</td>

							</tr>




						</tbody>
					</table>

				</div>

			</div>

		</div>

	</div>
</section>
