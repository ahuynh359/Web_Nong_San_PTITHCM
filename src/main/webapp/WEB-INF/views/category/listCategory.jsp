<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- Category -->
<div class="category">
	<div class="container ">
		<div class="row">
			<div class="col-12 mb-6">
				<h5 class="fw-bold mb-5 fs-3">
					<s:message code="global.category" />
				</h5>

			</div>
		</div>
		
		<div class="owl-carousel owl-theme">
			<c:forEach var="c" items="${category }">
				<div class="item p-3">
					<div class="card" style="width: 8rem;">
						<div class="card-body text-center py-6 ">
							<div class="my-3">
								<a href="product/index.htm?categoryId=${c.categoryId }"> <img
									class="card-img-top "
									src="<c:url value="/assets/img/category/${c.image}"/>"
									alt="Category Image">
								</a>
							</div>
							<p class="card-text ">
								<a href="#" class="text-decoration-none text-dark ">${c.name }
								</a>
							</p>
						</div>

					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</div>
<!-- End Category -->