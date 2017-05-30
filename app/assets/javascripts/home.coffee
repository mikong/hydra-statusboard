$(document).on "turbolinks:load", ->
  return unless $("body.home").length > 0

  refreshDateDisplay = ->
    $('#time-display').html moment().format('h:mm A')
    $('#date-display').html moment().format('dddd, MMMM DD, YYYY')
    return

  setInterval refreshDateDisplay, 10000
