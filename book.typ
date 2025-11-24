
#import "@preview/shiroa:0.2.3": *

#show: book

#book-meta(
  title: "Book - Arash",
  authors: ("Arash Attari",),
  summary: [
	#prefix-chapter("welcome.typ")[Welcome],
	= Documentations
	- #chapter("template.typ")[Resume]
	- #chapter("poster.typ")[Demonstrating a poster]
	- #chapter("paper.typ")[Copied from accelerated-jacow]
	- #chapter("javascript.typ")[JavaScript]
	- #chapter("websocket.typ")[WebSocket]
	- #chapter("testcontainers.typ")[testcontainers]
	- #chapter("kratos.typ")[kratos]
	- #chapter("sqlx.typ")[sql]
  ]
)



// re-export page template
#import "/templates/page.typ": project
#let book-page = project
