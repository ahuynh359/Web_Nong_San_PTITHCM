
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/library.jsp"%>
<%@include file="/WEB-INF/views/include/header.jsp"%>
<section>
	<div class="container">
		<div class="row bg-success-subtle p-5" >
			<h2 class="text-left text-md-center mx-0 mx-md-auto w-100">About
				Us</h2>
			<div class="text-left text-md-center">Give us a call or better
				yet drop into our headquarters to say hi in person.</div>
		</div>
		<div class="row mt-5">
			<div class="col-md-6">
				<iframe style="width: 500px; height: 350px;"
					src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3918.5103616667384!2d106.7870282!3d10.8487332!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752713471f5b15%3A0x1d5dddea640dad31!2zOTcgxJAuIE1hbiBUaGnhu4duLCBIaeG7h3AgUGjDuiwgUXXhuq1uIDksIFRow6BuaCBwaOG7kSBI4buTIENow60gTWluaA!5e0!3m2!1svi!2s!4v1685600738680!5m2!1svi!2s"
					style="border:0;" allowfullscreen="" loading="lazy"
					referrerpolicy="no-referrer-when-downgrade"></iframe>


			</div>
			<div class="col-md-6">
				<form class="row">

					<div class="col-md-12 mb-3">
						<!-- input -->
						<label class="form-label" for="title"> Title</label> <input
							type="text" id="title" name="title" class="form-control"
							placeholder="Your Title" required="">
					</div>
					<div class="col-md-6 mb-3">
						<label class="form-label" for="emailContact">Email<span
							class="text-danger">*</span></label> <input type="email"
							id="emailContact" name="emailContact" class="form-control"
							placeholder="Enter Your First Name" required="">
					</div>
					<div class="col-md-6 mb-3">
						<!-- input -->
						<label class="form-label" for="phone"> Phone</label> <input
							type="text" id="phone" name="phone" class="form-control"
							placeholder="Your Phone Number" required="">
					</div>
					<div class="col-md-12 mb-3">
						<!-- input -->
						<label class="form-label" for="comments"> Comments</label>
						<textarea rows="3" id="comments" class="form-control"
							placeholder="Additional Comments"></textarea>
					</div>
					<div class="col-md-12">
						<!-- btn -->
						<button type="submit" class="btn btn-success">Submit</button>
					</div>



				</form>
			</div>
		</div>
		<div class="row mt-5">
			<div class="col-md-3">
				<div class="dbox w-100 text-center">
					<div class="icon d-flex align-items-center justify-content-center">
						<i
							class="bi bi-geo-alt-fill rounded-circle bg-success p-2 text-dark bg-opacity-25 p-4"></i>
					</div>
					<div class="text mt-2">
						<p>
							<span>Address:</span>
							${company.address }
						</p>
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="dbox w-100 text-center">
					<div class="icon d-flex align-items-center justify-content-center">
						<i
							class="bi bi-telephone-fill rounded-circle bg-success p-2 text-dark bg-opacity-25 p-4"></i>
					</div>
					<div class="text mt-2">
						<p>
							<span>Phone:</span> ${company.phoneNumber }
						</p>
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="dbox w-100 text-center">
					<div class="icon d-flex align-items-center justify-content-center">
						<i
							class=" bi bi-envelope-fill rounded-circle bg-success p-2 text-dark bg-opacity-25 p-4"></i>
					</div>
					<div class="text mt-2">
						<p>
							<span>Email:</span> ${company.gmail }
						</p>
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="dbox w-100 text-center ">
					<div class="  d-flex align-items-center justify-content-center">
						<span
							class="bi bi-globe bg-primary rounded-circle bg-success p-2 text-dark bg-opacity-25 p-4 "></span>
					</div>
					<div class="text mt-2">
						<p>
							<span>Website</span> <a href="index.htm">TadGarden.com</a>
						</p>
					</div>
				</div>
			</div>
		</div>

	</div>


</section>

<%@include file="/WEB-INF/views/include/footer.jsp"%>
