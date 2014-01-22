$(document).on 'pagebeforeshow', '#display_station_page', ->
	stationInfo = JSON.parse window.sessionStorage.getItem 'stationInfo'
	console.log JSON.stringify stationInfo

	$('#stationTitle').text stationInfo.name
	createMap(stationInfo.coords.lat, stationInfo.coords.lon, stationInfo.name, 'stationMap')
	$(stationInfo.station).each ->		
		$('#stationTimeTable').append """<a href="#" onclick="showMe('#{@.code}')">Origin: #{@.origin}, Expected arrival #{@.arrival}<br>Destination: #{@destination} Expected departure: #{@.depart}</a><hr>"""
		#above link calls to first.coffee as it is a repeat of the showMe function from that page. 
