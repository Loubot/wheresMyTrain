$(document).on 'pagebeforeshow', '#all_trains_page', ->
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
      url: 'http://10.0.2.2:3000/all_trains.json'
      dataType : 'json'
      success: (json) ->
        populatePage(json)
        console.log 'success'
      error: (error) ->
        console.log 'shite ' + JSON.stringify error
        

  getTrainInfo('A')

  window.trainsStorer = new allTrains()
  populatePage = (json) ->
    # alert JSON.stringify json[0].desc
    $('#trainInfo').empty()
    $(json).each ->
      $('#trainInfo').append """<a href='#' onclick="showMe('#{@.code}')">#{@.desc}</a><hr>"""
      trainsStorer.storeTrains @.code, @


window.showMe = (code) ->#this function also called from displayStation.coffee
  window.sessionStorage.setItem 'trainCode', code
  console.log 'trainInfo' + window.sessionStorage.getItem 'trainCode'
  $.mobile.changePage '../displayTrain/displayTrain.html',
    transition: 'slide'
    changeHash: 'true'

#http://www.ikea.com/ie/en/images/products/lillabo--piece-basic-train-set__65510_PE176881_S4.jpg
#https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcTtwzta5d6AlhrDIzdDi6RyYDoRFOLgLvzyA_5yEFB9-oSBvkOm