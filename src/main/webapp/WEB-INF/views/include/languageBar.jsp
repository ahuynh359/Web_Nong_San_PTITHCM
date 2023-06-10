<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<c:set var="localeCode" value="${pageContext.response.locale}" />

<!-- Language Bar -->
<div class=" bg-light">
	<div class="container">
		<div class="row">
			<div class="col-md-6 text-md-start col-12 text-center ">
				<s:message code="global.intro" />
			</div>

			<div class="col-6 text-end d-none d-md-block">
				<div class="dropdown ">
					<button class="btn btn-sm dropdown-toggle border-0 me-2"
						type="button" data-bs-toggle="dropdown" aria-expanded="false">
						<c:if test="${localeCode == 'vi'}">
							<i class="flag-icon flag-icon-vn "></i> VN
						</c:if>
						<c:if test="${localeCode == 'en'}">
							<i class="flag-icon flag-icon-us "></i> EN
						</c:if>
					</button>

					<ul class="dropdown-menu text-center ">
						<li><a class="dropdown-item text-muted"
							href='<c:url value = "index.htm?language=vi"/>'><i
								class="flag-icon flag-icon-vn me-1"></i>VN</a></li>
						<li><a class="dropdown-item text-muted"
							href='<c:url value = "index.htm?language=en"/>'><i
								class="flag-icon flag-icon-us me-1"></i>EN</a></li>
					</ul>

				</div>
			</div>
		</div>
	</div>
</div>
<!--End Language Bar -->