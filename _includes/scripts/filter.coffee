reset_id_filter = (ele) ->
  el = $ ele
  id = el.attr 'data-id-filter'
  filter = $ "##{ id }"
  el.find("[data-id-toggle]").hide()
  el.find("[data-id-toggle='#{ filter.val() }']").show()
  console.log filter, filter.val()
  return

# Initial ID-FILTER reset
# --------------------------------------
$('[data-id-filter]').each ->
  el = $ @
  reset_id_filter @
  $("##{ el.attr 'data-id-filter' }").on 'change', -> reset_id_filter el
  return