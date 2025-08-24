#import "@preview/vercanard:1.0.3": *
#show: resume.with(
  // The title of your resume, generally your name
  name: "Your name",
  // The subtitle, which is the position you are looking for most of the time
  title: "What you are looking for",
  // The accent color to use (here a vibrant yellow)
  accent-color: rgb("f3bc54"),
  // the margins (only used for top and left page margins actually,
  // but the other ones are proportional)
  margin: 2.6cm,
  // The content to put in the right aside block
  aside: [
    = Contact

    // lists in the aside are right aligned
    - #link("mailto:example@example.org")
    - +33 6 66 66 66 66
  ]
)

// And finally the main body of your resume can come here
= Personal projects

#entry[Vercanard][A resume template for Typst][2023 — Typst]
