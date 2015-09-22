$(document).ready(function(){
	mapSettings();
});
	
function mapSettings(){
		
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
}