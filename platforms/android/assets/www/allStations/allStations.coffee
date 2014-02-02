$(document).on 'pagebeforeshow', '#all_stations_page', ->
  getStations 'A'


window.getStations = (choice) ->
    $.ajax
      url: "http://10.0.2.2:3000/get_all_stations.json"
      data: { type: choice }
      type:'get'
      dataType:'json'
      timeout:10000
      success: (result) ->
        populateAllStationsPage result
      error: (error) ->
        console.log 'Get all stations failed ' + JSON.stringify error

populateAllStationsPage = (json) ->
  $('#allStationsList').empty()
  $(json).each ->
    $('#allStationsList').append """<a href="#" onclick="getStationInfo('#{@.StationCode}')">#{@.StationDesc}</a><hr> """



window.getStationInfo = (code) ->
  window.sessionStorage.setItem 'stationCode', code
  $.mobile.changePage '../displayStation/displayStation.html', transition:'slide',changeHash:true

