$(document).on 'pageshow', '#display_station_page', ->
	stationInfo = JSON.parse window.sessionStorage.getItem 'stationInfo'
	console.log JSON.stringify stationInfo

	createMap(stationInfo.coords.lat, stationInfo.coords.lon, 'toBeDone!', 'stationMap')
	$(stationInfo.station).each ->		
		$('#stationTimeTable').append """<p>Origin: #{@.origin}, Expected arrival #{@.arrival}</p><p>Destination: #{@destination} Expected departure: #{@.depart}</p><hr>"""
