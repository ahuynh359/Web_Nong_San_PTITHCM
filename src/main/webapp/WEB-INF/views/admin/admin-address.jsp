<%@include file="/WEB-INF/views/include/library.jsp"%>

<style>
.hidden {
	display: none !important;
}
</style>
<script src="<c:url value="/assets/js/admin/AddressHandler.js"/>"></script>
<body>
	<%@include file="/WEB-INF/views/admin/admin-header-nav.jsp"%>
	<div class="container mt-5">
		<div class="row">
			<div class="col-md-12">
				<div
					class="d-flex justify-content-between align-items-center activity">
					<div>
						<span class="fs-3 fw-bold">Address</span>
					</div>
					<div>
						<button onclick="CreateAddress()" class="btn btn-outline-success ">
								<p class="m-0 p-1">
									<i class="pe-1 fs-5 fw-bold ti-plus"></i> Add new address
								</p>
							</button>
					</div>
				</div>
				<div class="mt-3">
					<ul class="list list-inline">
					<c:if test="${not empty addresses}">
						<c:forEach varStatus="status" var="item" items="${addresses}">
							<li
								class="mt-4 pb-2 d-flex justify-content-between border-bottom border-3">
								<div class="d-flex flex-row align-items-center">
									<div class="ml-2">
										<div class="d-flex flex-row">
											<h6 class="pe-2 pt-2 pb-2 border-end border-2">
												<i class="ti-stamp"></i> ${user.lastName } ${user.firstName }
											</h6>
											<p class="p-2 mb-0 text-black-50">${user.phoneNumber }</p>
										</div>
										<div class="d-flex flex-column mt-1 text-black-50">
											<span class="ml-2">${item.name }</span> <span>${item.ward.name },
												${item.ward.district.name },
												${item.ward.district.province.name }</span>
										</div>
									</div>
								</div>
								<div class="d-flex align-items-center">
									<button class="m-2 btn btn-outline-info"
										onclick="UpdateAddress(${item.addressId }, ${item.ward.wardId}, ${ item.ward.district.districtId}, ${item.ward.district.province.provinceId }, '${item.name}' )">

										<i class="ti-pencil-alt"></i>
									</button>
									<a href="address/delete.htm${item.addressId }"><button
											class="m-2 btn btn-outline-danger">
											<i class="ti-trash"></i>
										</button></a>
									<c:if test="${empty user.defaultAddress or not empty user.defaultAddress and item.addressId ne user.defaultAddress.addressId}">
										<div>
											<a href="set-addr-default${ item.addressId}.htm"><button class="btn btn-outline-success">Set as default</button></a>
										</div>
									</c:if>
									<c:if test="${not empty user.defaultAddress and item.addressId eq user.defaultAddress.addressId}">
										<div>
											<nav>Default Address</nav>
										</div>
									</c:if>
								</div>
							</li>
						</c:forEach>
						</c:if>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<div class="position-absolute top-0 start-0"
		style="width: 100vw; height: 100vh; background-color: rgba(0, 0, 0, 0.4);"
		id="address-form-panel">
		<div
			class="d-flex justify-content-center align-items-center w-100 h-100">
			<div class=" bg-light mt-2 opacity-100 "
				style="width: 500px; height: 350px;">
				<div class="p-2 d-flex justify-content-between align-items-center">
					<h5 class="m-1 fw-bold">Update Address</h5>
					<button type="button" class="btn btn-outline-danger"
						onclick="CloseForm()">
						<i class="ti-close"></i>
					</button>
				</div>
				<form:form id="address-form" method="post" action="${path }"
					modelAttribute="useraddress">
					<div>
						<div class="m-2 p-3">
							<div class="form-group row">
								<div class="col-md-6">
									<label for="province">Province:</label>
									<form:select class="form-control" id="province"
										path="provinceId">
										<form:option value="0">-- Select Province --</form:option>
										<c:forEach items="${address.provinceBean}" var="province">
											<option value="${province.id}">${province.name}</option>
										</c:forEach>
									</form:select>
								</div>
								<div class="col-md-6">
									<label for="district">District:</label>
									<form:select path="districtId" class="form-control"
										id="district">
										<option value="">-- Select District --</option>
										<c:forEach items="${address.districtBean}" var="district">
											<option value="${district.id}"
												data-province="${district.province.id}">${district.name}</option>
										</c:forEach>
									</form:select>
								</div>

							</div>
							<div class="form-group">
								<label for="ward">Ward:</label>
								<form:select class="form-control" id="ward" path="wardId">
									<option value="">-- Select Ward --</option>
									<c:forEach items="${address.wardBean}" var="ward">
										<option value="${ward.id}" data-district="${ward.district.id}">${ward.name}</option>
									</c:forEach>
								</form:select>
							</div>

							<label class="labels">Address Line</label>
							<form:input id="address-input" type="text" class="form-control"
								placeholder="enter address line" value="" path="addressLine" />
							<script>
								lazyLoading()
							</script>
						</div>
						<div class="p-3 d-flex align-items-center justify-content-center">
							<a href="#"><button type="submit" class="btn btn-success">Submit</button></a>
						</div>
					</div>
				</form:form>
			</div>

		</div>
	</div>
</body>
</html>