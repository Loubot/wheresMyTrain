$(document).on 'pagebeforeshow', '#nearby_stations_page', ->
	$('#nearby_stations_page').on 'scrollstart', (e) ->
		e.preventDefault()

	navigator.geolocation.getCurrentPosition(gotCoords, failedCoords, { timeout:10000, enableHighAccuracy: true })

gotCoords = (position) ->	
	$.ajax
		url: 'http://10.0.2.2:3000/nearby_stations.json'
		type: 'get'
		dataType: 'json'
		data: { coords: [position.coords.latitude,position.coords.longitude] }
		timeout: 10000
		success: (json) ->
			console.log 'nearbyStations ajax success' + JSON.stringify json
			populateNearbyStationsMap(json, position)
		error: (error) ->
			console.log 'nearbyStations ajax failure' + JSON.stringify error

failedCoords = (error) ->
	console.log 'geolocation error ' + error
	navigator.notification.confirm 'Faied to get location', null, 'Bad location', ['Continue']

populateNearbyStationsMap = (stations, position) ->
	latlng = new google.maps.LatLng position.coords.latitude, position.coords.longitude	
	map = new google.maps.Map document.getElementById('nearbyStationsMap'),
		center:latlng
		zoom:12
		mapTypeId:google.maps.MapTypeId.ROADMAP
	marker = new google.maps.Marker
		position: latlng
		map: map	

	infoWindow = new google.maps.InfoWindow
		content: 'You are here!'
	infoWindow.open map, marker

	$(stations).each ->
		latlng = new google.maps.LatLng @.lat, @.lon
		marker = new google.maps.Marker
			position: latlng
			icon: '../img/train.png'
			message: """<p id="nearbyMessage" onclick="displayStation('#{@.code}')">#{@.stationName}</p> """
			#onclick call goes to searchStations.coffee. No need to duplicate function here
			
		marker.setMap map
		google.maps.event.addListener marker, 'click',->
			infoWindow.setContent @.message
			infoWindow.open map, @