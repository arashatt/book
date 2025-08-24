#import "@preview/frame-it:1.2.0": *
#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.1": *
#import "@preview/showybox:2.0.4": showybox
#import "/templates/ebook.typ"
#show: ebook.project.with(title: "typst-book", spec: "book.typ")

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
    text(24pt)[#link("https://javascript.info/websocket")[*#ws*]]
  ),
)
simple API Call to establish #ws application:
```ts
let socket = new WebSocket("ws://javascript.info");
```

#showybox(
  sep: (dash: "dashed"),

  frame: (
    border-color: red.darken(60%),
    title-color: yellow.lighten(20%),
    body-color: yellow.lighten(70%)
  ),
  title-style: (
    color: black,
    weight: "regular",
    align: center
  ),
  shadow: (
    offset: 3pt,
  ),
  title: [#ws],
  [open: connection established],
  [message: data received],
  [error: websocket error],
  [close: connection closed]
)
Let's open a new connection:
```ts
socket.onopen = function(e) {
  alert("[open] Connection established");
  alert("Sending to server");
  socket.send("My name is John");
};
```
Later we can receive messages from our socket.
we do so by passing data to a function that can handle received data:
```ts
socket.onmessage = function(event) {
  alert(`[message] Data received from server: ${event.data}`);
};
```
#example[Note][
you can interpolate variables into #js string with `${}`]
