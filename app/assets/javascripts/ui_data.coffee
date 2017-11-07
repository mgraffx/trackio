logResults = (json) ->
  console.log "Results: "+json
  $('#console').html "Failed call attempt with: <br> <textarea rows=\"10\" cols=\"150\">"+pUrl+"</textarea>"
  return

$(document).ready ->
  $('#query_string_input').bind 'input propertychange', ->
    query_string = @value
    if @value.indexOf("?") > -1
      track_url = @value.split("?")
      query_string = track_url[1]
      $host_elem = $('[id="tracking_host"]')
      $type = $('[id="events"]')
      ht = track_url[0].split("/")
      if (track_url[0].split(/\/\// || []).length) > 1
        $host_elem.val ht[0]+"//"+ht[2]
        $type.val ht[3]
      else
        $host_elem.val "http://"+ht[0]
        $type.val ht[1]

    newstr = ""
    for kvp in query_string.split("&")
      console.log kvp
      newstr += kvp.replace(/=/,'":"').replace(/^/, '"').replace(/$/, '"').replace(/\"\"/,'" "')
    console.log newstr
    newstr = newstr.replace(/\"\"/g, '","')
    console.log newstr
    jsn = JSON.parse('{' + newstr + '}')
    console.log jsn
    $.each jsn, (name, val) ->
      $el = $('[name="' + name + '"]')
      console.log name + " - "+ val
      if val != ""
        $el.val val
  return

$(document).ready ->
  $(document).on('click', '#makeCall', ( ->
    elem = document.getElementById("fields")
    field_list = elem.getElementsByClassName("fieldsinput")
    console.log field_list
    $el = ""
    host = ""
    event_type = $('#events').val()
    for field in field_list
      if field.id == "tracking_host"
        if !/^(http\:\/\/)?([a-z]*\.)?([a-z]|[0-9])+\.[a-z]{3}$/.test(field.value)
          alert("Invalid Host specified.\nPlease provide a valid tacking host value in the form of:\nb.aol.com or http://b.aol.com")
        if field.value.indexOf("http://") >= 0
          $el = field.value + "/" + event_type + "?" + $el
        else
          $el = "http://" + field.value + "/" + event_type + "?" + $el
          host = $el
      else
        $el = $el+"&"+field.id+"="+field.value

    $el = $el.replace("?&","?")

    console.log $el
    $el = $el+"&test_tag="+Date.now()

    pUrl = $el

    response = $.ajax
      type: 'GET',
      url: pUrl,
      cache: false,
      crossDomain: true,
      dataType: "json",
      mime_type: 'image/*',
      #jsonpCallback: "logResults",
      beforeSend: (xhr) ->
        xhr.setRequestHeader("Access-Control-Allow-Origin", host)
      error: (xhr, status, error) ->
        $('#console').html "Failed call attempt with: <br> <textarea rows=\"10\" cols=\"150\">"+pUrl+"</textarea>"
        #console.log response.responseText

  ));



$(document).ready ->
  $('#service_id option:eq(1)').prop('selected', true)
  $('#service_id').trigger("change");
  return


$(document).ready ->
  $(document).on('click', '#run_query', ( ->
    query_elem = document.getElementById("hive_query").value
    console.log "Hive query = "+query_elem
    resp = $.ajax
      type: 'GET',
      url: "/ui_data/hive_select",
      dataType:'json',
      mime_type: 'application/octet-stream',
      data: {"query_string" : query_elem},
      success: (data) ->
        console.log data
        $('#hive_results').html resp
      error: (xhr, status, err) ->
        console.log data
        $('#hive_results').html resp
    )
  );


jsonpcallback = (rtndata) ->
  console.log rtndata
  return

