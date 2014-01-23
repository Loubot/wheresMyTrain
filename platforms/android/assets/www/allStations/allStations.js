// Generated by CoffeeScript 1.6.3
(function() {
  var displayStations;

  $(document).on('pagebeforeshow', '#all_stations_page', function() {
    return getAllStations('A');
  });

  window.getAllStations = function(type) {
    return $.ajax({
      url: 'http://10.0.2.2:3000/get_all_stations.json',
      type: 'get',
      dataType: 'json',
      data: {
        type: type
      },
      timeout: 10000,
      success: function(result) {
        return displayStations(result);
      },
      error: function(error) {
        return console.log(JSON.stringify(error));
      }
    });
  };

  displayStations = function(json) {
    $('#allStationsList').empty();
    return $(json).each(function() {
      return $('#allStationsList').append("<a href=\"#\" onclick=\"stationChoice('" + this.stationId + "')\">" + this.name + "</a><hr> ");
    });
  };

}).call(this);
