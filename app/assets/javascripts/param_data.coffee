$(document).ready ->
  $('#create_service_errors').bind 'DOMSubtreeModified', ->
    success = $('#create_service_errors').text()
    if success.indexOf("added sucessfully") != -1
      currentText = document.getElementById('service_service_name').value

      for list in ["edit_service_fields_service","create_service_fields_service", "tracking_datum_service_name_create","tracking_datum_service_name_search","service_id"]
        myselect = document.getElementById(list)
        objOption = document.createElement("option")
        objOption.text = currentText
        objOption.value = currentText
        myselect.options.add(objOption)
  return
return

$(document).ready ->
  $('#edit_results').bind 'DOMSubtreeModified', ->
    $("#edit_results :input[id*='tracking_datum_id']").attr("readonly", "true")
  return

