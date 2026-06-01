---
order: 30
---
# Kramdown
{% include widgets/toc.html details='true' %}

> <https://kramdown.gettalong.org/>{:target="_blank"}

Kramdown is the default Markdown renderer for Jekyll and use the _GitHub Flavored Markdown (GFM) processor_.

Classes ids and attributes can be added with an Inline Attribute List (IAL) `{: .class #id key="value"}`{: .language-md}

## Table of content
```md
- toc
{:toc}
# Title
{:.no_toc}
```

Tables
------

Use `|----` for a new `<tbody>`{:.language-html} and `|====` for a `<tfoot>`{:.language-html}

|Header|Number|Boolean|
|---|--:|--:|
|String|<code>14.7</code>|<code>true</code>|
|===
|Footer

Code
----

### Inline

Surround with backticks `` `code` ``

- CSS `{:.language-css}` es. `body[hidden]{ color: hsl(30, 40%, 50%);}`{:.language-css}  
- HTML: `{:.language-html}` es. `<p data-type='ciro'></p>`{:.language-html}

Style with language: [Rouge languages list](https://rouge-ruby.github.io/docs/file.Languages.html){:.github}

<div class='columns' markdown='1'>
```c
// language-c
YYYY-MM-DDTHH:mm
url/path
```
```sass
// language_sass
YYYY-MM-DDTHH:mm
url/path
```
```make
# language-make
YYYY-MM-DDTHH:mm
url/path
```
```pony
// language-pony
YYYY-MM-DDTHH:mm
url/path
```
</div>

### Block
<div class='columns'>
<div markdown='1'>
__Fenced__  
Start: <code class='highlighter-rouge'>```yml</code>  
End: <code class='highlighter-rouge'>```</code>
```yml
city: 1
array: [1, "x"]
array:
  - 1
  - 2
  - three
```
</div>
<div markdown='1'>
__Kramdown code block__  
Start: `~~~ coffee`  
end: `~~~`
~~~ coffee
# Comment
console.log a, 'error'
c = (arg) -> arr.index()
$('body').append(arr)
~~~
</div>
<div markdown='1'>
__Indented by 4 spaces__  
Start: `{:.language-html}`  
End: emply line

{:.language-html}
    <!-- Comment -->
    <div id='go'>
      <a href="#url">text</a>
    </div>
</div>
</div>

## Blockquotes and quotes

Support `bg-{color}` classes, changing color set.
```markdown
> Example with cite attribute (source url)
{:cite="https://example.com"}
```
> Example with cite attribute (source url)
{:cite="https://example.com"}

**Inline quotation element**

```html
<q cite="{source url}">Quote</q>
```
<q cite="https://example.com">Quote</q>

## Typography

|Kramdown|Result
|:---|:---
|`__` or `**`|__Bold__
|`_` or `*`|_Italic_

|HTML|Result
|:---|:---
|`del`|<del>Deleted</del>
|`ins`|<ins>Inserted</ins>
|`abbr[title]`|<abbr title="Abbreviation">Abbreviation</abbr>
|`cite`|<cite>Cite</cite>
|`kbd`|<kbd>Ctrl + S</kbd>
|`samp`|<samp>Sample</samp>
|`mark`|<mark>Highlighted</mark>
|`s`|<s>Strikethrough</s>
|`u`|<u>Underline</u>
|`small`|<small>small</small>
|`sub`|Text<sub>Sub</sub>
|`sup`|Text<sup>Sup</sup>

## Abbreviations

Abbreviated text is written normally and below the text add  
`*[normally]: Abbreviation`

Rendered HTML code:
```html
<abbr title="Abbreviation">normally</abbr>
```

*[normally]: Abbreviation

## Footnotes

Text is followed[^1] by `[^1]` and below the text add `[^1]: Footnote`.  
The note will be added at the end[^where] of the document.

Rendered HTML code:
```html
<sup id="fnref:1" role="doc-noteref">
  <a href="#fn:1" class="footnote" rel="footnote">1</a>
</sup>

...

<div class="footnotes" role="doc-endnotes">
  <ol>
    <li id="fn:1" role="doc-endnote">
      <p> ...
        <a href="#fnref:1" class="reversefootnote" role="doc-backlink">&#8617;</a>
      </p>
    </li>
    ...
  </ol>
</div>
```

[^1]: Some *markdown* footnote definition
[^where]: End of page

## Definition lists

Elements: `<dl><dt><dd>`{:.language-html}  
Markdown: `: `&nbsp;for the descriptions  
- Empty line before new term
- End with a definition

```sass
term
: definition
: another definition

another term
and another term
: and a definition for the term
```
term
: definition
: another definition

another term
and another term
: and a definition for the term

## Tables
<table>
<thead>
  <tr>
    <th style="text-align: right">Serie</th>
    <th style="text-align: right">Practices</th>
    <th style="text-align: right">First</th>
    <th style="text-align: right">Last</th>
  </tr>
</thead>
<tbody>
<tr>
  <td style="text-align: right"><span class="fg-yel-light">Mandala</span></td>
  <td style="text-align: right" class="number">17</td>
  <td style="text-align: right"><time datetime="2026-02-18" title="18 feb 2026 01:00:00" class="past"><span>1 month ago</span></time></td>
  <td style="text-align: right"><time datetime="2026-03-17" title="17 mar 2026 01:00:00" class="past"><span>3 days ago</span></time></td>
</tr><tr>
  <td style="text-align: right"><span class="fg-blu-light">Universal</span></td>
  <td style="text-align: right" class="number">97</td>
  <td style="text-align: right"><time datetime="2025-07-13" title="13 lug 2025 02:00:00" class="past"><span>8 months ago</span></time></td>
  <td style="text-align: right"><time datetime="2026-02-17" title="17 feb 2026 01:00:00" class="past"><span>1 month ago</span></time></td>
</tr><tr>
  <td style="text-align: right"><span class="fg-dim">Null</span></td>
  <td style="text-align: right" class="number">332</td>
  <td style="text-align: right"><time datetime="2023-08-25" title="25 ago 2023 02:00:00" class="past"><span>3 years ago</span></time></td>
  <td style="text-align: right"><time datetime="2025-07-10" title="10 lug 2025 02:00:00" class="past"><span>8 months ago</span></time></td>
</tr><tr>
  <td style="text-align: right"><span class="fg-gre-light">First</span></td>
  <td style="text-align: right" class="number">1459</td>
  <td style="text-align: right"><time datetime="2016-01-07" title="7 gen 2016 01:00:00" class="past"><span>10 years ago</span></time></td>
  <td style="text-align: right"><time datetime="2025-03-26" title="26 mar 2025 01:00:00" class="past"><span>1 year ago</span></time></td>
</tr><tr>
  <td style="text-align: right"><span class="fg-red-light">Second</span></td>
  <td style="text-align: right" class="number">189</td>
  <td style="text-align: right"><time datetime="2020-01-05" title="5 gen 2020 01:00:00" class="past"><span>6 years ago</span></time></td>
  <td style="text-align: right"><time datetime="2025-05-07" title="7 mag 2025 02:00:00" class="past"><span>10 months ago</span></time></td>
</tr><tr>
  <td style="text-align: right">Total</td>
  <td style="text-align: right" class="number">2096</td>
  <td style="text-align: right">&nbsp;</td>
  <td style="text-align: right">&nbsp;</td>
</tr></tbody>
</table>

```html
<table>
  <caption>
    Personal weekly activities
  </caption>
  <colgroup>
    <col />
    <col span="5" class="weekdays" />
    <col span="2" class="weekend" />
  </colgroup>
  <thead>
    <tr>
      <th>Period</th>
      <th>Mon</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>a.m.</th>
      <td>Clean room</td>
    <tr>
      <th>p.m.</th>
      <td>Yoga</td>
    </tr>
  </tbody>
</table>
```

## Definitions, itemprop, data, var

```html
<p>A <dfn id='anchor-link'><abbr title="Hubble Space Telescope">HST</abbr></dfn> is a...</p>

<h1 itemscope>
  <data itemprop="product-id" value="9678AOU879">The Instigator 2000</data>
  The volume of a box is <var>l</var>
</h1>
```