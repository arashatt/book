
#import "/book.typ": book-page
#show: book-page.with(title: "Hello, typst")
#import "@preview/frame-it:1.2.0": *
#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.1": *
#import "@preview/showybox:2.0.4": showybox

#show: codly-init.with()

#let (example, feature, variant, syntax) = frames(
  feature: ("Feature",),
  // For each frame kind, you have to provide its supplement title to be displayed
  variant: ("Variant",),
  // You can provide a color or leave it out and it will be generated
  example: ("Example", gray),
  // You can add as many as you want
  syntax: ("Syntax",),
)
// This is necessary. Don't forget this!
#show: frame-style(styles.boxy)
#let ws = "WebSocket"
#let js = "Javascript"
/*****************************
 *
 * START OF DOCUMENT
 *
 *****************************/

#let fmit = link("https://typst.app/universe/package/frame-it/")[*Frame-It*]
#set page(
  header: align(
    center,
    text(24pt)[#fmit],
  ),
)

In simpleset term #fmit defines custom environment in your document. #text(red)[two] predefined styles are included by default.
Initially this is a #link("https://typst.app/docs/reference/model/figure/")[figure] where its kind is frame. Everything that can be done with a
figure can also be done on frame. @intro is one such example of #fmit.

```typst
#show frame.where(kind: "frame"): set figure(outlined: flase)
```

#showybox(
  sep: (dash: "dashed"),

  frame: (
    border-color: red.darken(60%),
    title-color: yellow.lighten(20%),
    body-color: yellow.lighten(70%),
  ),
  title-style: (
    color: black,
    weight: "regular",
    align: center,
  ),
  shadow: (
    offset: 3pt,
  ),
  title: [#ws],
  [open: connection established],
  [message: data received],
  [error: websocket error],
  [close: connection closed],
)
#example[Info][sample info to show frame-it.] <intro>
