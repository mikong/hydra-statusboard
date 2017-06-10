$(document).on "turbolinks:load", ->
  return unless $("body.home").length > 0

  refreshDateDisplay = ->
    $('#time-display').html moment().format('h:mm A')
    $('#date-display').html moment().format('dddd, MMMM DD, YYYY')
    return

  setInterval refreshDateDisplay, 10000

  $('.emoji').each (i, obj) ->
    shortname = $(this).text()
    emoji = emojione.shortnameToImage(shortname)
    $(this).html emoji
    return

  getKeyframe = (name) ->
    ss = document.styleSheets
    i = 0
    while i < ss.length
      j = 0
      while j < ss[i].cssRules.length
        if ss[i].cssRules[j].type == window.CSSRule.WEBKIT_KEYFRAMES_RULE && ss[i].cssRules[j].name == name
          aKeyframe = ss[i].cssRules[j]
        ++j
      ++i
    return aKeyframe

  # Infinite Scrolling Text

  $container = $('.announcements')
  containerWidth = $container.width()

  $ticker = $container.find('.ticker-line')
  $tickerTrain = $ticker.find('.ticker-train')
  tickerTrainWidth = $tickerTrain.width()

  return unless tickerTrainWidth > containerWidth

  $tickerTrain.width(tickerTrainWidth)

  $clonedTrain = $tickerTrain.clone()
  $clonedTrain.addClass('cloned').appendTo $ticker
  $clonedTrain.width(tickerTrainWidth)

  endPos = - tickerTrainWidth - 4

  tickerKeyframe = getKeyframe('announcements')
  tickerKeyframe.appendRule "100% { transform: translateX(" + endPos + "px); }"
