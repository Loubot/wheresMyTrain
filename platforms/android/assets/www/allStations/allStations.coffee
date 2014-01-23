$(document).on 'pagebeforeshow', '#all_stations_page', ->
  getAllStations('A')


window.getAllStations = (type) ->
  $.ajax
    url: 'http://10.0.2.2:3000/get_all_stations.json'
    type: 'get'
    dataType:'json'
    data: { type: type}
    timeout: 10000
    success: (result) ->
      displayStations(result)
    error: (error) ->
      console.log JSON.stringify error


displayStations = (json) ->
  $('#allStationsList').empty()
  $(json).each ->
    $('#allStationsList').append """<a href="#" onclick="stationChoice('#{@.stationId}')">#{@.name}</a><hr> """