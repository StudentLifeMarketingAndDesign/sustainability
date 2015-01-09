$(document).ready(function() {

	// add js class to body if javascript enabled
	$('html').removeClass('no-js');

	// Shifter
	$.shifter({
		maxWidth: "767px"
	});

	// Naver
	$(".naver").naver();

	// Boxer - Lightbox
	$(".boxer").boxer();

	// Roller - Carousel
	$(".target").roller({
		paged: true,
		pagination: false
	});

	$('.pulse-panel').slick({
		lazyLoad: 'ondemand',
		infinite: false,
		slidesToShow: 4,
		slidesToScroll: 4,
		speed: 900,
		responsive: [
	    {
	      breakpoint: 980,
	      settings: {
	      	infinite: false,
				slidesToShow: 3,
				slidesToScroll: 3
	      }
	    },
	    {
	      breakpoint: 600,
	      settings: {
	        slidesToShow: 2,
	        slidesToScroll: 2,
	        infinite: true
	      }
	    },
	    {
	      breakpoint: 480,
	      settings: {
	        slidesToShow: 1,
	        slidesToScroll: 1,
	        infinite: true
	      }
	    }
	  ]
	});


});
