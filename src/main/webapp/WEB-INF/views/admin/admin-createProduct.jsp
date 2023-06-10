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
									<h2>Create Product</h2>
									<!-- breacrumb -->
									<nav aria-label="breadcrumb">
										<ol class="breadcrumb mb-0 text-muted fs-6 fw-semibold">
											<li class="breadcrumb-item  "><a
												href="admin/user/dashboard.htm"
												class="text-decoration-none text-success ">Dashboard </a></li>
											<li class="breadcrumb-item "><a
												href="admin/products.htm"
												class="text-decoration-none text-success ">Product </a>
											<li class="breadcrumb-item active" aria-current="page"
												class="text-decoration-none">Create Product</li>
										</ol>

									</nav>
								</div>

							</div>
						</div>

						<div class=" col-md-6 offset-md-3 card p-5 ">
							<form:form id="product-form" method="post" action=""
								modelAttribute="productForm" class="row m-3"
								enctype="multipart/form-data">
								<div class="col-md-12 mt-2">
									<label for="inputNameProduct" class="form-label">Name
										product</label>
									<form:input path="productName" class="form-control"
										id="inputNameProduct" />
								</div>
								<div class="col-md-5 mt-2">
									<label for="inputCategory" class="form-label">Category
										Type</label>
									<form:select path="categoryId" id="inputCategory"
										class="form-select" items="${categories }"
										itemValue="categoryId" itemLabel="name">
									</form:select>
								</div>
								<div class="col-md-3 mt-2">
									<label for="inputQuantity" class="form-label">Quantity</label>
									<form:input path="quantity" type="number" class="form-control"
										id="inputQuantity" />
								</div>
								<div class="col-md-3 mt-2">
									<label for="inputUnit" class="form-label">Unit</label>
									<form:input path="unit" type="text" class="form-control"
										id="inputUnit" />
								</div>
								<div class="col-md-6 mt-2">
									<label for="inputImage" class="form-label">Image
										Archieve</label>
									<form:input type="file" class="form-control" id="inputImage"
										path="imageFile" accept="image/*" />
								</div>
								<div class="col-md-5 mt-2">
									<label for="inputPrice" class="form-label">Price</label>
									<form:input path="price" type="number" class="form-control"
										id="inputPrice" inputmode="numeric" />
								</div>
								<div class="col-md-6 mt-2">
									<label for="inputDate" class="form-label">Date Posting</label>
									<form:input type="date" class="form-control" id="inputDate"
										path="postingDate" />
								</div>
								<div class="col-md-6 mt-2">
									<label for="inputDSId" class="form-label">Discount
										Apply</label>
									<form:select path="discountId" id="inputDSId"
										class="form-select" items="${coupons }" itemValue="couponId"
										itemLabel="name">
									</form:select>
								</div>
								<div class="col-md-12 mt-2">
									<div class="form-floating mb-3">
										<form:input type="text" class="form-control" path="detail"
											placeholder="Leave a detail here" id="inputDetail"
											style="height: 100px" />
										<label for="inputDetail">Detail</label>
									</div>
								</div>
								<div
									class="col-12 mt-2 d-flex align-items-center justify-content-center">
									<button type="submit" class="btn btn-primary">Submit</button>
								</div>
							</form:form>
						</div>
					</div>
				</div>
				<!-- End Main -->
			</div>


		</div>

	</div>





</body>
<script type="text/javascript"
	src="<c:url value="assets/js/user/account.js" />"></script>
</html>
