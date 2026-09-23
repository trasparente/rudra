# .prevent Class .preventDefault()
doc.on 'click', 'a.prevent', (e) -> e.preventDefault()
doc.on 'button', 'button.prevent', (e) -> e.preventDefault()
doc.on 'submit', 'form.prevent', (e) -> e.preventDefault()

# POPOVER
# -------------------------
# Dismiss top-bottom popovers
doc.on 'click', '#bottom .popover, #topper .popover', -> $(@).remove()

# Activate general click popover [data-popover='id']
doc.on "click", '[data-popover]', ->
  popover = $(@).attr 'data-popover'
  $("##{ popover }")[0].showPopover()
  return
# Activate popclose links
doc.on 'click', '[data-popclose]', ->
  $(@).parents('[popover]')[0].hidePopover()

# Eye button, password to text toggle
doc.on 'click', '[data-eye]', ->
  el = $ @
  target = $ "##{el.attr 'data-eye'}"
  type = target.attr 'type'
  if type is 'password'
    target.attr 'type', 'text'
  if type is 'text'
    target.attr 'type', 'password'
  el.find('span').toggle 0
  return

# ONLINE / OFFLINE
# Called from BODY
@online = -> html.addClass('online').removeClass 'offline'
@offline = -> html.addClass('offline').removeClass 'online'
# Initial call
if navigator.onLine then do online else do offline

# FOCUS / BLUR
# Called from BODY
@focus = -> html.addClass('focus').removeClass 'blur'
@blur = -> html.addClass('blur').removeClass 'focus'
if document.hasFocus() then do focus else do blur

# Hash, fragment identifier change
# Called from BODY
@onhashchange = -> console.log 'onhashchange', window.location.hash

# RESIZE EVENT
# Manage class `.fullscreen .mobile .desktop`
# Called from BODY attribute
@resize = ->
  # Fullscreen
  if window.innerHeight is screen.height and window.innerWidth is screen.width and window.innerWidth > 1000
    html.addClass('fullscreen not-desktop not-mobile').removeClass 'not-fullscreen desktop mobile'
  else
    html.addClass('not-fullscreen').removeClass 'fullscreen'
    # Mobile screen
    if window.innerWidth <= 650
      html.addClass('mobile not-tablet not-desktop').removeClass 'desktop tablet not-mobile'
    # Tablet
    else if window.innerWidth <= 1000
      html.addClass('tablet not-mobile not-desktop').removeClass 'desktop mobile not-tablet'
    # Desktop
    else html.addClass('desktop not-mobile not-tablet').removeClass 'mobile tablet not-desktop'

  # Check document SHOTER than window
  # Doesnt work if `<main>` has `flex-grow: 1`
  if window.innerHeight > document.body.scrollHeight
    html.addClass 'shorter'
  else html.removeClass 'shorter'
  return # End resize

# First run
do resize

# SCROLL Event
# Add `html.scrolled` when scroll > win height
win.scroll () ->
  if win.scrollTop() > win.height() / 5
    html.addClass('scrolled').removeClass 'unscrolled'
  else html.addClass('unscrolled').removeClass 'scrolled'
  # Apply sticky class to ToC
  if $('details.toc')[0]
    el = $('details.toc')[0]
    stickyTop = parseInt window.getComputedStyle(el).top
    currentTop = el.getBoundingClientRect().top
    el.classList.toggle "sticky", (currentTop == stickyTop) & (win.scrollTop() > 0)
  return