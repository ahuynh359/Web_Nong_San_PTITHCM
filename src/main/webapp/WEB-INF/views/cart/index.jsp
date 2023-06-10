<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/library.jsp"%>
<%@include file="/WEB-INF/views/include/header.jsp"%>

<div class="my-4">
	<div class="container">
		<div class="row ">
			<div class="col-12">
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb mb-0 text-muted fs-6 fw-semibold">
						<li class="breadcrumb-item  "><a href="index.htm"
							class="text-decoration-none text-success "><s:message
									code="cart.breadcrumb_1" /> </a></li>
						<li class="breadcrumb-item active" aria-current="page"
							class="text-decoration-none"><s:message
								code="cart.breadcrumb_2" /></li>
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
						<s:message code="cart.title" />
					</h1>
					<p class="mb-4">
						<c:if test="${carts.size() > 0 }">
							<span>${carts.size()}</span>
							<s:message code="cart.find" />
						</c:if>
						<c:if test="${carts.size() == 0 }">
							<div class="mt-2 alert alert-warning  green-alert section"
								role="alert">
								<s:message code="cart.none" />
							</div>
						</c:if>
					</p>
				</div>


			</div>
		</div>


		<div class="row">
			<div class="col-12 ">
				<div class="mb-4 ">
					<div class="d-flex">
						<div class="fw-bold text-success">
							<i class="bi bi-geo-alt-fill"></i> Địa chỉ nhận hàng
						</div>

						<div class="col text-end">
							<a class="btn btn-outline-success btn-sm"
								href="account/address.htm" role="button">Thay đổi</a>
						</div>
					</div>


					<div class="h5 ps-3">${account.getName() }
						<span>(+84)</span> ${account.phoneNumber }
					</div>
					<div class="text-secondary fst-italic">
						<c:if test="${account.defaultAddress == null }">
				Chưa có địa chỉ mặc định
			</c:if>
						<c:if test="${account.defaultAddress != null }">
			${account.defaultAddress.name  }, ${account.defaultAddress.ward.name  }, ${account.defaultAddress.ward.district.name},${account.defaultAddress.ward.district.province.name  }   
			</c:if>
					</div>
				</div>
			</div>
		</div>

		<c:if test="${carts.size() > 0 }">
			<div class="row">
				<!-- table -->
				<div class="col-12">
					<div class="table-responsive">
						<table class="table text-nowrap">
							<thead class="table-success">
								<tr>
									<th><s:message code="cart.name" /></th>
									<th><s:message code="cart.des" /></th>
									<th><s:message code="cart.price" /></th>
									<th><s:message code="cart.amount" /></th>
									<th><s:message code="cart.total" /></th>
									<th><s:message code="cart.status" /></th>
									<th><s:message code="cart.remove" /></th>
								</tr>
							</thead>
							<c:forEach var="c" items="${carts }">
								<tbody>
									<tr>
										<td class="align-middle">
											<div class="d-flex align-items-center">
												<div class="image">
													<a href="#"><img
														src="<c:url value="/assets/img/products/${c.product.image}"/>"
														class="icon-shape" alt="" width="200" height="200">
													</a>
												</div>
											</div>


										</td>
										<td class="align-middle">
											<div class="d-flex align-items-center">
												<div class="text">
													<h5 class="fs-6 mb-0">
														<a
															href="product/detail.htm?productId=${c.product.productId }"
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
														value="${c.product.price - (c.product.price * c.product.coupon.discount)}"
														type="currency" currencySymbol="đ" maxFractionDigits="0" /></span>
												<span class="text-decoration-line-through text-muted">
													<fmt:formatNumber value="${c.product.price }"
														type="currency" currencySymbol="đ" maxFractionDigits="0" />
												</span>
											</c:if> <c:if
												test="${c.product.coupon.discount == null or  c.product.coupon.checkVaildCoupon() == false}">
												<span class="text-dark fw-bold"> <fmt:formatNumber
														value="${c.product.price }" type="currency"
														currencySymbol="đ" maxFractionDigits="0" />
												</span>
											</c:if></td>
										<td class="align-middle"><a role="button"
											href="cart/quantity/minus.htm?productID=${c.product.productId}&quantity=${c.quantity}"
											class="  btn btn-light ${c.quantity == 1 ? 'disabled' : ''}">-</a>
											<label class="border border-light px-3 py-1 pb-1">${ c.quantity}</label>
											<a role="button"
											href="cart/quantity/plus.htm?productID=${c.product.productId}&quantity=${c.quantity}"
											class="btn btn-light ${c.quantity == c.product.quantity ? 'disabled' : ''}">+</a></td>
										<td class="align-middle"><c:if
												test="${c.product.coupon != null and c.product.coupon.checkVaildCoupon() == true}">
												<fmt:formatNumber
													value="${(c.product.price - (c.product.price * c.product.coupon.discount)) * c.quantity }"
													type="currency" currencySymbol="đ" maxFractionDigits="0" />
											</c:if> <c:if
												test="${c.product.coupon.discount == null or  c.product.coupon.checkVaildCoupon() == false}">
												<fmt:formatNumber value="${c.product.price * c.quantity }"
													type="currency" currencySymbol="đ" maxFractionDigits="0" />
											</c:if></td>

										<td class="align-middle"><c:if
												test="${(c.product.quantity == 0) }">
												<span class="badge bg-danger"> <s:message
														code="cart.out_of_item" />
												</span>
											</c:if> <c:if test="${(c.product.quantity > 0) }">
												<span class="badge bg-success"> <s:message
														code="cart.stocking" />
												</span>
											</c:if></td>

										<td class="align-middle "><a
											href='<c:url value = "cart/delete/${c.product.productId}.htm"/>'
											class="text-muted"> <i class="bi bi-trash"></i>
										</a></td>
									</tr>

								</tbody>

							</c:forEach>

						</table>
					</div>
				</div>



			</div>
		</c:if>

		<c:if test="${carts.size() > 0 }">
			<div class="row mb-4">
				<div class="ms-auto col-lg-4 col-sm-4 text-dark bg-opacity-10">
					<div class="  mb-5 mb-lg-0">
						<div class="card-body p-4">
							<div class="row">

								<div class="d-flex " style="font-weight: 500;">
									<p class="mb-2 me-2 me-auto ">
										<s:message code="cart.tempo" />
									</p>
									<p class="mb-2">
										<fmt:formatNumber value="${subtotal }" type="currency"
											currencySymbol="đ" maxFractionDigits="0" />
									</p>

								</div>
								<div class="d-flex " style="font-weight: 500;">
									<p class="mb-2 me-2 me-auto ">
										<s:message code="cart.sale" />
									</p>
									<p class="mb-2">
										<span>-</span>
										<fmt:formatNumber value="0" type="currency" currencySymbol="đ"
											maxFractionDigits="0" />
									</p>
								</div>
								<div class="d-flex pb-2 " style="font-weight: 500;">
									<p class="mb-2 me-2 me-auto ">
										<s:message code="cart.ship" />
									</p>
									<p class="mb-2">
										<fmt:formatNumber value="20000" type="currency"
											currencySymbol="đ" maxFractionDigits="0" />
									</p>
								</div>


								<hr class="p-1 ">
								<div class="d-flex " style="font-weight: 500;">
									<p class="mb-2 me-2 me-auto ">
										<s:message code="cart.total" />
									</p>
									<p class="mb-2">
										<fmt:formatNumber value="${subtotal + 20000 }" type="currency"
											currencySymbol="đ" maxFractionDigits="0" />
									</p>
								</div>


								<a href="#" type="button" class="btn btn-outline-primary mb-4 ">
									<s:message code="cart.continue_shopping" />
								</a>

								<!-- Button trigger modal -->
								<button type="button"
									class="btn btn-outline-success ${(canCheckOut == 0) ? 'disabled' : '' } ${(account.defaultAddress == null) ? 'disabled' : '' } "
									data-bs-toggle="modal" data-bs-target="#exampleModal">
									<s:message code="cart.checkout" />
								</button>

								<!-- Modal -->
								<div class="modal fade" id="exampleModal" tabindex="-1"
									aria-labelledby="exampleModalLabel" aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<h1 class="modal-title fs-5" id="exampleModalLabel">Confirm
													Order</h1>
												<button type="button" class="btn-close"
													data-bs-dismiss="modal" aria-label="Close"></button>
											</div>
											<div class="modal-body">Bạn có muốn xác nhận đặt đơn
												hàng ?</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-secondary"
													data-bs-dismiss="modal">Close</button>
												<a type="button"
													href="order/success.htm?totalPrice=${subtotal + 20000 }"
													class="btn btn-success "> <s:message
														code="cart.checkout" />
												</a>
											</div>
										</div>
									</div>
								</div>


							</div>


						</div>
					</div>

				</div>

			</div>
		</c:if>
	</div>
</section>





<!--End cart -->
<%@include file="/WEB-INF/views/include/footer.jsp"%>

</body>
</html>