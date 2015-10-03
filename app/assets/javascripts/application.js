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
//= require turbolinks
//= require modernizr
//= require retina
//= require jquery.lazyload
//= require image-hover
//= require jquery.fitvids
//= require jquery.slicknav
//= require twitter/bootstrap
//= require nprogress
//= require nprogress-turbolinks
//= require jquery.prettySocial
// gmap3
// mapSettings

$(document).on('page:load', function() {
	applicash();
});

$(document).ready(function() {
	applicash();
});
function applicash(){
	
	$('.prettySocial').prettySocial();
	
	$('.fitvids').fitVids();
	
	$("img").lazyload();
	
	//navigation links hover opcaity animation
	$('.navigationButton a').css('opacity', 1);  
	// when hover over the selected item change the opacity to 1  
	$('.navigationButton a').hover(function(){ 
		$(this).stop().fadeTo('medium', 0.4);  
		},  
		function(){  
	    $(this).stop().fadeTo('medium', 1);  
	});
	
	//mobileNavMenu
	$(function(){
		$('#menu').slicknav();
	});
	
	$('.delete_post').on('click', function() {
		if(confirm('Are you sure you want to delete this record')){
	    	return true
	    }else{
	        return false;
	    }
	});
	
	$(".tips").tooltip();
	
}