logout = (token) ->
  html.addClass('unlogged').removeClass 'logged admin guest'
  if token then log 'Logged out'
  return

doc.on 'submit', '#login-form', ->
  form = $ @
  field = form.serializeArray()[0]
  $('#login-popover')[0].hidePopover()
  form.trigger 'reset'
  if field['value'] and field['name'] is 'login-token'
    bootstrap field['value']
  return

# Logout button
doc.on 'click', '#logout-button', ->
  logout storage.get 'token'

#
# AUTH FUNCTIONS
# --------------
# GitHub auth, personal token as argument
get_auth = (token) -> $.get
  url: '{{ site.github.api_url }}/user'
  headers: { 'Authorization': "token #{ token }" }
  success: (user) ->
    storage.set 'token', token
    storage.set 'user', user.login
    return # End get_auth done
  error: (request) ->
    if request.status is 401
      storage.clear()
      log "Bad credentials", 'bg-red-dark'
    do logout
    return