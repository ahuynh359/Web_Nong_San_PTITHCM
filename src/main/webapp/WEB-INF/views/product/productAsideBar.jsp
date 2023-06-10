<aside class="col-lg-3 col-md-6 d-none d-lg-block mb-6 mb-md-0 ">
	<!-- Categories -->
	<div class="mb-1">
		<!-- nav -->
		<div class="d-flex flex-column p-3  ">

			<div class="nav-item  w-100 ">
				<a href="#" class=" fs-5 fw-bold nav-link collapsed text-success"
					data-bs-toggle="collapse" data-bs-target="#flush-collapseOne"
					aria-expanded="false" aria-controls="flush-collapseOne"><s:message
						code="product.category" /> </a>
				<!-- collapse -->
				<div id="flush-collapseOne" class="accordion-collapse collapse">
					<div>

						<ul class="nav flex-column ">
							<c:forEach var="c" items="${category }">
								<li class="nav-item"><a
									href="product/index.htm?categoryId=${c.categoryId}&currentPage=1"
									class="nav-link link-dark "> ${c.name } </a></li>
							</c:forEach>
							<!-- nav item -->

						</ul>


					</div>
				</div>
			</div>



		</div>

	</div>
	<hr>
	<!-- Loc theo gia -->

	<div class="mb-1">
		<!-- nav -->
		<div class="d-flex flex-column p-3  ">

			<div class="nav-item  w-100 ">
				<a href="#" class=" fs-5 fw-bold nav-link collapsed text-success"
					data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo"
					aria-expanded="false" aria-controls="flush-collapseTwo"><s:message
						code="product.price" /> </a>
				<!-- collapse -->
				<div id="flush-collapseTwo" class="accordion-collapse collapse">
					<div>

						<ul class="nav flex-column">

							<li class="nav-item"><a
								href="product/index.htm?categoryId=${currentCategory.categoryId}&currentPage=1&filterPrice=0&index=${index}"
								class="nav-link link-dark "> <s:message
										code="product.all" />
							</a></li>
							<li class="nav-item"><a
								href="product/index.htm?categoryId=${currentCategory.categoryId}&currentPage=1&filterPrice=1&index=${index}"
								class="nav-link link-dark "><s:message
										code="product.price_below" /> <fmt:formatNumber
										value="100000" type="currency" currencySymbol="VND"
										maxFractionDigits="0" /></a></li>
							<li class="nav-item"><a
								href="product/index.htm?categoryId=${currentCategory.categoryId}&currentPage=1&filterPrice=2&index=${index}"
								class="nav-link link-dark "> <fmt:formatNumber
										value="100000" type="currency" currencySymbol="VND"
										maxFractionDigits="0" /> - <fmt:formatNumber value="200000"
										type="currency" currencySymbol="VND" maxFractionDigits="0" /></a></li>
							<li class="nav-item"><a
								href="product/index.htm?categoryId=${currentCategory.categoryId}&currentPage=1&filterPrice=3&index=${index}"
								class="nav-link link-dark "> <fmt:formatNumber
										value="200000" type="currency" currencySymbol="VND"
										maxFractionDigits="0" /> - <fmt:formatNumber value="300000"
										type="currency" currencySymbol="VND" maxFractionDigits="0" /></a></li>
							<li class="nav-item"><a
								href="product/index.htm?categoryId=${currentCategory.categoryId}&currentPage=1&filterPrice=4&index=${index}"
								class="nav-link link-dark "> <fmt:formatNumber
										value="300000" type="currency" currencySymbol="VND"
										maxFractionDigits="0" />-<fmt:formatNumber value="500000"
										type="currency" currencySymbol="VND" maxFractionDigits="0" /></a></li>
							<li class="nav-item"><a
								href="product/index.htm?categoryId=${currentCategory.categoryId}&currentPage=1&filterPrice=5&index=${index}"
								class="nav-link link-dark "> <fmt:formatNumber
										value="500000" type="currency" currencySymbol="VND"
										maxFractionDigits="0" />-<fmt:formatNumber value="1000000"
										type="currency" currencySymbol="VND" maxFractionDigits="0" /></a></li>
							<li class="nav-item"><a
								href="product/index.htm?categoryId=${currentCategory.categoryId}&currentPage=1&filterPrice=6&index=${index}"
								class="nav-link link-dark "> <s:message
										code="product.price_above" /> <fmt:formatNumber
										value="1000000" type="currency" currencySymbol="VND"
										maxFractionDigits="0" /></a></li>
							<!-- nav item -->

						</ul>


					</div>
				</div>
			</div>



		</div>

	</div>



</aside>


