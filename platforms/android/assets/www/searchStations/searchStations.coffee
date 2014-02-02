$(document).on 'pagebeforeshow', '#search_stations_page', -> 
  

$(document).on 'click', '#submitSearch', ->
  $.ajax
    url: 'http://10.0.2.2:3000/search_stations.json'
    data: { data: $('#search-basic').val() }
    type: 'get'
    dataType: 'json'
    timeout: 10000
    success: (json) ->
      populateSearchResults(json)
    error: (error) ->
      console.log JSON.stringify error


populateSearchResults = (results) ->
  console.log JSON.stringify results
  $('#searchResults').empty()
  $('#searchResults').append """<h3>Matching stations:</h3> """
  $(results).each ->
    $('#searchResults').append """<a href="#" onclick="displayStation('#{@.StationCode}')">#{@.StationDesc}</a><hr> """

window.displayStation = (code) ->
  window.sessionStorage.setItem 'stationCode', code.replace /\s+/ ,""
  $.mobile.changePage "../displayStation/displayStation.html", transition: 'slide', changeHash: true