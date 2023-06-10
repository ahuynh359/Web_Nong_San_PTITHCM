<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--JSTL  -->
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<section class="my-lg-14 my-14 mb-4">
	<div class="container">
		<!-- row -->
		<div class="row">
			<div class="col-12">
				<!-- heading -->
				<h3>Related Items</h3>
			</div>
		</div>
		<!-- row -->
		<div class="row g-4 row-cols-lg-5 row-cols-2 row-cols-md-2 mt-2">
			<!-- col -->

			<c:forEach var="p" items="${listProductSameCategory }">
				<%@include file="/WEB-INF/views/include/listProduct1.jsp"%>
			</c:forEach>


		</div>




	</div>
</section>