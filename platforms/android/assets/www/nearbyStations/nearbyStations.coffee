$(document).on 'pagebeforeshow', '#nearby_stations_page', ->
	$('#nearby_stations_page').on 'scrollstart', (e) ->
		e.preventDefault()

	navigator.geolocation.getCurrentPosition(gotCoords, failedCoords, { timeout:10000, enableHighAccuracy: true })

gotCoords = (position) ->	
	$.ajax
		url: 'http://10.0.2.2:3000/close_stations.json'
		type: 'get'
		dataType: 'json'
		data: { coords: [position.coords.longitude,position.coords.latitude] }
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
	createMap position.coords.longitude, position.coords.latitude, 'You are here', 'nearbyStationsMap'
