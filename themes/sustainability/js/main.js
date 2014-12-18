$(document).ready(function() {

	// add js class to body if javascript enabled
	$('html').removeClass('no-js');

	// Shifter
	$.shifter({
		maxWidth: "767px"
	});

	// Naver
	$(".naver").naver();

	// Boxer
	$(".boxer").boxer();

	$(".target").roller({
			paged: true,
			pagination: false
		});

});
