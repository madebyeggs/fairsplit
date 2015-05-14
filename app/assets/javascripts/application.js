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
//= require jquery.readmore
//= require scrollTo
//= require gmap3
//= require mapSettings
//= require urlsForPosting
//= require social-share-button

$(window).load(function() { // makes sure the whole site is loaded
	$('#container').isotope({ filter: '.announcements' });
})

$(document).ready(function() {
	$('#status').fadeOut(); // will first fade out the loading animation
	$('#preloader').delay(350).fadeOut('slow'); // will fade out the white DIV that covers the website.
	$('body').delay(550).css({'overflow':'visible'});
	//homePage title show
	$('.homeTitle').show();	
	$('.fitvids').fitVids();
	
	//navigation links hover opcaity animation
	$('.navButton a').css('opacity', 1);  
	// when hover over the selected item change the opacity to 1  
	$('.navButton a').hover(function(){  
		$(this).stop().fadeTo('medium', 0.4);  
	},  
	function(){  
	    $(this).stop().fadeTo('medium', 1);  
	});
	
	//mobileNavMenu
	$(function(){
		$('#menu').slicknav();
	});
	
	//newspage detail dynamics
	//open
	$(".launchAnnouncement").click(function(){
		var id = jQuery(this).prev('.announcement-object-uid').val();
		var div_id = '#' + 'announcement' + id;
		scroll_calc = $('.canScroll5').scrollTop();
		$(div_id).slideDown(500);
		$(".element").children(':not(.projectInfo)').fadeTo("fast", 0.3);
		$(".muteEffects").addClass("displayNone");
		$('.canScroll5').animate({scrollTop:$('#scrollHereAnnouncement' + id).position().top + scroll_calc}, 'slow');
	});
	//close
	$(".announcementCloseIcon").click(function(){
		var id = jQuery(this).prev('.announcement-object-uid').val();
		var div_id = '#' + 'announcement' + id;
		scroll_calc = $('.canScroll5').scrollTop();
		$(div_id).slideUp(500);
		$(".element").children(':not(.projectInfo)').fadeTo("slow", 1);
		$(".muteEffects").removeClass("displayNone");
		$('.canScroll5').animate({scrollTop:scroll_calc}, 250);
	});
	//works VIDEO dynamics
	//open
	$(".launchWork").click(function(){
		var id = jQuery(this).prev('.work-object-id').val();
		var div_id = '#' + 'work' + id;
		scroll_calc = $('.canScroll2').scrollTop();
		$(div_id).slideDown(500);
		$(".element").children(':not(.projectInfo)').fadeTo("fast", 0.3);
		$(".muteEffects").addClass("displayNone");
		$('.canScroll2').animate({scrollTop:$('#scrollHereWork' + id).position().top + scroll_calc}, 'slow');
	});
	//close
	$(".workCloseIcon").click(function(){
		var id = jQuery(this).prev('.work-object-id').val();
		var div_id = '#' + 'work' + id;
		scroll_calc = $('.canScroll2').scrollTop();
		$(div_id).slideUp(500);
		$(".element").children(':not(.projectInfo)').fadeTo("slow", 1);
		$(".muteEffects").removeClass("displayNone");
		$('.canScroll2').animate({scrollTop:scroll_calc}, 250);
	});
	//listen PLAYLIST dynamics
	//open
	$(".launchPlaylist").click(function(){
		var id = jQuery(this).prev('.playlist-object-id').val();
		var div_id = '#' + 'playlist' + id;
		scroll_calc = $('.canScroll3').scrollTop();
		$(div_id).slideDown(500);
		$(".element").children(':not(.projectInfo)').fadeTo("fast", 0.3);
		$(".muteEffects").addClass("displayNone");
		$('.canScroll3').animate({scrollTop:$('#scrollHerePlaylist' + id).position().top + scroll_calc}, 'slow');
	});
	//close
	$(".playlistCloseIcon").click(function(){
		var id = jQuery(this).prev('.playlist-object-id').val();
		var div_id = '#' + 'playlist' + id;
		scroll_calc = $('.canScroll3').scrollTop();
		$(div_id).slideUp(500);
		$(".element").children(':not(.projectInfo)').fadeTo("slow", 1);
		$(".muteEffects").removeClass("displayNone");
		$('.canScroll3').animate({scrollTop:scroll_calc}, 250);
	});
	//artist detail dynamics
	//open
	$(".launchArtist").click(function(){
		var id = jQuery(this).prev('.artist-object-id').val();
		var div_id = '#' + 'artist' + id;
		scroll_calc = $('.canScroll4').scrollTop();
		$(div_id).slideDown(500);
		$(".element").children(':not(.projectInfo)').fadeTo("fast", 0.3);
		$(".muteEffects").addClass("displayNone");
		$('.canScroll4').animate({scrollTop:$('#scrollHereArtist' + id).position().top + scroll_calc}, 'slow');
	});
	//close
	$(".artistCloseIcon").click(function(){
		var id = jQuery(this).prev('.artist-object-id').val();
		var div_id = '#' + 'artist' + id;
		scroll_calc = $('.canScroll4').scrollTop();
		$(div_id).slideUp(500);
		$(".element").children(':not(.projectInfo)').fadeTo("slow", 1);
		$(".muteEffects").removeClass("displayNone");
		$('.canScroll4').animate({scrollTop:scroll_calc}, 250);
	});
	
	//bug fix on navigtaion buttons
	$(".fixMute").click(function(){
		$(".muteEffects").removeClass("displayNone");
		$(".element").children(':not(.projectInfo)').fadeTo("slow", 1);
	});
	
	//autoscaling text on titles
	$(".subTitle").fitText(1.0, { minFontSize: '16px', maxFontSize: '26px' });

});