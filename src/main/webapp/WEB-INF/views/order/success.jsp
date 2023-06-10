<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<base href="${pageContext.servletContext.contextPath}/">
<%@include file="/WEB-INF/views/include/library.jsp"%>
<%@include file="/WEB-INF/views/include/header.jsp"%>

<br>

<div class="container text-center">
	<div class="card mx-auto border-info" style="width: 50rem;">
		<div class="card-body">
			<h5 class="card-title text-success">Đặt hàng thành công!!!</h5>
			<p class="card-text">Cám ơn bạn đã đặt hàng! Shop sẽ xử lý đơn
				hàng của bạn trong thời gian nhanh nhất có thể!</p>
			<p class="card-text">
				Thời gian giao hàng dự kiến <span class="fw-bold"><fmt:formatDate
						 type = "both"  value="${orders.deliveryTime}" pattern="dd-MM-yyyy hh:mm" /></span>
			</p>
			<a class="btn btn-outline-success card-link" href="#" role="button"><i
				class="bi bi-house"></i> Quay về trang chủ</a> <a
				class="btn btn-outline-success card-link"
				href="account/ordersHistory.htm" role="button"><i
				class="bi bi-list-check"></i> Danh sách đơn hàng</a>
		</div>
	</div>
</div>

<br>

<%@include file="/WEB-INF/views/include/footer.jsp"%>