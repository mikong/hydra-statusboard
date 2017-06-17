$(document).on "turbolinks:load", ->
  return unless $("body.admin.announcements").length > 0

  formatEmoji = (emoji) ->
    if !emoji.id
      return emoji.text
    $emoji = $('<span><img height="24" class="emojione" src="//cdn.jsdelivr.net/emojione/assets/png/' + emoji.unicode  + '.png" />' + emoji.text + '</span>')

  $.getJSON '/emoji_strategy.json', (data) ->
    results = $.map data, (value, key) ->
      {
        id: value.shortname
        text: value.shortname
        unicode: value.unicode
      }

    $('#announcement_emoji').select2
      data: results
      minimumInputLength: 1
      templateSelection: formatEmoji
      templateResult: formatEmoji
