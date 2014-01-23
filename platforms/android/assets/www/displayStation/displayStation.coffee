$(document).on 'pagebeforeshow', '#display_station_page', ->
	stationInfo = JSON.parse window.sessionStorage.getItem 'stationInfo'
	console.log JSON.stringify stationInfo

	$('#stationTitle').text stationInfo.name
	if stationInfo.coords.lat? && stationInfo.coords.lon?
		createMap(stationInfo.coords.lat, stationInfo.coords.lon, stationInfo.name, 'stationMap')
	else
		$('#stationMap').css 'display', 'none'
		navigator.notification.confirm 'Invalid location returned', null, ["Can't display map"], ["Continue"]
	$(stationInfo.station).each ->		
		$('#stationTimeTable').append """<a href="#" onclick="showMe('#{@.code}')">Origin: #{@.origin}, Expected arrival #{@.arrival}<br>Destination: #{@destination} Expected departure: #{@.depart}</a><hr>"""
		#above link calls to first.coffee as it is a repeat of the showMe function from that page. 
