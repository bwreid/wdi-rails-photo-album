class Welcome

  @document_ready: ->
    $('#new').on('click', 'a[data-clear-form]', Welcome.clear_form)
    $('#photo-form').on('click', 'a[data-clear-form]', Welcome.clear_form)
    $('#slider').slider({ min: 1, max: $('li img').length, step: 1, slide: Welcome.sliding })
    $('#slider').slider('option', 'value', $('li img').length)

  @clear_form: (e) ->
    e.preventDefault()
    $('#new').empty()
    $('#photo-form').empty()

  @sliding: (e, ui) ->
    album_id = $('#slider').data('album-id');
    count = ui.value
    settings =
      dataType: 'script' # THIS MEANS JS IS EXPECTING EXECUTABLE JS BACK
      type: 'get'
      url: "/albums/#{album_id}/filter?count=#{count}" # THIS SENDS BACK SOMETHING LIKE /albums/3/filter?count=4
    $.ajax(settings) # THAT'S OUR AJAX CALL

$(document).ready(Welcome.document_ready)