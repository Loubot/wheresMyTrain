document.addEventListener 'deviceready', init, false
  # initMaps()

window.goHome = () ->
  $.mobile.changePage "../splashPage/splashPage.html", transition: 'slide', changeHash: true, reverse: true

window.quit = () ->
  navigator.notification.confirm 'Exit App?', endApp, 'Quitting', ['Yep', 'Nope']


endApp = (choice) ->
  switch choice
    when 1 then navigator.app.exitApp()
    else null