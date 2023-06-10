
<div class="ps-4">
	<ul
		class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
		id="accordionSidebar">

		<li class="nav-item p-3"><a class="navbar-brand "
			href='<c:url value = "index.htm?language=${pageContext.response.locale}"/>'>
				<img src="${company.logoNavImg }" alt="Logo"
				style="max-width: 100px">
		</a></li>
		<!-- Sidebar - Brand -->


		<!-- Divider -->
		<hr class="sidebar-divider my-0">


		<!-- Nav Item - Dashboard -->
		<li class="nav-item active"><a href="admin/dashboard.htm"
			class="nav-link"> <i class="bi bi-bar-chart-fill"></i> <span>Dashboard</span></a>
		</li>

		<!-- Divider -->
		<hr class="sidebar-divider">
		<small class="sidebar-heading px-2 text-muted">Account</small>
		<!-- Nav Item - Account -->
		<li class="nav-item "><a href="admin/user/get-employee.htm"
			class="nav-link"> <i class="bi bi-person-badge-fill"></i></i> <span>Employee</span></a>
		</li>

		<!-- Nav Item - Account -->
		<li class="nav-item "><a href="admin/user/get-guest.htm"
			class="nav-link"> <i class="bi bi-people-fill"></i> <span>Guest</span></a>
		</li>
		
		<!-- Nav Item - Feedback -->
		<li class="nav-item "><a href="admin/feedback.htm"
			class="nav-link"> <i class="bi bi-star"></i> <span>Feedbacks</span></a>
		</li>



		<!-- Divider -->
		<hr class="sidebar-divider">
		<small class="sidebar-heading px-2 text-muted">Products</small>

		<!-- Nav Item - Product -->
		<li class="nav-item "><a href="admin/products.htm"
			class="nav-link"> <i class="bi bi-cart2"></i> <span>Product</span></a>
		</li>

		<!-- Nav Item - Category -->
		<li class="nav-item "><a href="admin/category.htm"
			class="nav-link"> <i class="bi bi-list-task"></i> <span>Category</span></a>
		</li>
		<!-- Nav Item - Orders -->

		<li class="nav-item "><a href="admin/orders.htm"
			class="nav-link"> <i class="bi bi-bag-fill"></i> <span>Order</span></a>
		</li>

		<hr class="sidebar-divider">
		<!-- Nav Item - Profile -->
		<li class="nav-item "><a href="admin/profile.htm"
			class="nav-link"> <i class="bi bi-person-circle"></i> <span>Profile</span></a>
		</li>


		<!-- Nav Item - Logout -->
		<li class="nav-item "><a href="guest/logout.htm" class="nav-link">
				<i class="bi bi-box-arrow-left"></i> <span>Logout</span>
		</a></li>

	</ul>
</div>
<!-- End of Sidebar -->

<!-- <script>
        var currentUrl = window.location.pathname;
        var a = document.querySelectorAll('.nav-link');

        for (var i = 0; i < AbortController.length; i++) {
            var a = a[i];
            var href = a.parentElement.getAttribute('href');
            a = a.slice(0, -4);
            if (currentUrl.includes(href)) {
                button.classList.add('active');
            } else {
                button.classList.remove('active');
            }
        }
    </script> -->