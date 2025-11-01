#import emoji: star
#import "@preview/bone-resume:0.3.1": resume-init, resume-section
#show: resume-init.with(
  author: "Arash Attari",
  footer: [Powered by #link(
      "https://github.com/typst/packages/tree/main/packages/preview/bone-resume",
    )[BoneResume]],
)
#stack(dir: ltr, spacing: 1fr, text(24pt)[*Arash \ Attari*], stack(
  spacing: 0.75em,
  [Phone: +98915718894],
  [Email: #link("mailto:info@typeset.live")[info\@typeset.live]],
), stack(
  spacing: 0.75em,
  [GitHub: #link("https://github.com/arashatt")[github.com/arshatt]],
  [Personal Website: #link("https://www.bone6.top")[www.bone6.top]],
), move(dy: -2em, box(height: 84pt, width: 60pt, inset: 5pt, radius: 3pt, image("profile.jpg"))))

#v(-4em)

= Education Background
#stack(dir: ltr, spacing: 1fr,[#link("https://shahroodut.ac.ir/")[*Shahrood University of Technology*]
], stack(

  spacing: 0.75em,

[Computer Engineering (Bachelor’s Degree)] ,align(right,[ #datetime(year: 2019, month: 8, day:1).display() - #datetime(year: 2029, month: 8, day: 18).display()
])))


= Open Source Contributions
#resume-section(
  link("https://github.com/PaddlePaddle/CINN")[PaddlePaddle/CINN],
  "Compiler infrastructure for neural networks",
)[
  Added operators such as argmax, sort, gather, gather_nd, and scatter_nd; implemented CSE Pass and
  ReverseComputeInline primitives; and participated in completing some unit tests.  
  See #link(
    "https://github.com/PaddlePaddle/CINN/pulls?q=is%3Apr+author%3Azrr1999+is%3Aclosed",
  )[related PRs] for details.
]

#resume-section(
  link("https://github.com/PaddlePaddle/Paddle")[PaddlePaddle/Paddle],
  "High-performance single-machine, distributed training, and cross-platform deployment framework",
)[
  Added three operators: remainder\_, sparse_transpose, and sparse_sum; implemented TensorRT onehot
  operator conversion; and fixed several bugs.  
  See #link(
    "https://github.com/PaddlePaddle/Paddle/pulls?q=is%3Apr+author%3Azrr1999+is%3Aclosed",
  )[related PRs] for details.
]

= Work Experience
#resume-section(
  [#link("https://github.com/arashatt")[Baidu Paddle Framework Development – Dynamic to Static Group] (Online Internship)],
  "2023.07.01–2023.10.31",
)[
Main work involved development of #link("https://github.com/PaddlePaddle/PaddleSOT")[PaddleSOT].  
Main contributions included:  
+ Added registration priority mechanism and refactored the mock variable mechanism.  
+ Optimized bytecode simulation error messages and `GitHub Actions` log information.  
+ Implemented `VariableStack` and added support for subgraph interruption in `Python 3.11`.
]
#resume-section(
  [#link("https://github.com/PaddlePaddle/Paddle")[Baidu Paddle Framework Development – PIR Project] (Online Internship)],
  "2023.11.01–2024.05.31",
)[
Main work involved development of the PIR component in #link("https://github.com/PaddlePaddle/Paddle")[Paddle].  
Main contributions included:  
+ Upgrading Python API adaptations.  
+ Implementing the API type-checking generation mechanism.  
+ Adding the `InvalidType` error type.
]

= Skills
#let stars(num) = {
  for _ in range(num) {
    [#emoji.star]
  }
}

#let level(num, desc: none) = {
  if desc == none {
    if num < 3 {
      desc = "Basic understanding"
    } else if num < 5 {
      desc = "Proficient"
    } else if num < 7 {
      desc = "Skilled"
    } else {
      desc = "Expert"
    }
  }
  [#desc]
}

#grid(
  columns: (60pt, 1fr, auto),
  rows: auto,
  gutter: 6pt,
  "Python",
  [Experienced Python developer with a track record of building Django applications and resolving deployment-related bugs in production environments.

],
  level(8),
  "C/C++",
  [Considerable experience in large-scale open-source projects; skilled in writing high-performance operators],
  level(5),
  "CUDA",
  [Some experience in operator development for large-scale open-source projects],
  level(4),
  "JS/TS",
  [Experience developing multiple small-scale frontend or full-stack projects and winner of several awards],
  level(4),
  "Rust",
  [Experience Building CLI tools with the language in other open-source projects; familiar with basic toolchains],
  level(3),
  "Typst",
  [My daily document setting application; I created a website to enable people use #link("https://typeset.live")[Typst Online]],
  level(3),
  "LaTeX",
  [Used as the main documentation tool for at least three years during undergraduate studies],
  level(3),
)
