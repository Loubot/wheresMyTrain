document.addEventListener 'deviceready', init, false
  # initMaps()

window.goHome = () ->
  $.mobile.changePage "../splashPage/splashPage.html", transition: 'slide', changeHash: true, reverse: true

window.quit = () ->
  navigator.device.exitApp()