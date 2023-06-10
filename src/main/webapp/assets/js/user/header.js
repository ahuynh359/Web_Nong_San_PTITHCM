$('.owl-carousel').owlCarousel({
	loop: true,
	margin: 10,
	dots: false,
	responsiveClass: true,
	responsive: {
		0: {
			items: 4,
			nav: true
		},
		600: {
			items: 5,
			nav: true
		},
		1000: {
			items: 7,
			nav: true,

		}
	}
})

