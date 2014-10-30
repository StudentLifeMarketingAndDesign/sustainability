$(window).load(function() {

	// add js class to body if javascript enabled
	$('html').removeClass('no-js');


	$('.fancybox').fancybox({
		nextClick : true,
		helpers : {
			title : {
				type : 'inside'
			},
			overlay : {
				css : {
					'background':'rgba(238,238,238,0.85)'
				}
			}
		}
	});

	// Hero Carousel
	$('.slick-hero').slick({
		autoplay: true,
		dots: false,
		arrows: false,
		fade: true,
		speed: 800,
		autoplaySpeed: 6000,
		pauseOnHover: false,
	});


	// Sponsors Carousel
	$('.slick-sponsors').slick({
		infinite: true,
		speed: 300,
		slidesToShow: 5,
		slidesToScroll: 1,
		autoplay: true,
		responsive: [
		{
			breakpoint: 1024,
			settings: {
				slidesToShow: 4,
				slidesToScroll: 1,
				infinite: true,
			}
		},
		{
			breakpoint: 700,
			settings: {
				slidesToShow: 2,
				slidesToScroll: 1
			}
		},
		{
			breakpoint: 480,
			settings: {
				slidesToShow: 1,
				slidesToScroll: 1
			}
		}
		]
	});


	// Flexslider
	// $('.flexslider').flexslider({
	//		slideshow:false,
	//		controlNav:false
	// });


	// Hero Flexslider
	//	$('.hero-slider').flexslider({
	//		animation:"fade",
	//		controlNav:false,
	//		directionNav:false
	// });

	// Sponsor Flexslider
	// $('.flexslider-sponsor').flexslider({
	// animation:"slide",
	// easing:"swing",
	// slideshow:true,
	// animationLoop:true,
	// controlNav:false,
	// itemWidth:210,
	// move:1
	// });

	// Lazy load images
	$(".unveil").unveil();


	$('.nav-title a').click(function() {
		$('.nav-main-wrapper').toggleClass('expand');
		return false;
	});
});
