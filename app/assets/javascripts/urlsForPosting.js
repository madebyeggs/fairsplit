$(document).ready(function() {
	
	//artist open from URL 
	var str = window.location.href;
	if (str.toLowerCase().indexOf("announcements/") >= 0) {
		var announcement_id = str.split("#")[2];
		announcement_urlLaunch(announcement_id);
	}
	else if (str.toLowerCase().indexOf("works/") >= 0) {
		var work_id = str.split("#")[2];
		work_urlLaunch(work_id);
	}
	else if (str.toLowerCase().indexOf("artists/") >= 0) {
		var artist_id = str.split("#")[2];
		artist_urlLaunch(artist_id);
	}
	else if (str.toLowerCase().indexOf("playlists/") >= 0) {
		var playlist_id = str.split("#")[2];
		playlist_urlLaunch(playlist_id);
	}
	else {
		clear_all();
	}
	function announcement_urlLaunch(announcement_id) {
		var div_id = '#' + 'announcement' + announcement_id;
		$(div_id).slideDown(500);
		$(".element").children(':not(.projectInfo)').fadeTo("fast", 0.3);
		$(".muteEffects").addClass("displayNone");
		$(window).load(function() {
			$('#container').isotope({ filter: '.announcements' });
			$('.canScroll5').animate({scrollTop:$('#scrollHereAnnouncement' + announcement_id).position().top + 0}, 'slow');
		})
	}
	function work_urlLaunch(work_id) {
		var div_id = '#' + 'work' + work_id;
		$(div_id).slideDown(500);
		$(".element").children(':not(.projectInfo)').fadeTo("fast", 0.3);
		$(".muteEffects").addClass("displayNone");
		$(window).load(function() {
			$('#container').isotope({ filter: '.works' });
			$('.canScroll2').animate({scrollTop:$('#scrollHereWork' + work_id).position().top + 0}, 'slow');
		})
	}
	function artist_urlLaunch(artist_id) {
		var div_id = '#' + 'artist' + artist_id;
		$(div_id).slideDown(500);
		$(".element").children(':not(.projectInfo)').fadeTo("fast", 0.3);
		$(".muteEffects").addClass("displayNone");
		$(window).load(function() {
			$('#container').isotope({ filter: '.artists' });
			$('.canScroll4').animate({scrollTop:$('#scrollHereArtist' + artist_id).position().top + 0}, 'slow');
		})
	}
	function playlist_urlLaunch(playlist_id) {
		var div_id = '#' + 'playlist' + playlist_id;
		$(div_id).slideDown(500);
		$(".element").children(':not(.projectInfo)').fadeTo("fast", 0.3);
		$(".muteEffects").addClass("displayNone");
		$(window).load(function() {
			$('#container').isotope({ filter: '.playlists' });
			$('.canScroll3').animate({scrollTop:$('#scrollHerePlaylist' + playlist_id).position().top + 0}, 'slow');
		})
	}
	function clear_all() {
		$(".element").children(':not(.projectInfo)').fadeTo("slow", 1);
		$(".muteEffects").removeClass("displayNone");
	}
	
});