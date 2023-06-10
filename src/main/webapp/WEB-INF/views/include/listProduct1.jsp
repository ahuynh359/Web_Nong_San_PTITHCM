<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="col">
	<!-- card -->
	<div class="card card-product">
		<div class="card-body">

			<!-- badge -->
			<div class="text-center position-relative ">
				<c:if
					test="${p.coupon != null and p.coupon.checkVaildCoupon() == true}">
					<div class=" position-absolute top-0 start-0">
						<span class="badge bg-danger"><fmt:formatNumber
								type="percent" value="${p.coupon.discount}" /></span>

					</div>
				</c:if>
				<a href="product/detail.htm?productId=${p.productId }"> <img
					src="<c:url value="/assets/img/products/${p.image}"/>"
					alt="Product" class=" img-fluid"
					style="width: 200px; height: 200px">
				</a>

				<div
					class="card-product-action ${(p.quantity == 0)?  'invisible' : 'visible' }">
					<a href="product/detail.htm?productId=${p.productId }"
						class="btn-action"><i class="bi bi-eye"></i></a> <a
						href='<c:url value = "product/addToWishlist.htm?productId=${p.productId }"/>'
						class="btn-action"><i class="bi bi-heart"></i></a> <a
						href='<c:url value = "product/addToCart.htm?productId=${p.productId }"/>'
						class="btn-action"><i class="bi bi-cart-plus"></i></a>
				</div>

			</div>

			<!-- heading category -->
			<div class="text-small mt-2 mb-1 text-muted">
				<small>${p.category.name }</small>
			</div>

			<h2 class="fs-6 text-inherit text-success">${p.productName }</h2>


			<div class="d-flex justify-content-between align-items-center mt-3">
				<div>

					<c:if
						test="${p.coupon != null and p.coupon.checkVaildCoupon() == true}">
						<span class="text-dark"><fmt:formatNumber
								value="${p.price - (p.price * p.coupon.discount)}"
								type="currency" currencySymbol="đ" maxFractionDigits="0" /></span>
						<span class="text-decoration-line-through text-muted"> <fmt:formatNumber
								value="${p.price }" type="currency" currencySymbol="đ"
								maxFractionDigits="0" />
						</span>
					</c:if>

					<c:if test="${p.coupon.discount == null or  p.coupon.checkVaildCoupon() == false}">
						<span class="text-dark"> <fmt:formatNumber
								value="${p.price }" type="currency" currencySymbol="đ"
								maxFractionDigits="0" />
						</span>
					</c:if>

				</div>


			</div>
		</div>
	</div>
</div>