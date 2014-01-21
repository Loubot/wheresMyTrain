window.init = () ->
  console.log 'begin'
  
  class allTrains
    constructor: () ->
      @trainsInfo = []

    storeTrains: (code, train) ->
      @trainsInfo[code] = train
    getTrain: (code) ->
      return @trainsInfo[code]
  
  window.getTrainInfo = (type) ->
    $.ajax
      type: 'get'
      data: { data: type }
      url: 'http://10.0.2.2:3000/all_stations.json'
      dataType : 'json'
      success: (json) ->
        populatePage(json)
        console.log 'success'
      error: (error) ->
        alert 'shite ' + JSON.stringify error
        console.log 'error'

  getTrainInfo('A')

  trainsStorer = new allTrains()
  populatePage = (json) ->
    # alert JSON.stringify json[0].desc
    $('#trainInfo').empty()
    $(json).each ->
      $('#trainInfo').append """<a href='#' onclick="showMe('#{@.code}')">#{@.desc}</a><hr>"""
      trainsStorer.storeTrains @.code, @


  window.showMe = (code) ->
    window.sessionStorage.setItem 'trainInfo', JSON.stringify trainsStorer.getTrain code
    console.log 'trainInfo' + window.sessionStorage.getItem 'trainInfo'
    $.mobile.changePage '../displayTrain/displayTrain.html',
      transition: 'slide'
      changeHash: 'true'