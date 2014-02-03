$(document).on 'pagebeforeshow', '#nearby_stations_page', ->
	$('#nearby_stations_page').on 'scrollstart', (e) ->
		e.preventDefault()

	navigator.geolocation.getCurrentPosition(gotCoords, failedCoords, { timeout:10000, enableHighAccuracy: true })

gotCoords = (coords) ->
	alert coords
	$.ajax
		url: 'http://10.0.2.2:3000/close_stations.json'
		type: 'get'
		dataType: 'json'
		data: { coords: [51.894292,-8.525498] }
		timeout: 10000
		success: (json) ->
			console.log 'nearbyStations ajax success' + JSON.stringify json
		error: (error) ->
			console.log 'nearbyStations ajax failure' + JSON.stringify error

failedCoords = (error) ->
	console.log 'geolocation error ' + error
	navigator.notification.confirm 'Faied to get location', null, 'Bad location', ['Continue']