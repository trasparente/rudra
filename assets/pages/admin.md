---
permalink: admin
form:
  file_url:
    type: text
    description: |
      File URL inside `_data`
      Extensions `json`,`yml`,`yaml`
    pattern: "[\\w\\/]+\\.(json|yml|yaml)"
    required: true
---
# Admin

{% include widgets/form.html class='admin' id='add-field' %}

```liquid
{% raw %}{% include widgets/form.html class='admin' id='add-field' %}{% endraw %}
```

{% include widgets/api.html include='widgets/form' %}