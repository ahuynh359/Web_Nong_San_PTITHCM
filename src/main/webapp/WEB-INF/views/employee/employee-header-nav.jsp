
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
		<hr class="sidebar-divider">
		<small class="sidebar-heading px-2 text-muted">Products</small>

		<!-- Nav Item - Product -->
		<li class="nav-item "><a href="employee/products.htm"
			class="nav-link"> <i class="bi bi-cart2"></i> <span>Product</span></a>
		</li>

		<!-- Divider -->
		<hr class="sidebar-divider">
		<small class="sidebar-heading px-2 text-muted">Voucher</small>

		<!-- Nav Item - Feedback -->
		<li class="nav-item "><a href="employee/vouchers.htm"
			class="nav-link"> <i class="bi bi-star"></i> <span>Voucher</span></a>
		</li>



		<hr class="sidebar-divider">
		<!-- Nav Item - Profile -->
		<li class="nav-item "><a href="employee/profile.htm"
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