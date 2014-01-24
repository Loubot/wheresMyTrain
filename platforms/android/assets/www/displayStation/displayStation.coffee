$(document).on 'pagebeforeshow', '#display_station_page', ->
	code = window.sessionStorage.getItem 'stationCode'	
	$.ajax
		url: "http://10.0.2.2:3000/station_info.json"
		data: { data: code }
		type: 'get'
		dataType: 'json'
		timeout: 10000
		success: (result) ->
			populateDisplayStation(result)
		error: (error) ->
			console.log 'Display station get station info ajax failed '  + JSON.stringify error

populateDisplayStation = (json) ->
	alert JSON.stringify json.coords.lat
	createMap json.coords.lat, json.coords.lon, 'toBeDone!', 'stationMap'
	$('#stationTimeTable').empty()
	$(json.station).each ->
		$('#stationTimeTable').append """<a href="#" onclick="getTrainInfo('#{@.code}')">#{@.origin}</a><hr> """

window.getTrainInfo = (trainCode) ->
	window.sessionStorage.setItem 'trainCode', trainCode
	$.mobile.changePage '../displayTrain/displayTrain.html', transition: 'slide', changeHash: true