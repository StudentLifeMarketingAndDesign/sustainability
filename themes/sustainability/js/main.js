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



	// Homepage main carousel
	$('.your-class').slick({
		dots: true,
		arrows: false,
		infinite: true,
		speed: 500,
		fade: true,
		slide: 'div',
		cssEase: 'linear',
		responsive: [
	    {
	      breakpoint: 768,
	      settings: {
	      	lazyLoad: 'ondemand',
	      	arrows: false,
	      	dots: true,
	      	fade: false
	      }
	    },
	    {
	      breakpoint: 480,
	      settings: {
				lazyLoad: 'ondemand',
				arrows: false,
				slidesToShow: 1,
				slidesToScroll: 1,
				infinite: true,
				fade: false
	      }
	    }
	   ]
	});

	// Featured News Articles
	$('.featured-articles').slick({
		dots: true,
		arrows: false,
		lazyLoad: 'ondemand',
		slidesToShow: 1,
		slidesToScroll: 1
	});

	// Homepage carousel tabs
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
				lazyLoad: 'ondemand',
				infinite: false,
				slidesToShow: 3,
				slidesToScroll: 3
	      }
	    },
	    {
	      breakpoint: 700,
	      settings: {
				lazyLoad: 'ondemand',
				slidesToShow: 2,
				slidesToScroll: 2,
				infinite: true
	      }
	    },
	    {
	      breakpoint: 480,
	      settings: {
				lazyLoad: 'ondemand',
				slidesToShow: 1,
				slidesToScroll: 1,
				infinite: true
	      }
	    }
	  ]
	});

	// Gallery Carousel
	$('.gallery-carousel').slick({
		lazyLoad: 'ondemand',
		infinite: true,
		speed: 300,
		arrows: true,
		slidesToShow: 1,
		centerMode: true,
		dots: false,
		variableWidth: true,
		responsive: [
	    {
	      breakpoint: 768,
	      settings: {
				lazyLoad: 'ondemand',
				infinite: true,
				slidesToShow: 1,
				dots: true,
				arrows: false
	      }
	    },
	    {
      breakpoint: 480,
	      settings: {
	        arrows: false,
	        dots: true,
	        centerMode: true,
	        centerPadding: '40px',
	        slidesToShow: 1,
	        variableWidth: true
	      }
	    }
	   ]
	});
});
