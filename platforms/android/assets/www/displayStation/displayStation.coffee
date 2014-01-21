$(document).on 'pageshow', '#display_station_page', ->
	stationInfo = JSON.parse window.sessionStorage.getItem 'stationInfo'
	console.log JSON.stringify stationInfo
	$(stationInfo).each ->		
		$('#stationTimeTable').append """<p>Origin: #{@.origin}</p>"""
