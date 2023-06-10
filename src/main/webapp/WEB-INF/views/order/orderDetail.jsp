<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<base href="${pageContext.servletContext.contextPath}/">
<%@include file="/WEB-INF/views/include/library.jsp"%>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<br>
<div class="container">
	<div class="row">

		<div class="col-12  p-3">
			<div class="row">
				<div class="col">
					<div class="h4 text-uppercase">Chi tiết đơn hàng</div>
				</div>
				<div class="col text-end">
					<div>
						<c:if test="${order.status == 0 }">
							<span class="badge bg-warning"> Chờ Xác Nhận </span>
						</c:if>
						<c:if test="${order.status == 1 }">
							<span class="badge bg-primary"> Đang Giao </span>
						</c:if>
						<c:if test="${order.status == 2 }">
							<span class="badge bg-success"> Đã Giao</span>
						</c:if>
						<c:if test="${order.status == 3 }">
							<span class="badge bg-danger"> Đã Hủy</span>
						</c:if>
					</div>

				</div>
			</div>
			<hr>
			<div class="row mb-1">
				<div class="col-9 border-end ">
					<div class="mb-4 ">

						<div class="fw-bold text-success">
							<i class="bi bi-geo-alt-fill"></i> Địa chỉ nhận hàng
						</div>

						<div class="h5 ps-3">${account.getName() }
							<span>(+84)</span> ${account.phoneNumber }
						</div>
						<div class="text-secondary fst-italic">
							${order.defaultAddress  }</div>
					</div>
				</div>

				<div class="col-3 mt-4">
					<div class="d-grid  ">
						<c:choose>
							<c:when test="${order.status == 0 }">

								<!-- Button trigger modal -->
								<button type="button" class="btn m-2 btn-sm btn-danger"
									data-bs-toggle="modal" data-bs-target="#exampleModal">
									Hủy yêu cầu</button>

								<!-- Modal -->
								<div class="modal fade" id="exampleModal" tabindex="-1"
									aria-labelledby="exampleModalLabel" aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<h1 class="modal-title fs-5" id="exampleModalLabel">Modal
													title</h1>
												<button type="button" class="btn-close"
													data-bs-dismiss="modal" aria-label="Close"></button>
											</div>
											<div class="modal-body">Bạn có muốn hủy yêu cầu đặt
												hàng ?</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-secondary"
													data-bs-dismiss="modal">Đóng</button>
												<a class="btn btn-danger"
													href="order/cancelRequest.htm?orderId=${order.orderId }"
													role="button">Hủy yêu cầu</a>

											</div>
										</div>
									</div>
								</div>
							</c:when>
						</c:choose>
					</div>
				</div>
			</div>

			<table class="table">
				<thead>
					<tr class="table-success">
						<th>Sản phẩm</th>
						<th>Đơn giá</th>
						<th>Số lượng</th>
						<th>Thành tiền</th>
						<th>Đánh giá</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="o" items="${order.orderDetails }">
						<tr>
							<td class="align-middle">
								<div class="d-flex align-items-center">
									<div class="col-auto">
										<a target="_blank"
											href="product/detail.htm?productId=${o.product.productId }">
											<img
											src="<c:url value="/assets/img/products/${o.product.image} "/>"
											style="width: 50px; height: 50px;">
										</a>
									</div>

									<div class="col py-2">
										<div>${o.product.productName}</div>
									</div>
								</div>
							</td>
							<td class="align-middle">
								<div class="d-flex align-items-center">
									<c:if test="${o.coupon != 0}">
										<span class="text-dark fw-bold"><fmt:formatNumber
												value="${o.product.price - (o.product.price * o.coupon)}"
												type="currency" currencySymbol="đ" maxFractionDigits="0" /></span>
										<span class="text-decoration-line-through text-muted">
											<fmt:formatNumber value="${o.product.price }" type="currency"
												currencySymbol="đ" maxFractionDigits="0" />
										</span>
									</c:if>
									<c:if test="${o.coupon == 0}">
										<span class="text-dark fw-bold"> <fmt:formatNumber
												value="${o.product.price }" type="currency"
												currencySymbol="đ" maxFractionDigits="0" />
										</span>
									</c:if>
								</div>
							</td>
							<td class="align-middle">
								<div class="d-flex align-items-center">${o.quantity}</div>
							</td>
							<td class="align-middle">
								<div class="d-flex align-items-center">
									<c:if test="${o.coupon != 0}">
										<span class="text-dark fw-bold"><fmt:formatNumber
												value="${(o.product.price - (o.product.price * o.coupon)) * o.quantity}"
												type="currency" currencySymbol="đ" maxFractionDigits="0" /></span>
									</c:if>
									<c:if test="${o.coupon == 0}">
										<span class="text-dark fw-bold"> <fmt:formatNumber
												value="${o.product.price * o.quantity }" type="currency"
												currencySymbol="đ" maxFractionDigits="0" />
										</span>
									</c:if>
								</div>
							</td>
							<td class="align-middle">
								<div class="d-flex align-items-center">
									<!-- icon feedback -->
									<c:choose>
										<c:when test="${order.status == 2 }">
											<a class="link-success"
												href="account/feedback.htm?productId=${o.product.productId }"
												role="button"><i class="bi bi-chat-left-text-fill"></i></a>
										</c:when>
										<c:otherwise>
											<i class="bi bi-chat-left-text-fill" style="color: #9FA5AA"></i>
										</c:otherwise>
									</c:choose>
								</div>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

			<div class="ms-auto col-lg-4 col-sm-4 text-dark bg-opacity-10">
				<div class="  mb-5 mb-lg-0">
					<div class="card-body p-4">
						<div class="row">

							<div class="d-flex " style="font-weight: 500;">
								<p class="mb-2 me-2 me-auto ">
									<s:message code="cart.tempo" />
								</p>
								<p class="mb-2">
									<fmt:formatNumber value="${order.price - 20000 }"
										type="currency" currencySymbol="đ" maxFractionDigits="0" />
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
									<fmt:formatNumber value="${order.price }" type="currency"
										currencySymbol="đ" maxFractionDigits="0" />
								</p>
							</div>


						</div>


					</div>
				</div>

			</div>


		</div>

	</div>
</div>

<%@include file="/WEB-INF/views/include/footer.jsp"%>