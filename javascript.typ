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
#set page(
  header: align(
    center,
    text(24pt)[#link("https://javascript.info/")[*#js*]]
  ),
)

= Browser Events
=== addEventLIstener
```js
element.addEventListener(event, handler, [options]);
```
