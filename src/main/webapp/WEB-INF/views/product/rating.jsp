<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--JSTL  -->
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<section class="mt-lg-14 mt-10 p-5">
	<div class="container">

		<div class="row">
			<div class="col-md-12">
				<div class="my-8">
					<!-- row -->
					<div class="row">
						<div class="col-md-4">
							<div class="me-lg-12 mb-6 mb-md-0">

								<div class="mb-5">
									<h4 class="mb-3">Customer reviews</h4>
									<c:forEach begin="1" end="5" varStatus="index">
										<!-- progress -->
										<div class="d-flex align-items-center mb-2">
											<div class="text-nowrap me-3 text-muted">
												<span class="d-inline-block align-middle text-muted">${5-index.count+1}</span><i
													class="bi bi-star-fill ms-1 small text-warning"></i>
											</div>
											<div class="w-100">
												<div class="progress" style="height: 6px;">
													<div class="progress-bar bg-warning" role="progressbar"
														style="width: ${product.feedbacks.size() > 0 ? (100*countStar[5-index.count+1]/product.feedbacks.size()) : 0}%;"
														aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"></div>
												</div>
											</div>
											<c:if test="${product.feedbacks.size() > 0 }">
												<span class="text-muted ms-3"><fmt:formatNumber
														type="percent"
														value="${countStar[5-index.count+1]/product.feedbacks.size()}" />
												</span>
											</c:if>

										</div>

									</c:forEach>

								</div>


							</div>
						</div>
						<!-- col -->
						<div class="col-md-8">
							<div class="mb-10">
								<div
									class="d-flex justify-content-between align-items-center mb-8">
									<div>
										<!-- heading -->
										<h4>Reviews</h4>
									</div>

									<div class="dropdown">
										<button class="btn btn-success dropdown-toggle" type="button"
											data-bs-toggle="dropdown" aria-expanded="false">
											<c:choose>
												<c:when test="${filterStar==0}">
													<s:message code="product.filter_0" />
												</c:when>
												<c:when test="${filterStar==1}">
													<s:message code="product.filter_4" />
												</c:when>
												<c:when test="${filterStar==2}">
           								 			5 <s:message code="product.stars" />
												</c:when>
												<c:when test="${filterStar==3}">
           								 			4 <s:message code="product.stars" />
												</c:when>
												<c:when test="${filterStar==4}">
           								 			3 <s:message code="product.stars" />
												</c:when>
												<c:when test="${filterStar==5}">
           								 			2 <s:message code="product.stars" />
												</c:when>
												<c:when test="${filterStar==6}">
           								 			1 <s:message code="product.star" />
												</c:when>
												<c:otherwise>
            										Filter
         										</c:otherwise>
											</c:choose>
										</button>
										<ul class="dropdown-menu">
											<li><a class="dropdown-item"
												href="product/detail.htm?filterStar=0&productId=${product.productId }">
													<s:message code="product.filter_0" />
											</a></li>
											<li><a class="dropdown-item"
												href="product/detail.htm?filterStar=1&productId=${product.productId }"><s:message
														code="product.filter_4" /></a></li>
											<li><a class="dropdown-item"
												href="product/detail.htm?filterStar=2&productId=${product.productId }">
													5 <s:message code="product.stars" />
											</a></li>
											<li><a class="dropdown-item"
												href="product/detail.htm?filterStar=3&productId=${product.productId }">4
													<s:message code="product.stars" />
											</a></li>
											<li><a class="dropdown-item"
												href="product/detail.htm?filterStar=4&productId=${product.productId }">3
													<s:message code="product.stars" />
											</a></li>
											<li><a class="dropdown-item"
												href="product/detail.htm?filterStar=5&productId=${product.productId }">2
													<s:message code="product.stars" />
											</a></li>
											<li><a class="dropdown-item"
												href="product/detail.htm?filterStar=6&productId=${product.productId }">1
													<s:message code="product.star" />
											</a></li>
										</ul>
									</div>

								</div>


							</div>

							<c:if test="${rateds.size() == 0 }">
								<div class="d-flex pb-7 mt-3 ">
									<div class="flex-grow-1 ms-3">Haven't got any comments
										yet</div>
								</div>
							</c:if>

							<c:forEach var="f" items="${rateds }" begin="0" end="2">
								<div class="d-flex pb-7 mt-3 ">

									<img
										src="<c:url value="/assets/img/account/${f.account.avatar}"/>"
										alt="" class="rounded-circle shadow-4"
										style="width: 30px; height: 30px">
									<div class="ms-5">
										<h6 class="mb-1">${f.account.getName()}</h6>
										<p class="small">
											<span class="text-muted"><fmt:formatDate
													value="${f.postingDate}" pattern="dd-MM-yyyy" /></span>
										</p>
										<!-- rating -->
										<div class=" mb-2">
											<c:forEach begin="1" end="5" varStatus="index">
												<c:choose>
													<c:when test="${index.count <= f.ratingStar}">
														<i class="bi bi-star-fill text-warning"></i>
													</c:when>
													<c:otherwise>
														<i class="bi bi-star-fill " style="color: #e6e6e6;"></i>
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</div>
										<!-- text-->
										<p>${f.feedbackContent }</p>


									</div>

								</div>

								<hr>
							</c:forEach>





						</div>
					</div>
					<div class="row mt-5 ">

						<!-- nav -->
						<nav>
							<ul class="pagination d-flex justify-content-center ms-2">
								<li class="page-item ${(currentPage == 1) ? 'disabled' : '' }"><a
									class="page-link  mx-1 " aria-label="Previous"
									href="product/detail.htm?prodcutId=${currentProductId }&currentPage=${in.count  }&filterStar=${filterStar}">
										<span aria-hidden="true">&laquo;</span>
								</a></li>
								<c:forEach var="i" begin="1" end="${totalPage }" varStatus="in">

									<li class="page-item "><a
										class="page-link  mx-1 ${(currentPage == in.count) ? 'active' : '' }"
										href="product/detail.htm?productId=${currentProductId}&currentPage=${in.count  }&filterStar=${filterStar }">${in.count}</a></li>
								</c:forEach>
								<li class="page-item"><a
									class="page-link mx-1 text-body ${(currentPage == totalPage) ? 'disabled' : '' }"
									aria-label="Next"
									href="product/detail.htm?productId=${currentProductId}&currentPage=${currentPage + 1  }&filterStar=${filterStar}">
										<span aria-hidden="true">&raquo;</span>
								</a></li>
							</ul>
						</nav>



					</div>
				</div>
			</div>


		</div>

	</div>


</section>
