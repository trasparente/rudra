---
order: 5
---
# Theme

- [Asciidoctor](https://docs.asciidoctor.org/asciidoc/latest/blocks/admonitions/)
- [Ghostty](https://ghostty.org/docs/install/build)
- [HTML roles](https://www.w3.org/WAI/ARIA/apg/practices/structural-roles/#when_to_use_structural_roles)

## Colors

Eleven three letters `var(--(xxx)[-<dark/light>])`{:.language-c}

{% assign hal = 'gry,blu,sky,cya,for,gre,yel,ora,red,pin,vio' | split: ',' %}
<div class='demo-colors'>{%- for n in hal -%}{%- include widgets/demo.html color=n %}{%- endfor -%}</div>

### Neon

Seven four letters `var(--<xxxx>[-<dark/light>])`{:.language-c}

{% assign neon = 'dodg,blue,aqua,jade,cora,suns,ruby' | split: ',' %}
<div id='demo-colors'>{%- for n in neon -%}{%- include widgets/demo.html color=n %}{%- endfor -%}</div>

## Fonts

{% assign fonts = 'ff-arial,ff-system-ui,ff-1234567,ff-micro,ff-micro-bold,ff-monospace' | split: ',' %}
<div class='demo-fonts'>{%- for f in fonts -%}<p class='{{ f }}'>.{{ f }}</p>
{%- endfor -%}</div>