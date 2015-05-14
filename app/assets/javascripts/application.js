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
//= require urlsForPosting
//= require social-share-button

$(document).ready(function() {
	
	$(window).load(function() { // makes sure the whole site is loaded
		$('#status').fadeOut(); // will first fade out the loading animation
		$('#preloader').delay(350).fadeOut('slow'); // will fade out the white DIV that covers the website.
		$('body').delay(550).css({'overflow':'visible'});
		//homePage title show
		$('.homeTitle').show();
		$('#container').isotope({ filter: '.announcements' });
		$("#map_canvas").show();

		// Create an array of styles.
		var styles = [
			{
		  		stylers: [
		    		{ visibility: "on" },
		    		{ saturation: -100 },
					{ gamma: 1 }
		  		]
			},{
				featureType: "poi.business",
				elementType: "labels",
				stylers: [
					{ visibility: "off" }
				]
			}
		];

		// Create a new StyledMapType object, passing it the array of styles,
		// as well as the name to be displayed on the map type control.
		var styledMap = new google.maps.StyledMapType(styles,{name: "Styled Map"});

		// Map Coordination (center)
		var latlng = new google.maps.LatLng(51.524693, -0.083074);

		// Map Options
		var myOptions = {
			zoom: 16,
			center: latlng,
			mapTypeId: google.maps.MapTypeId.ROADMAP,
			disableDefaultUI: true,
			scrollwheel: false,
			disableDoubleClickZoom: false,
			zoomControl: true,
			zoomControlOptions: true,
			mapTypeControlOptions: {
				mapTypeIds: [google.maps.MapTypeId.ROADMAP, 'map_style']
			}
		};

		var map = new google.maps.Map(document.getElementById('map_canvas'), myOptions);

		//Associate the styled map with the MapTypeId and set it to display.
		map.mapTypes.set('map_style', styledMap);
		map.setMapTypeId('map_style');

		// Marker Image
		var image = 'assets/marker.png';

		// Marker Coordination
		var myLatlng = new google.maps.LatLng(51.523571, -0.078459);

		// Marker Text 
		var contentString = '<div id="mapsContent">'+
		'<div id="siteNotice">'+
		'</div>'+
		'<p>' +

		'<h4>' + 'YOU CAN FIND US AT:' + '</h4>' + 'Village Underground, 54 Holywell Lane,' + '<br/>' + 'London, EC2A 3PQ' + 

		'</p>'+
		'</div>';

		var marker = new google.maps.Marker({
			position: myLatlng,
			map: map,
			title: 'The Office',
			icon: image
		});

		var infowindow = new google.maps.InfoWindow({
			content: contentString
		});

		//toggle marker text	  	
		google.maps.event.addListener(marker, 'click', function() {
			infowindow.open(map,marker);
		});

		//auto open marker text
		infowindow.open(map,marker);

		/* ========= End Marker ========= */
	});
	
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
		var home_sound_id = '#' + 'homeSoundiFrame' + id;
		var homeSoundiFrame = $(home_sound_id);
		homeSoundiFrame.attr("src", homeSoundiFrame.data("src"));
		var home_video_id = '#' + 'homeVideoiFrame' + id;
		var homeVideoiFrame = $(home_video_id);
		homeVideoiFrame.attr("src", homeVideoiFrame.data("src"));
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
		var work_video_id = '#' + 'workiFrame' + id;
		var workVideoiFrame = $(work_video_id);
		workVideoiFrame.attr("src", workVideoiFrame.data("src"));
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
		var sound_id = '#' + 'soundiFrame' + id;
		var soundiFrame = $(sound_id);
		soundiFrame.attr("src", soundiFrame.data("src"));
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
		var artist_sound_id = '#' + 'artistSoundiFrame' + id;
		var artistSoundiFrame = $(artist_sound_id);
		artistSoundiFrame.attr("src", artistSoundiFrame.data("src"));
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