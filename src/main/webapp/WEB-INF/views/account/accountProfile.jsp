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
			<div class="h4 text-uppercase">Hồ sơ của tôi</div>
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
					<c:when test="${message == 2}">
						<div class=" alert alert-danger alert-dismissible fade show"
							role="alert">
							Lưu hình ảnh thất bại!
							<button type="button" class="btn-close" data-bs-dismiss="alert"
								aria-label="Close"></button>
						</div>
					</c:when>
				</c:choose>
			</c:if>
			<form:form method="post" modelAttribute="profileBean"
				enctype="multipart/form-data" action="account/editProfile.htm">

				<div class="row">
					<div class="col-8">

						<div class="row my-3">
							<label class="col-sm-3 col-form-label text-start">First
								Name: </label>
							<div class="col-sm-9">
								<form:input path="firstName" type="text" class="form-control"
									required="true" />
								<label class="mb-1"> <form:errors path="firstName"
										cssClass="errors" />
								</label>
							</div>
						</div>
						<div class="row my-3">
							<label class="col-sm-3 col-form-label text-start">Last
								Name: </label>
							<div class="col-sm-9">
								<form:input path="lastName" type="text" class="form-control"
									required="true" />
								<label class="mb-1"> <form:errors path="lastName"
										cssClass="errors" />
								</label>
							</div>
						</div>
						<div class="row my-3">
							<label class="col-sm-3 col-form-label text-start">Email:
							</label>
							<div class="col-sm-9">
								<form:input path="email" type="text" class="form-control"
									required="true" />
								<label class="mb-1"> <form:errors path="email"
										cssClass="errors" />
								</label>
							</div>

						</div>
						<div class="row my-3">
							<label class="col-sm-3 col-form-label text-start">SDT: </label>
							<div class="col-sm-9">
								<form:input path="phoneNumber" type="text" class="form-control"
									required="true" />
								<label class="mb-1"> <form:errors path="phoneNumber"
										cssClass="errors" />
								</label>
							</div>
						</div>
						<div class="row mb-3">
							<label class="col-sm-3 col-form-label"></label>
							<div class="col-sm-9">
								<button type="submit" class="btn btn-success ">Cập nhật</button>
							</div>
						</div>

					</div>

					<div class="col-4 border-start text-center mt-2 p-4">
						<form:input path="avatar" class="form-control" type="file"
							accept="image/*" id="formFile" onchange="loadFile(event)" />
						<img src="<c:url value="/assets/img/account/${account.avatar} "/>"
							id="output" class="mt-2 rounded-circle" width="180px"
							height="180px" class="mv-10" />


					</div>
				</div>

			</form:form>
		</div>

	</div>
</div>


<script type="text/javascript" src="assets/js/user/account.js"></script>

<%@include file="/WEB-INF/views/include/footer.jsp"%>