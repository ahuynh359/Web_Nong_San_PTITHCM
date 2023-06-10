<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!--Navbar  -->
<nav class="navbar navbar-expand-lg mb-3 ">
	<div class="container">
		<a class="navbar-brand "
			href='<c:url value = "index.htm?language=${pageContext.response.locale}"/>'>
			<img src="${company.logoNavImg }" alt="Logo">
		</a>


		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mx-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link" aria-current="page"
					href='<c:url value = "index.htm"/>'><s:message
							code="global.nav_item1" /> </a></li>
				<li class="nav-item"><a class="nav-link"
					href="product/index.htm?categoryId=${firstCategory }"><s:message
							code="global.nav_item2" /></a></li>
				<li class="nav-item"><a class="nav-link" href="aboutUs.htm"><s:message
							code="global.nav_item3" /></a></li>
				<li class="nav-item"><a class="nav-link" href="contactUs.htm"><s:message
							code="global.nav_item4" /></a></li>

			</ul>
			<div
				class="search-and-icons d-flex align-items-center position-relative">
				<!-- Search Form -->
				<div class="search-bar d-flex  flex-column me-3">
					<form role="search" action="searchFood.htm">
						<input class="form-control " type="search"
							placeholder=<s:message code="global.search"/> aria-label="Search"
							name="search">
					</form>
				</div>


				<div class="user-icons d-flex justify-content-center gap-2 ">
					<a href='<c:url value = "wishlist/index.htm"/>'
						class="wishlist icon position-relative"> <i
						class="bi bi-heart text-dark"></i><span
						class="position-absolute top-10 start-80 translate-middle badge rounded-pill  ">${sessionScope.totalWishlist }
					</span>
					</a> <a href='<c:url value = "account/index.htm"/>'
						class="profile icon"> <i class="bi bi-person text-dark"></i>
					</a> <a href='<c:url value = "cart/index.htm"/>'
						class="cart icon position-relative"> <i class="bi bi-cart3 text-dark"></i>
						<span
						class="position-absolute top-10 start-80 translate-middle badge rounded-pill ">${sessionScope.totalCart }

					</span>
					</a>

				</div>
			</div>

		</div>
	</div>

</nav>
<!--End Navbar  -->