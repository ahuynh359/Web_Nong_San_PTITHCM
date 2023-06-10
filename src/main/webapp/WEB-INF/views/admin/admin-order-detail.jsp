<%@include file="/WEB-INF/views/include/library.jsp"%>

<body>



	<div class="row">

		<!-- Sidebar -->
		<div class="col-2 d-none d-lg-inline "><%@include
				file="/WEB-INF/views/admin/admin-header-nav.jsp"%></div>
		<div class="col-10 col-12-sm col-12-md">
			<div id="content-wrapper" class="d-flex flex-column">
				<nav
					class="  navbar navbar-light bg-white mb-4 static-top shadow d-none d-lg-inline">
					<%@include file="/WEB-INF/views/admin/admin-topbar.jsp"%>
				</nav>
				<!-- Main -->
				<div class="container">
					<div class="row mt-3">

						<div class="col-md-12 mb-4">
							<div class="d-md-flex justify-content-between align-items-center">
								<!-- pageheader -->
								<div>
									<h2>Order Detail</h2>
									<!-- breacrumb -->
									<nav aria-label="breadcrumb">
										<ol class="breadcrumb mb-0 text-muted fs-6 fw-semibold">
											<li class="breadcrumb-item  "><a
												href="admin/user/dashboard.htm"
												class="text-decoration-none text-success ">Dashboard </a></li>
											<li class="breadcrumb-item "><a
												href="admin/user/get-employee.htm"
												class="text-decoration-none text-success ">Order </a>
											<li class="breadcrumb-item active" aria-current="page"
												class="text-decoration-none">Order Detail</li>
										</ol>

									</nav>
								</div>

							</div>
						</div>
						<div class="container">
							<!-- row -->
							<div class="row ">
								<div class="col-xl-12 col-12 mb-5">
									<!-- card -->
									<div class="card h-100 card-lg">
										<div class="card-body p-6">
											<div class="d-md-flex justify-content-between">
												<div class="d-flex align-items-center mb-2 mb-md-0">
													<h2 class="mb-0">Order ID: ${order.orderId }</h2>
													<span class="badge bg-light-warning text-dark-warning ms-2">Pending</span>
												</div>

											</div>
											<div class="mt-8">
												<div class="row">
													<!-- address -->
													<div class="col-lg-4 col-md-4 col-12">
														<div class="mb-6">
															<h6>Customer Details</h6>
															<p class="mb-1 lh-lg">
																${order.account.getName() }<br>${order.account.email }<br>
																${order.account.phoneNumber }
															</p>
														</div>
													</div>
													<!-- address -->
													<div class="col-lg-4 col-md-4 col-12">
														<div class="mb-6">
															<h6>Shipping Address</h6>
															<p class="mb-1 lh-lg">${order.defaultAddress }</p>

														</div>
													</div>
													<!-- address -->
													<div class="col-lg-4 col-md-4 col-12">
														<div class="mb-6">
															<h6>Order Details</h6>
															<p class="mb-1 lh-lg">
																Order Date: <span class="text-dark"><fmt:formatDate
																		pattern="dd-MM-yyyy" value="${order.orderTime}" /></span><br>
																Order Total: <span class="text-dark"><fmt:formatNumber
																		value="${order.price}" type="currency"
																		currencySymbol="VND" maxFractionDigits="0" /></span>
															</p>
														</div>
													</div>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-12">
												<div class="table-responsive">
													<!-- Table -->
													<table class="table mb-0 text-nowrap table-centered">
														<!-- Table Head -->
														<thead class="bg-light">
															<tr>
																<th>Products</th>
																<th>Name</th>
																<th>Price</th>
																<th>Quantity</th>
																<th>Total</th>
															</tr>
														</thead>
														<!-- tbody -->
														<tbody>
															<c:forEach varStatus="status" var="o"
																items="${orderDetail}">
																<tr>
																	<td class="align-item"><a
																		href="product/detail.htm?productId=${o.product.productId }">
																			<img
																			src="<c:url value="/assets/img/products/${o.product.image} "/>"
																			style="width: 50px; height: 50px;">
																	</a></td>
																	<td class="align-item">
																		<h5 class="mb-0 h6">${o.product.productName }</h5>

																	</td>
																	<td><c:if test="${o.coupon != 0}">
																			<span class="text-dark fw-bold"><fmt:formatNumber
																					value="${o.product.price - (o.product.price * o.coupon)}"
																					type="currency" currencySymbol="VND"
																					maxFractionDigits="0" /></span>
																			<span class="text-decoration-line-through text-muted">
																				<fmt:formatNumber value="${o.product.price }"
																					type="currency" currencySymbol="VND"
																					maxFractionDigits="0" />
																			</span>
																		</c:if> <c:if test="${o.coupon == 0}">
																			<span class="text-dark fw-bold"> <fmt:formatNumber
																					value="${o.product.price }" type="currency"
																					currencySymbol="VND" maxFractionDigits="0" />
																			</span>
																		</c:if></td>
																	<td>${o.quantity }</td>
																	<td><c:if test="${o.coupon != 0}">
																			<span class="text-dark fw-bold"><fmt:formatNumber
																					value="${(o.product.price - (o.product.price * o.coupon)) * o.quantity}"
																					type="currency" currencySymbol="VND"
																					maxFractionDigits="0" /></span>
																		</c:if> <c:if test="${o.coupon == 0}">
																			<span class="text-dark fw-bold"> <fmt:formatNumber
																					value="${o.product.price * o.quantity }"
																					type="currency" currencySymbol="VND"
																					maxFractionDigits="0" />
																			</span>
																		</c:if></td>
																</tr>
															</c:forEach>

															<tr>
																<td class="border-bottom-0 pb-0"></td>
																<td class="border-bottom-0 pb-0"></td>
																<td colspan="1" class="fw-medium text-dark ">Sub
																	Total :</td>
																<td class="fw-medium text-dark "><fmt:formatNumber
																		value="${order.price - 20000}" type="currency"
																		currencySymbol="VND" maxFractionDigits="0" /></td>
															</tr>
															<tr>
																<td class="border-bottom-0 pb-0"></td>
																<td class="border-bottom-0 pb-0"></td>
																<td colspan="1" class="fw-medium text-dark ">Shipping</td>
																<td class="fw-medium text-dark  "><fmt:formatNumber
																		value="${20000}" type="currency" currencySymbol="VND"
																		maxFractionDigits="0" /></td>
															</tr>

															<tr>
																<td></td>
																<td></td>
																<td colspan="1" class="fw-semi-bold text-dark ">
																	<!-- text --> Grand Total
																</td>
																<td class="fw-semi-bold text-dark "><fmt:formatNumber
																		value="${order.price}" type="currency"
																		currencySymbol="VND" maxFractionDigits="0" /></td>
															</tr>

														</tbody>
													</table>
												</div>
											</div>
										</div>
										<div class="card-body p-6">
											<div class="row">
												<div class="col-md-6 mb-4 mb-lg-0">
													<h6>Payment Info</h6>
													<span>Cash on Delivery</span>
												</div>

											</div>
										</div>




									</div>

								</div>

							</div>

						</div>


					</div>


				</div>

			</div>
</body>
<script type="text/javascript"
	src="<c:url value="assets/js/user/account.js" />"></script>
</html>
