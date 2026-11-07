# Template Typst

A reusable [Typst](https://typst.app/) template for documents.

## Features

- Optional title page
- Logo in the header and title page
- Optional annexes
- Color boxes

## Minimal document

```typst
#import "templates/template.typ": *

#show: project.with(
  title: "Document",
  authors: ("Author",),
  date: "07.11.2026",
  version: "v1.0",
  has_title_page: false,
)

= Introduction

This is the document body.

#idea_box("Key idea")[
  Add supporting content here.
]
```

Set `has_title_page: true` to add a title page before the document body.

## Helpers

Set `has_title_page: true` to add a title page.

Set `active: true` to add an annex section.

### Callout boxes

Each callout takes a title followed by a content block:

```typst
#remark("Remark")[
  Important context.
]

#idea_box("Idea")[
  Useful suggestion.
]

#generic_box("Custom box", rgb("#0056D2"), rgb("#F0F6FF"))[
  Content with custom colors.
]
```

Predefined color variants are also available:

```typst
#blue_box("Blue") [Content]
#green_box("Green") [Content]
#yellow_box("Yellow") [Content]
#red_box("Red") [Content]
```