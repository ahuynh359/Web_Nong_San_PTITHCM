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
			<div class="h4 text-uppercase">Đổi mật khẩu</div>
			<hr>
			<c:if test="${not empty message}">
				<c:choose>
					<c:when test="${message == 0}">
						<div class="  alert alert-danger alert-dismissible fade show"
							role="alert">
							Cập nhật thất bại!
							<button type="button" class="ms-auto btn-close"
								data-bs-dismiss="alert" aria-label="Close"></button>
						</div>


					</c:when>
					<c:when test="${message == 1}">
						<div class=" alert alert-success alert-dismissible fade show"
							role="alert">
							Cập nhật thành công!
							<button type="button" class="btn-close" data-bs-dismiss="alert"
								aria-label="Close"></button>
						</div>
					</c:when>

				</c:choose>
			</c:if>
			
			<form:form action="account/changePassword.htm" method="post"
				modelAttribute="password">
				<div class="row my-3">
					<label class="col-sm-4 col-form-label text-start">Mật khẩu
						hiện tại <label style="color: red;">*</label>
					</label>
					<div class="col-sm-8 pe-5">
						<form:input path="oldPass" type="password" class="form-control"
							required="true" value="" />
						<label class="mb-1"> <form:errors path="oldPass"
								cssClass="errors" />
						</label>
					</div>
				</div>

				<div class="row mb-3">
					<label class="col-sm-4 col-form-label text-start">Mật khẩu
						mới <label style="color: red;">*</label>
					</label>
					<div class="col-sm-8 pe-5">
						<form:input path="newPass" type="password" class="form-control"
							required="true" value="" />
						<label class="mb-1"> <form:errors path="newPass"
								cssClass="errors" />
						</label>
					</div>
				</div>

				<div class="row mb-3">
					<label class="col-sm-4 col-form-label text-start">Xác nhận
						mật khẩu <label style="color: red;">*</label>
					</label>
					<div class="col-sm-8 pe-5">
						<form:input path="confirmPass" type="password"
							class="form-control" required="true" />
						<label class="mb-1"> <form:errors path="confirmPass"
								cssClass="errors" />
						</label>
					</div>
				</div>

				<div class="text-center">
					<button type="submit" class="btn btn-success">Cập
						nhật</button>
				</div>
			</form:form>

		</div>

	</div>
</div>
<script type="text/javascript" src="assets/js/user/account.js"></script>
<%@include file="/WEB-INF/views/include/footer.jsp"%>