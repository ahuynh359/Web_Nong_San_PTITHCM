<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<div class="d-flex flex-column flex-shrink-0 p-3 ">
	<div class="row px-4">
		<div class="col-3">
			<img src="<c:url value="/assets/img/account/${account.avatar} "/>"
				class="rounded-circle" style="width: 50px; height: 50px;">
		</div>
		<div class="col-9">
			<div class="fs-5 fw-bold ms-2">${account.getName() }</div>
		</div>
	</div>
	<hr>
	<ul class="nav nav-pills flex-column mb-auto ">
		<li class="nav-item"><a href="account/index.htm"
			class="nav-link text-primary" aria-current="page"> <i
				class="bi bi-info-circle-fill"></i></i> Thông tin tài khoản
		</a></li>

		<li class="nav-item"><a href="account/address.htm"
			class="nav-link text-primary" aria-current="page"> <i
				class="bi bi-geo-alt-fill"></i> Địa chỉ hiện tại
		</a></li>

		<li class="nav-item"><a href="account/changePassword.htm"
			class="nav-link text-primary" aria-current="page"> <i
				class="bi bi-key-fill"></i></i> Đổi mật khẩu
		</a></li>

		<li class="nav-item"><a href="account/ordersHistory.htm"
			class="nav-link text-primary" aria-current="page "> <i
				class="bi bi-file-earmark-fill"></i> Đơn hàng
		</a></li>
		<hr>

		<li class="nav-item"><a href="logout.htm"
			class="nav-link text-primary" aria-current="page "><i
				class="bi bi-box-arrow-in-right"></i> Đăng Xuất </a></li>

	</ul>

</div>
