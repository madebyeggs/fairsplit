// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery-1.9.1.min
//= require jquery-migrate-1.2.1.min
//= require jquery-easing-1.3
//= require modernizr
//= require retina
//= require jquery.isotope.min
//= require jquery.ba-bbq.min
//= require jquery.isotope.load_home
//= require jquery.form
//= require input.fields
//= require responsive-nav
//= require jquery.flexslider-min
//= require jquery.fancybox.pack
//= require image-hover
//= require scrollup
//= require jquery.fitvids
//= require twitter/bootstrap
//= require jquery.slicknav
//= require jquery.fittext
//= require jquery.collapser
//= require mustache
//= require_tree ../../templates
//= require_tree .

$(window).load(function() { // makes sure the whole site is loaded
	$('#status').fadeOut(); // will first fade out the loading animation
	$('#preloader').delay(350).fadeOut('slow'); // will fade out the white DIV that covers the website.
	$('body').delay(550).css({'overflow':'visible'});
})

$(document).ready(function() {  
  
	//navigation links hover opcaity animation
	$('.navButton a').css('opacity', 1);  
	// when hover over the selected item change the opacity to 1  
	$('.navButton a').hover(function(){  
		$(this).stop().fadeTo('medium', 0.4);  
	},  
	function(){  
	    $(this).stop().fadeTo('medium', 1);  
	});
	
	//auto scalling video
	$(".fitvids").fitVids();
	
	//mobileNavMenu
	$(function(){
		$('#menu').slicknav();
	});
	
	//autoscaling text on titles
	$(".subTitle").fitText(1.0, { minFontSize: '16px', maxFontSize: '36px' });
	
	//news page collapsing
	$('.shrinkable').collapser({
		mode: 'chars',
		truncate: 135
	});
	
	//// Detect click from releases view and generate correct release display
	jQuery(".artistClick").click(function() {
		
		var id = jQuery(this).prev('.modal-object-id').val();
		console.log(id);
		
		jQuery.ajax({
			dataType: "json",
			url: "./artists/artist_show_via_ajax_call",
			data: {id: id},
			success: function(data) {
				console.log(data);
				var artist_content = SMT['artistShow'](data);
				jQuery('#artistShowWrapper').fadeIn(750);
				jQuery('#artistShowContent').empty().hide().append(artist_content).fadeIn(750);
			}
		});
	});
	
});