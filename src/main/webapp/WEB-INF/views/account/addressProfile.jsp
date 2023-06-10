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

		<div class="col-9 p-3">
			<div class="my-3 p-3 bg-white rounded box-shadow">
				<div
					class="d-flex justify-content-between align-items-center border-bottom border-gray pb-4">
					<h3 class="  mb-0">My Address</h3>
					<a href="account/createAddress.htm" class="btn btn-success btn-sm"><i
						class="bi bi-plus-lg"></i>Tạo mới</a>
				</div>
				<c:choose>
					<c:when test="${message == 0}">
						<div class="  alert alert-danger alert-dismissible fade show"
							role="alert">
							Xóa thất bại!
							<button type="button" class="ms-auto btn-close"
								data-bs-dismiss="alert" aria-label="Close"></button>
						</div>


					</c:when>
					<c:when test="${message == 1}">
						<div class=" alert alert-success alert-dismissible fade show"
							role="alert">
							Xóa thành công!
							<button type="button" class="btn-close" data-bs-dismiss="alert"
								aria-label="Close"></button>
						</div>
					</c:when>

				</c:choose>

				<c:forEach var="a" items="${adresses }">
					<div class="media text-muted pt-3">
						<div class="media-body pb-3 mb-0 small  border-bottom border-gray">
							<div
								class="d-flex justify-content-between align-items-center w-100">
								<strong class="text-gray-dark">${account.getName() }<span
									class="border-start ms-2 border-1 border-dark"> <span class = "ms-2">(+84)</span>
										${account.phoneNumber }</span></strong>
								<div class="d-flex justify-content-between gap-3">
									<a href="account/addressUpdate.htm?addressID=${a.addressId }">Sửa</a>
									<c:if
										test="${a.addressId != account.defaultAddress.addressId }">
										<a href="account/delete.htm?addressID=${a.addressId}">Xóa</a>
									</c:if>

								</div>
							</div>

							<div
								class="d-flex justify-content-between align-items-center w-100 mt-2">
								<span class="d-block">${a.name }</span>
								<c:if test="${a.addressId != account.defaultAddress.addressId }">
									<a href="account/setDefault.htm?addressID=${a.addressId }"
										class="btn btn-outline-success btn-sm">Đặt mặc định</a>
								</c:if>
							</div>


							<div
								class="d-flex justify-content-between align-items-center w-100">
								<div class="d-block">${a.ward.name },
									${a.ward.district.name }, ${a.ward.district.province.name }</div>
							</div>
							<c:if test="${a.addressId == account.defaultAddress.addressId }">
								<div
									class="d-flex justify-content-between align-items-center w-100 mt-2">
									<div class="border border-primary p-1">

										<div class="text-primary">Mặc định</div>

									</div>
								</div>
							</c:if>


						</div>
					</div>

				</c:forEach>
			</div>

		</div>

	</div>

</div>
<script type="text/javascript" src="assets/js/user/account.js"></script>
