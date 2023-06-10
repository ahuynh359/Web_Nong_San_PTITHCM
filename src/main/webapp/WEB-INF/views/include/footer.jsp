<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--Multiple Languages  -->
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!-- Footer -->



<footer class="text-white pt-3 pb-3 ">
	<div class="container">
		<div class="row ">
			<div class="col-md-3 col-lg-3 col-sm-3 me-auto">
				<a class="navbar-brand" href="#"> <img
					src="${company.logoFooterImg }" alt="Logo">
				</a>
				<!-- End Logo -->
			</div>

			<div class="col-md-3 col-lg-3 col-sm-3 ms-auto text-center">
				<ul class="list-unstyled list-inline">
					<li class="list-inline-item"><a href="#"
						class="btn-floating btn-sm text-white" style="font-size: 20px;"><i
							class="bi bi-facebook"></i></a></li>
					<li class="list-inline-item"><a href="#"
						class="btn-floating btn-sm text-white" style="font-size: 20px;"><i
							class="bi bi-youtube"></i></i></a></li>
					<li class="list-inline-item"><a href="#"
						class="btn-floating btn-sm text-white" style="font-size: 20px;"><i
							class="bi bi-twitter"></i></a></li>
					<li class="list-inline-item"><a href="#"
						class="btn-floating btn-sm text-white" style="font-size: 20px;"><i
							class="bi bi-instagram"></i></i></a></li>

				</ul>
			</div>
		</div>

		<hr>



		<div class="row text-center text-md-left">



			<div class="col-md-3 col-lg-3 col-xl-3 mx-auto mt-3">
				<h5 class="text-uppercase mb-4 font-weight-bold text-white">
					<s:message code="global.col1.title" />
				</h5>
				<c:forEach begin="1" end="5" varStatus="status" var="c"
					items="${category }">
					<p>
						<a href="product/index.htm?categoryId=${c.categoryId }"
							class="text-white" style="text-decoration: none;">${c.name }</a>
					</p>
				</c:forEach>
			</div>



			<div class="col-md-3 col-lg-3 col-xl-3 mx-auto mt-3">
				<h5 class="text-uppercase mb-4 font-weight-bold text-white ">
					<s:message code="global.col2.title" />
				</h5>
				<p>
					<a href="#" class="text-white" style="text-decoration: none;">Payment</a>
				</p>
				<p>
					<a href="#" class="text-white" style="text-decoration: none;">Shipping</a>
				</p>
				<p>
					<a href="#" class="text-white" style="text-decoration: none;">FAQ</a>
				</p>
				<p>
					<a href="#" class="text-white" style="text-decoration: none;">Shop
						Checkout</a>
				</p>
				<p>
					<a href="#" class="text-white" style="text-decoration: none;">Product
						Returns</a>
				</p>

			</div>

			<div class="col-md-3 col-lg-3 col-xl-3 mx-auto mt-3">
				<h5 class="text-uppercase mb-4 font-weight-bold text-white ">
					<s:message code="global.col3.title" />
				</h5>
				<p>
					<a href="index.htm" class="text-white"
						style="text-decoration: none;"> <s:message
							code="global.nav_item1" />
					</a>
				</p>
				<p>
					<a href="product/index.htm?categoryId=${firstCategory }"
						class="text-white" style="text-decoration: none;"><s:message
							code="global.nav_item2" /> </a>
				</p>
				<p>
					<a href="#" class="text-white" style="text-decoration: none;"><s:message
							code="global.nav_item3" /></a>
				</p>
				<p>
					<a href="#" class="text-white" style="text-decoration: none;"><s:message
							code="global.nav_item4" /></a>
				</p>

			</div>

			<div class="col-md-3 col-lg-3 col-xl-3 mx-auto mt-3">
				<h5 class="text-uppercase mb-4 font-weight-bold text-white ">
					<s:message code="global.col4.title" />
				</h5>
				<p>
					<i class="bi bi-house mr-3"> ${company.address } </i>
				</p>
				<p>
					<i class="bi bi-telephone mr-3">${company.phoneNumber }</i>
				</p>
				<p>
					<i class="bi bi-envelope mr-3"> ${company.gmail }</i>
				</p>
			</div>
		</div>

		<hr class="mb-4">

		<div class="text-center">
			<p>
				<s:message code="global.col5.title" />
				<a href="#" style="text-decoration: none;"><strong
					class="text-warning">Tad Garden</strong></a>
			</p>



		</div>

	</div>

</footer>
