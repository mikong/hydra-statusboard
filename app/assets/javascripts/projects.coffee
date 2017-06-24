$(document).on "turbolinks:load", ->
  return unless $("body.admin.projects").length > 0

  $('.btn.indicator-suggest').click ->
    color = $(this).data('suggest')
    $('#project_color_indicator').val color
    return
