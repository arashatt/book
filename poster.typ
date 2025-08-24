#import "@preview/dashing-dept-news:0.1.1": newsletter, article
#show: newsletter.with(
  title: [Chemistry Department],
  edition: [
    March 18th, 2023 \
    Purview College
  ],
  hero-image: (
    image: image("Animation.gif"),
    caption: [Award-wining science],
  ),
  publication-info: [
    The Dean of the Department of Chemistry. \
    Purview College, 17 Earlmeyer D, Exampleville, TN 59341. \
    #link("mailto:newsletter@chem.purview.edu")
  ],
)
