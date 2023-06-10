<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="/WEB-INF/views/include/library.jsp"%>
<%@include file="/WEB-INF/views/include/header.jsp"%>

<br>
<script src="<c:url value="/assets/js/admin/AddressHandler.js"/>"></script>

<div class="container">
	<div class="row">
		<div class="col-3 d-none d-lg-block">
			<%@include file="/WEB-INF/views/account/menuProfile.jsp"%>
		</div>

		<div class="col-9 p-3">
			<div class="h4 text-uppercase">Chỉnh Sửa Địa Chỉ</div>
			<hr>

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


			<form:form action="account/update.htm?addressID=${addressID }"
				id="address-form" modelAttribute="userAddress" method="post">

				<div class="row mb-3">
					<label class="col-sm-3 col-form-label text-start" for="province">Province:</label>
					<div class="col-sm-8">
						<form:select class="form-select"
							aria-label="Default select example" id="province"
							path="provinceId">
							<form:option value="0">-- Select province--</form:option>
							<c:forEach items="${address.provinceBean}" var="province">
								<option value="${province.id}">${province.name}</option>
							</c:forEach>
						</form:select>
					</div>
				</div>

				<div class="row mb-3">
					<label class="col-sm-3 col-form-label text-start" for="district">Quận/Huyện:
					</label>
					<div class="col-sm-8">
						<form:select path="districtId" class="form-select"
							aria-label="Default select example" id="district">
							<option value="">--Select District--</option>
							<c:forEach items="${address.districtBean}" var="district">
								<option value="${district.id}"
									data-province="${district.province.id}">${district.name}</option>
							</c:forEach>
						</form:select>
					</div>
				</div>

				<div class="row mb-3">
					<label class="col-sm-3 col-form-label text-start" for="ward">Phường/Xã:
					</label>
					<div class="col-sm-8">
						<form:select id="ward" path="wardId" class="form-select"
							aria-label="Default select example">
							<option value="">--Select Ward--</option>
							<c:forEach items="${address.wardBean}" var="ward">
								<option value="${ward.id}" data-district="${ward.district.id}">${ward.name}</option>
							</c:forEach>
						</form:select>
					</div>
				</div>

				<div class="row mb-3">
					<label class="col-sm-3 col-form-label text-start">Địa chỉ:
					</label>
					<div class="col-sm-8">
						<form:textarea id="address-input" type="text" class="form-control"
							placeholder="enter address line" value="${addressObject.name}"
							path="addressLine" rows="3" />
					</div>
				</div>
				<script>
					lazyLoading()
				</script>

				<div class="row mb-3 ">
					<label class="col-sm-3 col-form-label"></label>
					<div class="col-sm-8">
						<a href="#">
							<button type="submit" class="btn btn-success">Submit</button>
						</a>
					</div>
				</div>

			</form:form>
		</div>
	</div>


</div>
<script>UpdateAddress(${addressID }, ${addressObject.ward.wardId}, ${ addressObject.ward.district.districtId}, ${addressObject.ward.district.province.provinceId }, '${addressObject.name}' )</script>
<script type="text/javascript" src="assets/js/user/account.js"></script>
