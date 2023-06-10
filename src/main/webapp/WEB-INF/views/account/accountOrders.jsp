<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="/WEB-INF/views/include/library.jsp"%>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<br>

<div class="container">
	<div class="row">
		<div class="col-3 d-none d-lg-block">
			<%@include file="/WEB-INF/views/account/menuProfile.jsp"%>
		</div>

		<div class="col-9  p-3">


			<div class="h4 text-uppercase">Đơn hàng</div>
			<hr>
			<div class="row">
				<!-- table -->
				<div class="col-12">
					<div class="table-responsive">
						<table class="table text-nowrap">
							<thead class="table-success">
								<tr>
									<th>Chi Tiết</th>
									<th>Ngày Mua</th>
									<th>Ngày Giao Dự Kiến</th>
									<th>Sản Phẩm</th>
									<th>Tổng Tiền</th>
									<th>Trạng Thái</th>
								</tr>
							</thead>
							<c:forEach var="o" items="${orders }">
								<tbody>
									<tr>
										<td class="align-middle"><a
											href="order/orderDetail.htm?orderId=${o.orderId }"><i
												class="bi bi-info-circle"></i></a></td>
										<td class="align-middle"><fmt:formatDate type="both"
												value="${o.orderTime}" pattern="dd-MM-yyyy hh:mm" /></td>
										<td class="align-middle"><fmt:formatDate type="both"
												value="${o.deliveryTime}" pattern="dd-MM-yyyy hh:mm" /></td>
										<td class="align-middle">

											<ul>
												<c:forEach var="orderDetail" items="${o.orderDetails }">
													<li>${orderDetail.product.productName }</li>
												</c:forEach>
											</ul>

										</td>

										<td class="align-middle"><fmt:formatNumber
												value="${o.price}" type="currency" currencySymbol="đ"
												maxFractionDigits="0" /></td>

										<td class="align-middle "><c:if test="${o.status == 0 }">
												<span class="badge bg-warning"> Chờ Xác Nhận </span>
											</c:if> <c:if test="${o.status == 1 }">
												<span class="badge bg-primary"> Đang Giao </span>
											</c:if> <c:if test="${o.status == 2 }">
												<span class="badge bg-success"> Đã Giao</span>
											</c:if> <c:if test="${o.status == 3 }">
												<span class="badge bg-danger"> Đã Hủy</span>
											</c:if></td>
									</tr>

								</tbody>

							</c:forEach>

						</table>
					</div>
				</div>



			</div>
		</div>

	</div>
</div>
<%@include file="/WEB-INF/views/include/footer.jsp"%>