# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $('#edit_results').bind 'DOMSubtreeModified', ->
    $("#edit_results :input[id*='tracking_datum_id']").attr("readonly", "true")
  return

