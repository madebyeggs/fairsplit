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
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require isotope.min 
//= require_tree .

$(window).load(function() { // makes sure the whole site is loaded
	$('#status').fadeOut(); // will first fade out the loading animation
	$('#preloader').delay(350).fadeOut('slow'); // will fade out the white DIV that covers the website.
	$('body').delay(350).css({'overflow':'visible'});
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
	
	
	//Navgation isotoping
	
});