<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- Slider -->
<div class="container slider mb-5">
	<div id="carouselExampleIndicators" class="carousel slide">
		<ol class="carousel-indicators  list-unstyled">
			<li data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0"
				class="active"></li>
			<li data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"></li>
		</ol>
		<div class="carousel-inner">
			<div class="carousel-item active   ">
				<img class="d-block w-100 img-slider rounded"
					src="${company.slider1Img }" alt="First slide">

				<div class="carousel-caption d-none d-md-block text-start ">
					<div class="badge bg-warning text-wrap sale text-sm text-dark	">
						<s:message code="global.slide1.discount" />
					</div>
					<h2 class="mt-5 fs-1 fw-bold text-dark  ">
						<s:message code="global.slide1.title" />
					</h2>
					<p class="text-secondary">
						<s:message code="global.slide1.des" />
					</p>
					<a type="button" class="btn btn-dark"
						href="product/index.htm?categoryId=${firstCategory }"> <s:message
							code="global.slide1.btn" /> <i class="bi bi-arrow-right-short"></i>
					</a>
				</div>


			</div>
			<div class="carousel-item ">
				<img class="d-block w-100 img-slider rounded "
					src="${company.slider2Img }" alt="First slide">

				<div class="carousel-caption d-none d-md-block text-start ">
					<div class="badge bg-success text-wrap sale">
						<s:message code="global.slide2.discount" />
					</div>
					<h2 class="mt-5 fs-1 fw-bold text-dark  ">
						<s:message code="global.slide2.title" />
					</h2>
					<p class="text-secondary">
						<s:message code="global.slide2.des" />
					</p>
					<a type="button" class="btn btn-dark"
						href="product/index.htm?categoryId=${firstCategory }"> <s:message
							code="global.slide2.btn" /> <i class="bi bi-arrow-right-short"></i>
					</a>
				</div>


			</div>

		</div>
		<a class="carousel-control-prev" href="#carouselExampleIndicators"
			role="button" data-bs-slide="prev"> <span
			class="carousel-control-prev-icon" aria-hidden="true"></span>

		</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
			role="button" data-bs-slide="next"> <span
			class="carousel-control-next-icon" aria-hidden="true"></span>

		</a>
	</div>
</div>
<!--End Slider -->
