// Main document

// Templates imports
#import "templates/template.typ": *

// Document informations
#show: project.with(
  title: "Document Template",
  authors: (
    "Author",
  ),
  date: "07.11.2026",
  version: "v1.0",
  has_title_page: false,
)


// And away we go!

= Introduction
#lorem(100)

#idea_box("This is an idea")[
  Great idea
]

#remark("This is a remark")[
  Maybe the idea is not so great
]

#generic_box("This is a generic box", rgb("#0056D2"), rgb("#F0F6FF"))[
  The color can be chosen
]


// Annexes
#show: annexes.with(active: true)

= Annexe 1
#lorem(100)


// Checkered flag!