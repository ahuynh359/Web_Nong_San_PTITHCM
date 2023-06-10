<!-- Topbar -->
<c:set var="path" value="${pageContext.request.contextPath}" />
<!-- Topbar Search -->
<!-- <form
		class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
		<div class="input-group">
			<input type="text" class="form-control bg-light border-0 small"
				placeholder="Search for..." aria-label="Search">
			<div class="input-group-append">
				<button class="btn btn-primary" type="button">
					<i class="bi bi-search"></i>
				</button>
			</div>
		</div>
	</form> -->



<!-- Nav Item - User Information -->
<div class="d-flex justify-content-end px-3">
	<a href="${path}/admin/profile.htm" class="text-decoration-none"> <span
		class="me-3	 text-dark small">${user.getName() }</span> <img
		class="img-profile rounded-circle"
		src="assets/img/account/${account.avatar }" style="max-width: 30px">
	</a>
</div>



