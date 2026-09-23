# BASIC FORM
# ----------------------------
$('form').each ->
  form = $ @
  # RESET
  form.on 'reset', ->
    form.addClass 'reset'
      .removeClass 'submit'
    $(':input', form).blur()
    return # End reset
  # SUBMIT
  form.on 'submit', ->
    form.addClass 'submit'
    return # End Submit
  # CHANGE
  form.on 'change', ->
    form.removeClass 'submit reset'
    return # End Submit
  return # End Forms

# checkFile
# -------------------------
checkFile = (file_url, out) -> $.get
  url: file_url
  # arguments: Object, 'error', 'Not Found'
  error: (request, status , error) ->
    if request.status is 404
      saveFile file_url, out
    return # End 404
  success: (data) ->
    saveFile file_url, out, {sha: data.sha}
    return # End Overwrite

saveFile = (file_url, file, sha) -> $.ajax
  url: file_url
  method: 'PUT'
  data: JSON.stringify $.extend {
    message: "RUDRA #{ file_url }"
    content: btoa file
  }, sha
  success: (data) ->
    log "OK: #{ data.content.path } / #{ data.commit.sha.slice 0, 7 }"
    form.trigger 'reset'
    html.removeClass('updated').addClass 'behind'
    if environment isnt 'development' then do get_builds
    return # End save_file