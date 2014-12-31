jQuery(function() {
	jQuery('.canScroll').scroll(function() {
		if(jQuery(this).scrollTop() != 0) {
			jQuery('#toTop, #backtotop').fadeIn();	
		} else {
			jQuery('#toTop, #backtotop').fadeOut();
		}
	});
	jQuery('#toTop').click(function() {
		jQuery('.canScroll').animate({scrollTop:0},800);
	});	
});

jQuery(function() {
	jQuery('.canScroll2').scroll(function() {
		if(jQuery(this).scrollTop() != 0) {
			jQuery('#toTop2, #backtotop2').fadeIn();	
		} else {
			jQuery('#toTop2, #backtotop2').fadeOut();
		}
	});
	jQuery('#toTop2').click(function() {
		jQuery('.canScroll2').animate({scrollTop:0},800);
	});	
});

