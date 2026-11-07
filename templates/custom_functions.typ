// Custom functions

// Horizontal lines
#let generic_horizontal_line(color) = align(center)[
  #line(
    length: 100%,
    stroke: 1pt + gradient.linear(
      color.transparentize(100%),
      color,
      color.transparentize(100%)
    )
  )
]

#let black_horizontal_line = generic_horizontal_line(rgb("#000000"))
#let red_horizontal_line = generic_horizontal_line(rgb("#e30d16"))
#let gray_horizontal_line = generic_horizontal_line(luma(200))


// ---------------------------------------------------------------------------


#let remark(title, body) = {
  let accent-color = rgb("#d42a42") // Red border and icon
  let bg-color = rgb("#fcf2f3")     // Light pink header background
  let border-color = rgb("#dddddd") // Light gray for standard borders

  block(
    width: 100%,
    stroke: (
      left: 3pt + accent-color,
      top: 0.5pt + border-color,
      right: 0.5pt + border-color,
      bottom: 0.5pt + border-color,
    ),
    radius: (right: 2pt),
    clip: true,
    grid(
      columns: 1,
      row-gutter: 0pt,
      // Header Section
      block(
        width: 100%,
        fill: bg-color,
        inset: (x: 1em, y: 0.8em),
        {
          // Custom Exclamation Icon
          let icon = box(
            baseline: 15%,
            circle(
              radius: 0.45em,
              stroke: 1.2pt + accent-color,
              inset: 0pt,
              align(center + horizon, text(fill: accent-color, size: 0.7em, weight: "bold")[!])
            )
          )
          
          icon
          h(0.5em)
          text(weight: "bold", fill: rgb("#000000"), title)
        }
      ),
      // Body Section
      block(
        width: 100%,
        fill: white,
        inset: (x: 1em, y: 1em),
        body
      )
    )
  )
}

#let idea_box(title, body) = {
  let accent-color = rgb("#107C41") 
  let bg-color = rgb("#F3F9F4")     
  let border-color = rgb("#dddddd")

  let lightbulb-icon = box(baseline: 20%, image("../res/icon/lightbulb.svg", width: 1.1em))

  block(
    width: 100%,
    stroke: (
      left: 3pt + accent-color,
      top: 0.5pt + border-color,
      right: 0.5pt + border-color,
      bottom: 0.5pt + border-color,
    ),
    radius: (right: 2pt),
    clip: true,
    grid(
      columns: 1,
      row-gutter: 0pt,
      block(
        width: 100%,
        fill: bg-color,
        inset: (x: 1em, y: 0.8em),
        {
          box(baseline: 20%, lightbulb-icon)
          h(0.4em)
          text(weight: "bold", fill: rgb("#333333"), title)
        }
      ),
      block(
        width: 100%,
        fill: white,
        inset: (x: 1em, y: 1em),
        body
      )
    )
  )
}


// Generic base function for color boxes
#let generic_box(title, accent-color, bg-color, body) = {
  let border-color = rgb("#dddddd")

  block(
    width: 100%,
    stroke: (
      left: 3pt + accent-color,
      top: 0.5pt + border-color,
      right: 0.5pt + border-color,
      bottom: 0.5pt + border-color,
    ),
    radius: (right: 2pt),
    clip: true,
    grid(
      columns: 1,
      row-gutter: 0pt,
      // Header
      block(
        width: 100%,
        fill: bg-color,
        inset: (x: 1em, y: 0.8em),
        text(weight: "bold", fill: rgb("#000000"), title)
      ),
      // Body
      block(
        width: 100%,
        fill: white,
        inset: (x: 1em, y: 1em),
        body
      )
    )
  )
}


// Specific color functions using the generic template
#let blue_box(title, body) = generic_box(title, rgb("#0056D2"), rgb("#F0F6FF"), body)
#let green_box(title, body) = generic_box(title, rgb("#107C41"), rgb("#F3F9F4"), body)
#let yellow_box(title, body) = generic_box(title, rgb("#FFB900"), rgb("#FFF9E6"), body)
#let red_box(title, body) = generic_box(title, rgb("#d42a42"), rgb("#fcf2f3"), body)
