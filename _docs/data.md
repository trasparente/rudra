---
order: 40
---
# Data

## Script `json`

Embed data in HTML with server-side rendering 

```html
<script id="data" type="application/json">
  {
    "userId": 1234,
    "userName": "Maria Cruz",
    "memberSince": "2000-01-01T00:00:00.000Z"
  }
</script>
<a href='{{ "assets/data.json" | absolute_url }}' title='data folder JSON' target='_blank'>DATA</a>
```

{% include widgets/api.html include='widgets/manage' %}