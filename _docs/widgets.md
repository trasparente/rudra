---
order: 25
---
# Widgets
{% include widgets/toc.html details='true' %}

## Popover
<button popovertarget='mypopover' popovertargetaction='show' title='Popover Button'>
  Show popover
</button>  

<a href='#' data-popover='mypopover'>Popover Link</a>

```html
<a href='#' data-popover='mypopover'>Popover Link</a>
```

<div id='mypopover' popover>
  {% include widgets/links/popclose.html %}
  <h2>Popover heading</h2>
  <p>
    This here is some very important content that we want to draw your
    attention to before you light dismiss it. Read it all, do not delay!
  </p>
</div>
## Tabs
<div class='tabs'>
  <div role='tablist'>
    <a href='#' role='tab'>Install</a>
    <a href='#' role='tab'>Configure</a>
    <a href='#' role='tab'>Customize</a>
  </div>
  <div role='tabpanel'>
    <h3>Install</h3>
    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit<br>sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
  </div>
  <div role='tabpanel'>
    <h3>Configure</h3>
    <p>Ut enim ad minim veniam, quis nostrud exercitation<br>ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
  </div>
  <div role='tabpanel'>
    <h3>Customize</h3>
    <p>Laboris nisi ut aliquip ex ea commodo consequat.</p>
  </div>
</div>
```html
<div class='tabs'>
  <div role='tablist'>
    <a href='#' role='tab'>First</a>
    <a href='#' role='tab'>Second</a>
    <a href='#' role='tab'>Third</a>
  </div>
  <div role='tabpanel'>
    First content
  </div>
  <div role='tabpanel'>
    Second content
  </div>
  <div role='tabpanel'>
    Third content
  </div>
</div>
```
