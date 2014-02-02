// Generated by CoffeeScript 1.6.3
(function() {
  var populateSearchResults;

  $(document).on('pagebeforeshow', '#search_stations_page', function() {});

  $(document).on('click', '#submitSearch', function() {
    return $.ajax({
      url: 'http://10.0.2.2:3000/search_stations.json',
      data: {
        data: $('#search-basic').val()
      },
      type: 'get',
      dataType: 'json',
      timeout: 10000,
      success: function(json) {
        return populateSearchResults(json);
      },
      error: function(error) {
        return console.log(JSON.stringify(error));
      }
    });
  });

  populateSearchResults = function(results) {
    console.log(JSON.stringify(results));
    $('#searchResults').empty();
    $('#searchResults').append("<h3>Matching stations:</h3> ");
    return $(results).each(function() {
      return $('#searchResults').append("<a href=\"#\" onclick=\"displayStation('" + this.StationCode + "')\">" + this.StationDesc + "</a><hr> ");
    });
  };

  window.displayStation = function(code) {
    window.sessionStorage.setItem('stationCode', code.replace(/\s+/, ""));
    return $.mobile.changePage("../displayStation/displayStation.html", {
      transition: 'slide',
      changeHash: true
    });
  };

}).call(this);
