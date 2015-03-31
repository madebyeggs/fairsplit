jQuery(document).ready(function(){					
 
	 jQuery('.title-wrap, .subtitle-wrap, .paragraph-wrap').not('.flexslider .title-wrap, .flexslider .subtitle-wrap, .paragraph-wrap').each(function() {
        jQuery(this).data('wrapping', jQuery(this).width());
        jQuery(this).css('width', 0);
     });

      jQuery('.images').not('.flexslider .images').bind('mouseenter', function() {
        jQuery(this).find('.title-wrap').stop().each(function() {
          jQuery(this).animate({
            width: jQuery(this).data('wrapping')
          }, 150);
      	});
        jQuery(this).find('.subtitle-wrap').stop().each(function() {
          jQuery(this).delay(250).animate({
            width: jQuery(this).data('wrapping')
          }, 150);
        });
		jQuery(this).find('.paragraoh-wrap').stop().each(function() {
          jQuery(this).delay(250).animate({
            width: jQuery(this).data('wrapping')
          }, 150);
        });
      });

      jQuery('.images').not('.flexslider .images').bind('mouseleave', function() {
        jQuery(this).find('.title-wrap').stop().each(function() {
          jQuery(this).animate({
            width: 0
          }, 0);
      	});
        jQuery(this).find('.subtitle-wrap').stop().each(function() {
          jQuery(this).animate({
            width: 0
          }, 0);
        });
		jQuery(this).find('.paragraoh-wrap').stop().each(function() {
          jQuery(this).animate({
            width: 0
          }, 0);
        });
      });
	
	  
	  jQuery('.element').hover(function() {
			 jQuery(this).find('.caption, .overlay2').stop().animate({
    			"opacity": "1"
  }, 150 );
			 }, function() {
			jQuery(this).find('.caption, .overlay2').stop().animate({
    "opacity": "0"
  }, 150 );
			 
	   });
	
	jQuery('.element').hover(function() {
			 jQuery(this).find('.caption, .overlay3').stop().animate({
    			"opacity": "1"
  }, 150 );
			 }, function() {
			jQuery(this).find('.caption, .overlay3').stop().animate({
    "opacity": "0"
  }, 150 );

	   });
	  
	  
	  jQuery('.element').hover(function() {
			 jQuery(this).find('.hidden-infos').stop().fadeToggle(150);
			 
	   });
	  
	  
	  jQuery('.about').click(function() {
			 jQuery(this).find('.movable-content').stop().animate({
    "margin-left": "300px"
  }, 200 );
			 
	   });
	  
	  
	   jQuery('.about').bind('mouseleave', function() {
			 jQuery(this).find('.movable-content').stop().animate({
    "margin-left": "0px"
  }, 200 );
			 
	   });
	  
	  if( /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent) ) {
      $('body').addClass('touch')
    }
	  
	jQuery('#options li').not('.touch #options li').bind('mouseover', function() {
	  jQuery(this).find('.menu-line').stop().animate({
    "width": "100%"
  }, 150 );
	   });
	
	jQuery('#options li').not('.touch #options li').bind('mouseout', function() {
	  jQuery(this).find('.menu-line').stop().animate({
    "width": "0"
  }, 150 );
	   });
	
	
	
	
	
	
	jQuery('.button').hover(function() {
			 jQuery(this).animate({backgroundColor:'#ddd'}, 150);
			 }, function() {
			jQuery(this).animate({backgroundColor:'#d6d6d6'}, 250);
			 
	   });
	
});