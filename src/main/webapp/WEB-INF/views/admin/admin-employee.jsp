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
				<div class="container">
					<div class="row mb-4">
						<div class="col-md-12">
							<div class="d-md-flex justify-content-between align-items-center">
								<!-- pageheader -->
								<div>
									<h2>Employee</h2>
									<!-- breacrumb -->
									<nav aria-label="breadcrumb">
										<ol class="breadcrumb mb-0 text-muted fs-6 fw-semibold">
											<li class="breadcrumb-item  "><a href="index.htm"
												class="text-decoration-none text-success ">Dashboard </a></li>
											<li class="breadcrumb-item active" aria-current="page"
												class="text-decoration-none">Employee</li>
										</ol>

									</nav>
								</div>
								<!-- button -->
								<div>
									<a href="admin/user/create-employee.htm"
										class="btn btn-outline-success">Add New Employee</a>
								</div>
							</div>
						</div>
					</div>

					<table class="table table-hover table-striped table-categories ">
						<thead class="position-sticky top-0 bg-white">
							<tr class="table-success">
								<th>Avatar</th>
								<th>Fullname</th>
								<th>Status</th>
								<th>Email</th>
								<th>Enable</th>
								<th>Edit</th>

							</tr>
						</thead>
						<tbody>
							<c:forEach varStatus="status" var="account" items="${accounts}">
								<tr>
									<td class="align-middle"><img style="width: 50px"
										src="<c:url value = "/assets/img/account/${account.avatar }"/>">
									</td>
									<td class="align-middle"><c:set var="fullName"
											value="${account.lastName} ${account.firstName} " />
										<p class="m-0">${fullName}</p></td>
									<td class="align-middle"><c:choose>
											<c:when test="${account.status eq '1'}">
												<span class="badge bg-success">Enable </span>
											</c:when>
											<c:otherwise>
												<span class="badge bg-danger">Disable </span>
											</c:otherwise>
										</c:choose></td>
									<td class="align-middle"><p class="p-3">${account.email }</p></td>
									<td class="align-middle"><a
										href="admin/user/enable${account.accountId }.htm?source=${source}"><button
												class="btn btn-success" type="button"
												id="edit_button${status.index}">
												<c:choose>
													<c:when test="${ account.status eq '1'}">
														<i class="bi bi-lock-fill "></i>
													</c:when>
													<c:otherwise>
														<i class="bi bi-unlock-fill "></i>
													</c:otherwise>
												</c:choose>
											</button></a></td>
									<td class="align-middle"><a class="link-success" href="admin/user/edit.htm?id=${account.accountId }"><i
											class="bi bi-pencil-square"></i>Edit</a></td>

								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>

			<!-- pagination -->
			<div class="d-flex justify-content-center ">

				<!-- nav -->
				<nav>
					<ul class="pagination d-flex justify-content-center ms-2">
						<li class="page-item ${(crrPage == 1) ? 'disabled' : '' }"><a
							class="page-link  mx-1 " aria-label="Previous"
							href="admin/user/${source }?crrPage=${crrPage - 1}"> <span
								aria-hidden="true">&laquo;</span>
						</a></li>
						<c:forEach var="i" begin="1" end="${totalPage }" varStatus="in">

							<li class="page-item "><a
								class="page-link  mx-1 ${(crrPage == in.count) ? 'active' : '' }"
								href="admin/user/${source }?crrPage=${in.count}">${in.count}</a></li>
						</c:forEach>
						<li class="page-item"><a
							class="page-link mx-1 text-body ${(crrPage == totalPage) ? 'disabled' : '' }"
							aria-label="Next"
							href="admin/user/${source }?crrPage=${crrPage + 1}"> <span
								aria-hidden="true">&raquo;</span>
						</a></li>
					</ul>
				</nav>

			</div>
			<!--End pagination -->

		</div>

	</div>


</body>
<script src="<c:url value="/assets/js/admin/AlertHandler.js"/>"></script>
</html>