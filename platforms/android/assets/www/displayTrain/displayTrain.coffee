$(document).on 'pageshow', '#display_train_page', ->
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
	# console.log 'stops info ' + JSON.stringify stopsInfo
	$(stopsInfo).each ->
		$('#trainStops').append """<a href="#" onclick="showStation()">#{@.stop}: Expected arrival: #{@.exArrival}, Expected departure: #{@.exDepart}</p>"""

window.showStation = () ->
	alert 'yos'	