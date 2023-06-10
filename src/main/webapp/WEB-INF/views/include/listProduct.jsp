<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<tbody>
	<tr>
		<td class="align-middle">
			<div class="d-flex align-items-center">
				<div class="image">
					<a href="product/detail.htm?productId=${c.product.productId }"><img
						src="<c:url value="/assets/img/products/${c.product.image}"/>"
						class="icon-shape" alt="" width="200" height="200"> </a>
				</div>
			</div>


		</td>
		<td class="align-middle">
			<div class="d-flex align-items-center">
				<div class="text">
					<h5 class="fs-6 mb-0">
						<a href="product/detail.htm?productId=${c.product.productId }"
							class="text-inherit link-success
																">${c.product.productName }</a>
					</h5>
					<small class="text-muted text-wrap">${c.product.unit }</small>
				</div>
			</div>
		</td>

		<td class="align-middle"><c:if
				test="${c.product.coupon != null and c.product.coupon.checkVaildCoupon() == true}">
				<span class="text-dark fw-bold"><fmt:formatNumber
						value="${c.product.price - (c.product.price * c.product.coupon.discount)}" type="currency"
						currencySymbol="đ" maxFractionDigits="0" /></span>
				<span class="text-decoration-line-through text-muted"> <fmt:formatNumber
						value="${c.product.price }" type="currency" currencySymbol="đ"
						maxFractionDigits="0" />
				</span>
			</c:if> <c:if
				test="${c.product.coupon.discount == null or  c.product.coupon.checkVaildCoupon() == false}">
				<span class="text-dark fw-bold"> <fmt:formatNumber
						value="${c.product.price }" type="currency" currencySymbol="đ"
						maxFractionDigits="0" />
				</span>
			</c:if></td>
		<td class="align-middle"><a
			href='<c:url value = "product/addToCart.htm?productId=${c.product.productId}"/>'
			type="button"
			class="btn btn-success  btn-sm ${(c.product.quantity == 0) ? 'disabled' : '' }">
				<c:if test="${(c.product.quantity == 0) }">
					<s:message code="wishlist.out_of_item" />
				</c:if> <c:if test="${(c.product.quantity > 0) }">
					<s:message code="wishlist.add_to_cart" />
				</c:if>
		</a></td>

		<td class="align-middle "><a
			href='<c:url value = "wishlist/delete/${c.product.productId}.htm"/>'
			class="text-muted"> <i class="bi bi-trash"></i>
		</a></td>
	</tr>

</tbody>
