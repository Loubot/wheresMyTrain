$(document).on 'pagebeforeshow', '#display_train_page', ->
	trainInfo = JSON.parse window.sessionStorage.getItem 'trainInfo'

	$.ajax
		url: 'http://10.0.2.2:3000/train_info.json'
		data: { data: trainInfo.code }
		dataType: 'json'
		timeout: 10000
		success: (result) ->
			addStops result
		error: (error) ->
			console.log 'displayTrain error ' + JSON.stringify error

	
	$('#displayTrain').append """#{trainInfo.desc}"""
	createMap(trainInfo.lat,trainInfo.lon,trainInfo.desc,'mapContainer')

addStops = (stopsInfo) ->
	console.log 'stops info ' + JSON.stringify stopsInfo
	$(stopsInfo).each ->
		$('#trainStops').append """<a href="#" onclick="getStation('#{@.stopCode}')">#{@.stop}: Expected arrival: #{@.exArrival}, Expected departure: #{@.exDepart}</p>"""

window.getStation = (stopCode) ->
	alert 'getStation ajax ' +stopCode
	$.ajax
		url:'http://10.0.2.2:3000/station_info.json'
		data: { data: stopCode }
		dataType: 'json'
		success: (result) ->
			showStation(result)
		error: (error) ->
			console.log JSON.stringify result
			navigator.notification.confirm 'Failed to get station info', null, ['No luck'], ['Continue']



showStation = (stationInfo) ->
	console.log 'station hash ' + JSON.stringify stationInfo
	window.sessionStorage.setItem 'stationInfo', JSON.stringify stationInfo
	$.mobile.changePage '../displayStation/displayStation.html',
		transition:'slide'
		changeHash:true