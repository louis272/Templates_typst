// Main template

// Packages and templates imports
#import "@preview/simple-plot:0.9.0": plot, line-plot
#import "custom_functions.typ": *


// Main project function
#let project(title: "", authors: (), date: none, version: "", has_title_page: false, body) = {
  set document(author: authors, title: title)
  
  let header = grid(
    columns: (1fr, 1fr),
    image("../res/logo/logo.svg", width: 50%),
    align(right + horizon)[#title \ #date]
  )

  let footer = context [
    #set text(size: 10pt, fill: luma(100))
    
    #gray_horizontal_line
    #v(1mm)
    
    #grid(
        columns: (1fr, 1fr),
        // Version et auteurs
        align(left)[#version / #authors.join(", ")],
        
        // Numéro page
        align(right)[#counter(page).display("1 / 1", both: true)]
    )
  ]

  // Title page or not
  if has_title_page {
    // Title page
    page(header: none, footer: none, margin: auto)[
      #align(center + horizon)[
        #image("../res/logo/logo.svg", width: 60%)  
        #v(3em)
        #text(weight: 700, 3em, title)
        #v(1.5em)
        #text(size: 1.5em)[#authors.join(", ")]
        #v(1em)
        #text(size: 1.2em)[#date]
      ]
    ]
    // Reset page counter so title page is nbr 0
    counter(page).update(1)
  }

  set page(
    paper: "a4",
    margin: (left: 25mm, right: 25mm, top: 30mm, bottom: 30mm),

    header: align(left + bottom, header),
    header-ascent: 10%,
    footer: footer,
    footer-descent: 30%,

    numbering: "1 / 1",
    number-align: center,
  )

  // Title alone
  if not has_title_page {
    red_horizontal_line
    align(left)[
      #v(0.5cm)
      #block(text(weight: 700, 2.5em, title))
      #v(0.5cm)
    ]
  }

  // Main body
  set text(font: "Libertinus Serif", size: 12pt, lang: "fr")
  set heading(numbering: "1.1.")
  set par(justify: true)

  body
}


// Annexes function
#let annexes(active: true, body) = {
  if not active { return none }

  // Start on a new page
  pagebreak() 
  
  // Reset the heading counter
  counter(heading).update(0)
  
  // Change the numbering style to A.1.
  set heading(numbering: "A.1.")
  
  body
}