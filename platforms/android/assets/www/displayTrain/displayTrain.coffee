$(document).on 'pagebeforeshow', '#display_train_page', ->
	trainCode = JSON.parse window.sessionStorage.getItem 'trainCode'
	console.log 'displayTrain info ' + JSON.stringify trainInfo

	$.ajax
		url: 'http://10.0.2.2:3000/train_info.json'
		data: { data: trainCode }
		dataType: 'json'
		timeout: 10000
		success: (result) ->
			addStops result
		error: (error) ->
			console.log 'displayTrain error ' + JSON.stringify error
	

addStops = (stopsInfo) ->
	console.log 'stops info ' + JSON.stringify stopsInfo

	$('#displayTrain').append """#{trainInfo.desc}"""
	createMap trainInfo.coords.lat,trainInfo.coords.lon,trainInfo.coords.desc,'mapContainer'

	$(stopsInfo.stops).each ->
		$('#trainStops').append """<a href="#" onclick="getStationInfo('#{@.stopCode}')">#{@.stop}: Expected arrival: #{@.exArrival}, Expected departure: #{@.exDepart}</p>"""

window.getStationInfo = (code) ->
	window.sessionStorage.setItem 'stationCode', code
	$.mobile.changePage '../displayStation/displayStation.html', transition: 'slide', changeHash:true