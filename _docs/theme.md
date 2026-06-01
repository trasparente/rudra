---
order: 5
---
# Theme

## Colors

Three letters `var(--{ neon }[-{ dark/light }])`{:.language-sass}

{% assign hal = 'gry,blu,sky,cya,for,gre,yel,ora,red,pin,vio' | split: ',' %}
<div class='demo-colors'>{%- for n in hal -%}{%- include widgets/demo.html color=n %}{%- endfor -%}</div>

### Neon

Four letters `var(--{ neon }[-{ dark/light }])`{:.language-sass}

{% assign neon = 'dodg,bluu,aqua,jade,cora,suns,ruby' | split: ',' %}
<div id='demo-colors'>{%- for n in neon -%}{%- include widgets/demo.html color=n %}{%- endfor -%}</div>

## Fonts

{% assign fonts = 'ff-arial,ff-system-ui,ff-1234567,ff-micro,ff-micro-bold,ff-monospace' | split: ',' %}
<div class='demo-fonts'>{%- for f in fonts -%}<p class='{{ f }}'>.{{ f }}</p>
{%- endfor -%}</div>