console.log 'jq', $.fn.jquery

# Definitions
win = $ window
doc = $ document
html = $ 'html'
lang = html.attr 'lang'
login_form = $ '#login-form'
login_popover = $ '#login-popover'
bottom = $ '#bottom'
today = +new Date().setHours 0,0,0,0
environment = '{{ site.github.environment }}'
message = 'unlogged'
github_repo_url = '{{ site.github.api_url }}/repos/{{ site.github.repository_nwo }}'

# Slug strings
@slugify = (string) -> 
  return string.toString().toLowerCase().trim()
    .replace /[^\w\s\.—-]/g, '' # Remove every: not word, space, dot, dashes
    .replace /[\s\.—-]+/g, '_' # Replaces space, dot, dashes with underscore
    .replace /^_+|_+$/g, '' # Trim underscore

# Links:
# Duplicate `[href]` in empty `a[title]`
$('a[href]:not([title]), a[href][title=""]').each -> $(@).attr 'title', $(@).attr 'href'

# Close toc when anchor is clicked
$('#markdown-toc li a').on "click", ->
  $(@).parents('details').removeAttr 'open'
  return

# Citations:
# Duplicate `[cite]` in empty `[title]`
$('[cite]:not([title]), [cite][title=""]').each -> $(@).attr 'title', $(@).attr 'cite'

# Popover
# Activate open links `a[data-popover='id']`
$('[data-popover]').on "click", (e) ->
  e.preventDefault()
  popover = $(e.target).attr 'data-popover'
  $("##{ popover }")[0].showPopover()
  return
# Activate popclose links
$('[data-popclose]').on 'click', ->
  $(@).parent('[popover]')[0].hidePopover()

# Open all nav-side details
$('#nav-side details').each -> $(@).attr 'open', 'open'

@log = (string, classe = '', position = 'top') ->
  top = $("##{ position }").append "<div class='popover #{ classe }'>#{ string }</div>"
  return

# Short Url
short_url = (x) -> x.url.replace /https\:\/\/|\?_=\d+|api.github.com\//g, ''

# Encoding UTF-8 ⇢ base64 
B64encode = (str) ->
  btoa(encodeURIComponent(str).replace(/%([0-9A-F]{2})/g, (match, p1) -> return String.fromCharCode('0x' + p1)))
# Decoding base64 ⇢ UTF-8
B64decode = (str) ->
  decodeURIComponent(atob(str).split('').map((c) -> return '%' + ('00' + c.charCodeAt(0).toString(16)).slice(-2)).join(''))