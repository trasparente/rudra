f_1 = $ '#add-field'
f_2 = $ '#add-field-form'

# When both present
if f_1.length and f_2.length then do ->
  # Prevent session caching
  f_1.trigger 'reset'
  edit = false
  name = $ '#name', f_2
  destination = $ '#fields', f_1
  selector = $ 'select#type', f_2
  container = $ '#add-field-container', f_2
  counter = $ '#counter', f_1

  # Counter validity messages
  counter.on 'input valid', (e) -> $(e.target)[0].setCustomValidity ''
  counter.on 'invalid', (e) -> $(e.target)[0].setCustomValidity 'Add a Field'

  # Destination Form
  # Reset
  f_1.on 'reset', -> destination.empty()
  # Add button
  f_1.on 'click', '#add-field-button', (e) ->
    $(e.target).blur()
    edit = false
    f_2.trigger 'reset'
    selector.trigger 'input'
    return

  # Edit field
  f_1.on 'click', '#fields label, #fields span', (e) ->
    el = $(e.target).parent '[data-input]'
    edit = JSON.parse $("script", el).text()
    name.val el.attr 'data-id' 
    selector.val edit['type']
    name.trigger 'input'
    selector.trigger 'input'
    return # End edit field

  # Submit
  f_1.on 'submit', ->
    $('#counter', f_1).trigger 'input'
    file_url = $('#file_url', f_1).val()
    out = {}
    $('script', f_1).each ->
      script = $ @
      out[script.attr('id')] = JSON.parse script.text()
      return
    unless file_url.endsWith '.json'
      out = jsyaml.dump out
    checkFile file_url, out
    return

  # Source Form
  # Validate NAME field for duplicates in destination
  # It's vital to set the message to an empty string if there are no errors.
  f_2.on 'input', '#name', (e) ->
    el = $ e.target
    if $("label[for='#{el.val()}']", destination).length and !edit
      el[0].setCustomValidity 'Duplicate field name'
    else el[0].setCustomValidity ''
    return # End validation id=name

  # Type Change Event
  f_2.on 'input', 'select#type', (e) ->
    type = $(e.target).val()
    template = $ $("#field-#{type}").clone().prop 'content'
    for p of edit
      if $("##{p}", template).length
        el = $("##{p}", template)
        if el.attr('type') in ['checkbox', 'radio'] and edit[p] is 'on'
          el.attr 'checked', true
        else el.val edit[p]
    container.empty().append template
    return # End change

  # Submit Event
  f_2.on 'submit', ->
    id = name.val()
    obj = {}
    partial = []
    # Serialize and loop
    serie = f_2.serialize().split('&').filter (e) ->
      split = e.split('=')
      if split[1] and split[0] != 'name'
        obj[split[0]] = split[1]
        partial.push e.replace '=', ': '
      return split[1]
    # Prepare elements
    json = $ '<script/>',
      'id': id
      'type': 'application/json'
      'text': JSON.stringify obj
    span = $ '<span/>',
      'class': 'description'
      'text': partial.join ', '
    label = $ '<label/>',
      'for': id
      'text': id
    data_div = $ '<div/>',
      'data-input': obj.type
      'data-id': id
      'data-popover': 'add-field-popover'
    insertion = data_div.append [label, span, json]
    # Append to Destination
    duplicate = $ "[data-id='#{id}']", destination
    if duplicate.length
      insertion.insertAfter duplicate
      duplicate.remove()
    else
      destination.append insertion
      # Increment counter
      enne = Number(counter.val()) + 1
      counter[0].value = enne
      # counter.attr 'value', enne
      counter.trigger 'input'
    # Reset and Close
    f_2.parent('[popover]')[0].hidePopover()

    return # End form submit

  return # End both present