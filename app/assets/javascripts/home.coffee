$(document).on "turbolinks:load", ->
  return unless $("body.home").length > 0

  refreshDateDisplay = ->
    $('#date-display').html moment().format('h:mm A dddd, MMMM DD, YYYY')
    return

  setInterval refreshDateDisplay, 10000
