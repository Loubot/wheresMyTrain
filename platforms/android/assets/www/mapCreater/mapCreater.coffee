window.createMap = (lat, lon, info,containerId) ->
	if lat == '0' or lon == '0' 
		navigator.notification.confirm 'Invalid location returned', null, "Can't display map", 'Continue'
		$("##{containerId}").css 'display', 'none'
	else
		latlng = new google.maps.LatLng lat, lon
		alert latlng
		map = new google.maps.Map document.getElementById(containerId),
			center:latlng
			zoom:10
			mapTypeId:google.maps.MapTypeId.ROADMAP

		

		infoWindow = new google.maps.InfoWindow
			content: info

		marker = new google.maps.Marker
			position: latlng
			map: map	

		google.maps.event.addListener marker, 'click', ->
			infoWindow.open map, marker

		infoWindow.open map, marker	#open window straight away. 		

