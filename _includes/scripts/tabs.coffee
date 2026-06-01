# Initial TABs reset
# --------------------------------------
$('.tabs').each ->
  $(@).find('[role="tablist"] a[role="tab"]:first-of-type').attr 'aria-selected', 'true'
  $(@).find('[role="tabpanel"]:not(:first)').addClass 'hidden'
  return

#
# TAB link click event
# --------------------------------------
$(document).on "click", "[role='tablist'] a[role='tab']", (e) ->
  e.preventDefault()
  # Tab links
  link = $ e.target
  tablist = link.parents '[role="tablist"]'
  tablist.find('a[role="tab"]').removeAttr 'aria-selected'
  link.attr 'aria-selected', 'true'
  # Tab panels
  tabcontainer = link.parents '.tabs'
  tabcontainer.find('[role="tabpanel"]').addClass 'hidden'
  tabcontainer.find('[role="tabpanel"]').eq(link.index()).removeClass 'hidden'
  return

{%- capture api -%}
Manage Show/Hide tabs with links

```html
<div tab-container>
  <div tab-links>
    <a href="#" data-tab>1</a>
    <a href="#" data-tab>2</a>
  </div>
  <div data-tab>
    <h1>Uno</h1>
  </div>
  <div data-tab>
    <h1>Due</h1>
  </div>
</div>
```
{%- endcapture -%}